/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

#ifndef ES2PANDA_UTIL_INCLUDE_TS_QUALIFIED_NAME_BUILDER
#define ES2PANDA_UTIL_INCLUDE_TS_QUALIFIED_NAME_BUILDER

#include "ir/ts/tsQualifiedName.h"
#include "astBuilder.h"

namespace ark::es2panda::ir {

class TSQualifiedNameBuilder : public AstBuilder<ir::TSQualifiedName> {
public:
    explicit TSQualifiedNameBuilder(ark::ArenaAllocator *allocator) : AstBuilder(allocator) {}

    TSQualifiedNameBuilder &SetLeft(Expression *left)
    {
        left_ = left;
        return *this;
    }

    TSQualifiedNameBuilder &SetRight(Identifier *right)
    {
        right_ = right;
        return *this;
    }

    TSQualifiedName *Build()
    {
        auto node = AllocNode(left_, right_, Allocator());
        return node;
    }

private:
    Expression *left_ {};
    Identifier *right_ {};
};

}  // namespace ark::es2panda::ir
#endif  // ES2PANDA_UTIL_INCLUDE_TS_QUALIFIED_NAME_BUILDER
