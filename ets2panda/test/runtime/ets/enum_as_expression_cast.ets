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

enum E {
    A = 100, 
    B = 200
}

function main() {
    assertEQ(E.A.toString(), "100")         // E.A.toString()                      
    assertEQ(E.A as int, 100)               // cast(E.A) to int, E.A is a index    
    assertEQ(E.B.toString(), "200")         // E.B.toString()                      
    assertEQ(E.B as number, 200)            // cast(E.B) to number, E.B is a index 
    assertEQ(E.A.valueOf() as int, 100)     // get value of E.A                    
    assertEQ(E.B.valueOf() as number, 200)  // get value of E.B                    
}