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

class A {
    public x : int;

    public constructor() {
        this(5);
    }

    public constructor(
        let tuple: {{c.to_type}} = {{caches.value}};
        let a : A = new A(...tuple);
        let method_result = A.bar(...tuple);
    ) {
        this.x = a;
    }
}

/* @@? 23:23 Error TypeError: Only abstract or native methods can't have body. */
/* @@? 24:9 Error SyntaxError: Parameter declaration should have an explicit type annotation. */
/* @@? 24:9 Error SyntaxError: Unexpected token, expected ',' or ')'. */
/* @@? 24:9 Error SyntaxError: Unexpected token 'let'. */
/* @@? 24:9 Error SyntaxError: Unexpected token, expected an identifier. */
/* @@? 24:20 Error SyntaxError: Invalid Type. */
/* @@? 24:20 Error SyntaxError: Unexpected token '{'. */
/* @@? 24:21 Error SyntaxError: Unexpected token '{'. */
/* @@? 24:23 Error SyntaxError: Field type annotation expected. */
/* @@? 24:23 Error SyntaxError: Unexpected token '.'. */
/* @@? 24:31 Error SyntaxError: Field type annotation expected. */
/* @@? 24:32 Error SyntaxError: Unexpected token '}'. */
/* @@? 24:34 Error SyntaxError: Unexpected token '='. */
/* @@? 24:37 Error SyntaxError: Unexpected token. */
/* @@? 24:38 Error SyntaxError: Unexpected token. */
/* @@? 24:51 Error SyntaxError: Unexpected token '}'. */
/* @@? 25:21 Error TypeError: No matching construct signature for class_cyclic_constructor.A(...tuple) */
/* @@? 25:30 Error TypeError: Unresolved reference tuple */
/* @@? 26:31 Error TypeError: Property 'bar' does not exist on type 'A' */
/* @@? 26:31 Error TypeError: Property 'bar' does not exist on type 'A' */
/* @@? 27:5 Error SyntaxError: Unexpected token ')'. */
/* @@? 28:9 Error TypeError: Cannot reference 'this' in this context. */
/* @@? 28:14 Error TypeError: Property 'x' does not exist on type 'Error' */
/* @@? 30:1 Error SyntaxError: Unexpected token '}'. */