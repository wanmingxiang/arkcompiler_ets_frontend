/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <algorithm>
#include <iostream>
#include <ostream>
#include <string>
#include <cstring>

#include "os/library_loader.h"

#include "public/es2panda_lib.h"
#include "util.h"

/*
 * Covered C API List:
 *   AstNodeDumpEtsSrcConst
 *   AstNodeSetParent
 *   ContextProgram
 *   CreateAnnotationDeclaration
 *   CreateConfig
 *   CreateContextFromString
 *   DestroyConfig
 *   ProceedToState
 *   ProgramAst
 */

// NOLINTBEGIN
static std::string source = R"(
@Component()
class A {}
)";

static es2panda_Impl *impl = nullptr;
es2panda_Context *context = nullptr;

static es2panda_AstNode *CreateAnnotationDeclaration()
{
    es2panda_AstNode *annotationId = CreateIdentifierFromString(context, "Component");
    es2panda_AstNode *annotation = impl->CreateAnnotationDeclaration(context, annotationId);
    impl->AstNodeSetParent(context, annotationId, annotation);
    return annotation;
}

int main(int argc, char **argv)
{
    if (argc < MIN_ARGC) {
        return INVALID_ARGC_ERROR_CODE;
    }

    if (GetImpl() == nullptr) {
        return NULLPTR_IMPL_ERROR_CODE;
    }
    impl = GetImpl();
    std::cout << "LOAD SUCCESS" << std::endl;

    const char **args = const_cast<const char **>(&(argv[1]));
    auto config = impl->CreateConfig(argc - 1, args);
    context = impl->CreateContextFromString(config, source.data(), argv[argc - 1]);
    if (context == nullptr) {
        std::cerr << "FAILED TO CREATE CONTEXT" << std::endl;
        return NULLPTR_CONTEXT_ERROR_CODE;
    }

    impl->ProceedToState(context, ES2PANDA_STATE_PARSED);
    CheckForErrors("PARSE", context);

    es2panda_AstNode *programNode = impl->ProgramAst(context, impl->ContextProgram(context));

    es2panda_AstNode *annotation = CreateAnnotationDeclaration();
    PrependStatementToProgram(context, programNode, annotation);

    // dump src after change
    std::cout << "SRC DUMP AFTER ADD ANNOTATION:" << std::endl;
    std::cout << impl->AstNodeDumpEtsSrcConst(context, programNode) << std::endl;

    impl->ProceedToState(context, ES2PANDA_STATE_BOUND);
    CheckForErrors("BOUND", context);

    impl->ProceedToState(context, ES2PANDA_STATE_CHECKED);
    CheckForErrors("CHECKED", context);

    impl->AstNodeRecheck(context, programNode);

    impl->ProceedToState(context, ES2PANDA_STATE_LOWERED);
    CheckForErrors("LOWERED", context);

    impl->ProceedToState(context, ES2PANDA_STATE_ASM_GENERATED);
    CheckForErrors("ASM", context);

    impl->ProceedToState(context, ES2PANDA_STATE_BIN_GENERATED);
    CheckForErrors("BIN", context);
    impl->DestroyConfig(config);

    return 0;
}

// NOLINTEND
