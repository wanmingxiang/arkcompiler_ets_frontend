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

class A{}

@Retention("SOURCE")
@interface MyAnno {
    testProperty1: string
}

class B{
    @MyAnno({testProperty1: /* @@ label1 */A})
    x : int
    @MyAnno({testProperty1: /* @@ label2 */A})
    y : int
}


/* @@@ label1 Error TypeError: Class name 'A' used in the wrong context */
/* @@@ label1 Error TypeError: Type 'A' cannot be assigned to type 'String'  */
/* @@@ label1 Error TypeError: Invalid value for annotation field, expected a constant literal.  */
/* @@@ label2 Error TypeError: Class name 'A' used in the wrong context */
/* @@@ label2 Error TypeError: Type 'A' cannot be assigned to type 'String'  */
/* @@@ label2 Error TypeError: Invalid value for annotation field, expected a constant literal.  */
