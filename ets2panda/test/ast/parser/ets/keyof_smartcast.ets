/*
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

class A{
  field1:number = 10;
  private field2:number = 20;
  foo(){}
}

function foo(c: (keyof A)|"abcd"|A|undefined): string {
  if (c instanceof (keyof A))  {
    assertEQ(c, "field1")
    return "Case 1";
  } else if (c instanceof "abcd") {
    assertEQ(c, "abcd")
    return "Case 2";
  } else if (c instanceof A) {
    assertEQ(c.field1, 0)
    return "Case 3";
  } else {
    return "Case 4";
  }
}

function main(): void {
  /* @@ label1 */foo(/* @@ label2 */"field2");
  /* @@ label3 */foo(/* @@ label4 */"other field");
}


/* @@@ label1 Error TypeError: No matching call signature for foo("field2")  */
/* @@@ label2 Error TypeError: Type '"field2"' is not compatible with type '"abcd"|A|undefined|"foo"|"field1"' at index 1  */
/* @@@ label3 Error TypeError: No matching call signature for foo("other field")  */
/* @@@ label4 Error TypeError: Type '"other field"' is not compatible with type '"abcd"|A|undefined|"foo"|"field1"' at index 1  */
