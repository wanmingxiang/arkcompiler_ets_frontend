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

let line = 0;
let pixelOffset = 0;
let weight = 1;
let output = new Array<number>(1, 2, 3, 4);
let buffer = new Array<number>(5, 6, 7, 8);
output[line++] += buffer[pixelOffset];
assertEQ(line, 1);
assertEQ(output[0], 6);
