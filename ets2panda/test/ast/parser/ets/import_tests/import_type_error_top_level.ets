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

import {inExport} from "./export_and_import_top_level"

let x = inExport

export function fooImport() {
    let x: String = /* @@ label */1
    return x
}

// used to give wrong output:
// TypeError: Type 'int' cannot be assigned to type 'String' [export_and_import_top_level.ets:21:1]

/* @@@ label Error TypeError: Type 'int' cannot be assigned to type 'String' */
