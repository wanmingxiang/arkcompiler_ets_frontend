/*
 * Copyright (c) 2022-2025 Huawei Device Co., Ltd.
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

{
    function rOnlyNum(num: readonly number[], num1: number[]): number {
        let arr: number[] = num as number[]
        let b = num[0]
        let c = num1[0]
        return arr[0]
    }

    let arr: number[] = [1,2,3]
    let arrNum = rOnlyNum(arr, arr)

    let s: number[] = [1,2,3]
    for (let c of s) {
        console.log(s)
    }
}
{
    function rOnlyNum(num: readonly ArrayLike<number>, num1: ArrayLike<number>): number {
        let arr: ArrayLike<number> = num as ArrayLike<number>
        let b = num[0]
        let c = num1[0]
        return arr[0]
    }

    let arr: ArrayLike<number> = [1,2,3]
    let arrNum = rOnlyNum(arr, arr)

    let s: ArrayLike<number> = [1,2,3]
    for (let c of s) {
        console.log(s)
    }
}
{
    function rOnlyNum(num: readonly ConcatArray<number>, num1: ConcatArray<number>): number {
        let arr: ConcatArray<number> = num as ConcatArray<number>
        let b = num[0]
        let c = num1[0]
        return arr[0]
    }

    let arr: ConcatArray<number> = [1,2,3]
    let arrNum = rOnlyNum(arr, arr)

    let s: ConcatArray<number> = [1,2,3]
    for (let c of s) {
        console.log(s)
    }
}
{
    function rOnlyNum(num: readonly ReadonlyArray<number>, num1: ReadonlyArray<number>): number {
        let arr: ReadonlyArray<number> = num as ReadonlyArray<number>
        let b = num[0]
        let c = num1[0]
        return arr[0]
    }

    let arr: ReadonlyArray<number> = [1,2,3]
    let arrNum = rOnlyNum(arr, arr)

    let s: ReadonlyArray<number> = [1,2,3]
    for (let c of s) {
        console.log(s)
    }
}
{
    function rOnlyNum(num: readonly Array<number>, num1: Array<number>): number {
        let arr: Array<number> = num as Array<number>
        let b = num[0]
        let c = num1[0]
        return arr[0]
    }

    let arr: Array<number> = [1,2,3]
    let arrNum = rOnlyNum(arr, arr)

    let s: Array<number> = [1,2,3]
    for (let c of s) {
        console.log(s)
    }
}
