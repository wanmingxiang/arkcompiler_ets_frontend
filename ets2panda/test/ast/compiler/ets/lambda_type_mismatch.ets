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

let foa:(c:string, ...args:number[])=>void = (c:number, ...args:number[])=>{}

let fob:(...args:number[])=>number = (...args:number[]) =>{}

let foc:(c:string, ...args:number[])=>string = (c:number, ...args:string[]):string=>{}

/* @@? 16:46 Error TypeError: Type '(c: Double, ...args: double[]) => void' cannot be assigned to type '(c: String, ...args: double[]) => void' */
/* @@? 18:38 Error TypeError: Type '(...args: double[]) => void' cannot be assigned to type '(...args: double[]) => Double' */
/* @@? 20:48 Error TypeError: Type '(c: Double, ...args: String[]) => String' cannot be assigned to type '(c: String, ...args: double[]) => String' */
