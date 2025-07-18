/*
 * Copyright (c) 2021 - 2025 Huawei Device Co., Ltd.
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

#ifndef ES2PANDA_COMPILER_CHECKER_ETS_CONVERSION_H
#define ES2PANDA_COMPILER_CHECKER_ETS_CONVERSION_H

#include "checker/types/type.h"
#include "checker/types/typeRelation.h"

namespace ark::es2panda::checker::conversion {
void Identity(TypeRelation *relation, Type *source, Type *target);

void WideningPrimitive(TypeRelation *relation, Type *source, Type *target);
void NarrowingPrimitive(TypeRelation *relation, Type *source, Type *target);
void WideningNarrowingPrimitive(TypeRelation *relation, ByteType *source, CharType *target);

void WideningReference(TypeRelation *relation, ETSObjectType *source, ETSObjectType *target);
void WideningReference(TypeRelation *relation, ETSArrayType *source, ETSObjectType *target);
void WideningReference(TypeRelation *relation, ETSArrayType *source, ETSArrayType *target);

void NarrowingReference(TypeRelation *relation, ETSObjectType *source, ETSObjectType *target);
void NarrowingReference(TypeRelation *relation, ETSObjectType *source, ETSArrayType *target);
void NarrowingReference(TypeRelation *relation, ETSArrayType *source, ETSArrayType *target);
void NarrowingReference(TypeRelation *relation, ETSObjectType *source, ETSTupleType *target);

ETSObjectType *Boxing(TypeRelation *relation, Type *source);
Type *Unboxing(TypeRelation *relation, ETSObjectType *source);

void UnboxingWideningNarrowingPrimitive(TypeRelation *relation, ETSObjectType *source, Type *target);
void UnboxingNarrowingPrimitive(TypeRelation *relation, ETSObjectType *source, Type *target);
void UnboxingWideningPrimitive(TypeRelation *relation, ETSObjectType *source, Type *target);
void NarrowingReferenceUnboxing(TypeRelation *relation, ETSObjectType *source, Type *target);
void BoxingWideningReference(TypeRelation *relation, Type *source, ETSObjectType *target);

void String(TypeRelation *relation, Type *source);
void Forbidden(TypeRelation *relation);
}  // namespace ark::es2panda::checker::conversion

#endif
