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

class A<T> {
    A(a?: T | number[]) {
        if (a instanceof Error) {
            return this.D(a);
        } else if (a instanceof undefined) {
            return this.B(a);
        } else if (a instanceof number[]) {
            return this.E(a);
        } else {
            return this.C(a);
        }
    }

    B(b: undefined) {
        return "undefined";
    }

    C(c: T) {
        return "Generic";
    }

    D(d: Error) {
        return "Error";
    }

    E(e: number[]) {
        return "number[]"
    }
}

let a = new A<Error | number>();
assertEQ(a.A(Error()), "Error");
assertEQ(a.A(undefined), "undefined");
assertEQ(a.A(1), "Generic");
assertEQ(a.A([1, 2, 3]), "number[]")
