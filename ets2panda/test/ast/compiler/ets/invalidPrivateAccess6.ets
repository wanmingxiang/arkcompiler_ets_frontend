/*
 * Copyright (c) 2021-2025 Huawei Device Co., Ltd.
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

class Outer {
    /* @@ label */class A {
        private a: int = 12;
    }

    /* @@ label1 */class B {
        foo(): void {
            let a: A = new A();
            a.a = 13;
        }
    }
}


class C {
    private c: int = 12;
}

class D {
    foo(): void {
        let c: C = new C();
        c.c = 13;
    }
}

/* @@@ label Error SyntaxError: Unexpected token. A constructor, method, accessor, or property was expected.  */
/* @@@ label1 Error SyntaxError: Unexpected token. A constructor, method, accessor, or property was expected. */
/* @@? 37:11 Error TypeError: Property c is not visible here. */
