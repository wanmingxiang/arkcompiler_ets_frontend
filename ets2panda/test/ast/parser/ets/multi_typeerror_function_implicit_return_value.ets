
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

function fn(i: int) { 
  if (i > 0) { 
   return true;
  }
  return /* @@ label */0; 
  return /* @@ label1 */1.1; 
}

function main() {
  let a = fn(0);
}


/* @@@ label Error TypeError: Function cannot have different primitive return types, require 'boolean', found 'int'  */
/* @@@ label1 Error TypeError: Function cannot have different primitive return types, require 'boolean', found 'double'  */
