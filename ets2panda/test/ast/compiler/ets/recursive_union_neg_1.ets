/*
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
class A<T extends A<T>>{}
class D extends A<D>{}
class B extends A<B>{}
class T<P extends B|D>{}
class C extends A/* @@ label */<B|D|C>{}
/* Constraint: B|D|C <: A<B|D|C>, but B is not a subtype of A<B> due to T invariance */

/* @@@ label Error TypeError: Type B|D|C is not assignable to constraint type A<B|D|C>  */
