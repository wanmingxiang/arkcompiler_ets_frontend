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

class ReadonlyPerson {
    readonly /* @@ label */name: string;
    readonly age: number;
}

function updatePerson(person: ReadonlyPerson): ReadonlyPerson {
    person.name = "Bob"; //CTE
    return person;
}
function main(): void {
    let person: ReadonlyPerson = {name: "Alice", age:22};
    updatePerson(person);
}

/* @@@ label Error TypeError: Cannot assign to a readonly variable name  */
