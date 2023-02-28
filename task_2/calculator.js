// 2.Написать модуль, который способен выполнять операции с числами любой длины.
// 4 метода для сложения, умножения, вычитания и деления.

// Вычисления производятся для целых неотрицательных чисел

class BigIntNumber {
    #number = [];
    #base = 10;

    constructor(str) {
        for (let digit of str) {
            this.#number.push(digit << '');
        }
        
        this.#number.reverse();
    }

    writeReversed() {
        console.log( this.#number.join('') );
    }

    write() {
        let str = this.#number.reverse().join('').replace(/^0+/, '');
        if (str === '') {
            console.log('0');
        } else {
            console.log( str );
        }
    }

    getSum(a) {
        let result = [];
        let carry = 0;

        for (let i = 0; i < Math.min(a.#number.length, this.#number.length); i++) {
            let curSum = carry + a.#number[i] + this.#number[i];
            result.push(curSum % this.#base);
            carry = Math.floor(curSum / this.#base);
        }

        for (let i = Math.min(a.#number.length, this.#number.length); i < Math.max(a.#number.length, this.#number.length); i++) {
            if (a.#number.length > this.#number.length) {
                let curSum = carry + a.#number[i];
                result.push(curSum % this.#base);
                carry = Math.floor(curSum / this.#base);
            } else {
                let curSum = carry + this.#number[i];
                result.push(curSum % this.#base);
                carry = Math.floor(curSum / this.#base);
            }
        }

        if (carry != 0) {
            result.push(carry);
        }

        return new BigIntNumber( result.reverse().join('') );
    }

    getSub(a) {
        let result = [];
        let carry = 0;

        if (a.lessOrEqual(this)) {
            for (let i = 0; i < a.#number.length; i++) {
                let curSub = this.#number[i] - a.#number[i] - carry;
                if (curSub < 0) {
                    curSub += 10;
                    carry = 1;
                } else {
                    carry = 0;
                }

                result.push(curSub);
            }

            for (let i = a.#number.length; i < this.#number.length; i++) {
                if (this.#number[i] - carry < 0) {
                  result.push(this.#number[i] + 10 - carry);
                 carry = 1;
                } else {
                    result.push(this.#number[i] - carry);
                    carry = 0;
                }
            }

            return new BigIntNumber( result.reverse().join('') );
        } else {
            for (let i = 0; i < this.#number.length; i++) {
                let curSub = a.#number[i] - this.#number[i] - carry;
                if (curSub < 0) {
                    curSub += 10;
                    carry = 1;
                } else {
                  carry = 0;
                }

                result.push(curSub);
            }

            for (let i = this.#number.length; i < a.#number.length; i++) {
                if (a.#number[i] - carry < 0) {
                    result.push(a.#number[i] + 10 - carry);
                    carry = 1;
                } else {
                    result.push(a.#number[i] - carry);
                    carry = 0;
                }
            }
            
            return new BigIntNumber( '-' + result.reverse().join('') );        
        }
    }

    getMulti(a) {
        let result = [];

        for (let i = 0; i < this.#number.length; i++) {
            for (let j = 0; j < a.#number.length; j++) {
                let multiply = this.#number[i] * a.#number[j];
                result[i + j] = (result[i + j]) ? result[i + j] + multiply : multiply;
            }
        }

        for (let i = 0; i < result.length; i++) {
            let num = result[i] % this.#base;
            let move = Math.floor(result[i] / this.#base);
            result[i] = num;
        
            if (result[i + 1]) {
                result[i + 1] += move;
            } else if (move != 0) {
                result[i + 1] = move;
            }
        }

        return new BigIntNumber( result.reverse().join('') );
    }

    getDivOnShortInt(a) {
        let maxLength = Math.max(this.#number.length, a.#number.length);

        let divid = this.#number.reverse();
        let denom = a.#number.reverse();

        let remain = 0;
        for (let i = 0; i < maxLength; i++) {
            remain = remain * this.#base + divid[i];
            divid[i] = Math.floor(remain / denom[0]);
            remain %= denom[0];
        }

        return new BigIntNumber( divid.join('') );
    }

    lessOrEqual(a) {
        if (this.#number.length < a.#number.length) {
            return true;
        } else if (this.#number.length > a.#number.length) {
            return false;
        } else {
            for (let i = this.#number.length - 1; i > 0; i--) {
                if (this.#number[i] > a.#number[i]) {
                    return false;
                }
                if (this.#number[i] < a.#number[i]) {
                    return true;
                }
            }
    
            return true;
        }
    }
}

// Ввод неотрицательных строковых представлений чисел
let str1 = '4286666200';
let str2 = '0';

let num1 = new BigIntNumber(str1);
let num2 = new BigIntNumber(str2);

num1.getSum(num2).write();

if (num1.lessOrEqual(num2)) {
    num2.getSub(num1).write();
} else {
    num1.getSub(num2).write();
}

num1.getMulti(num2).write();

if (str2 === '0') {
    console.log('Делить на 0 нельзя, исправьте делитель');
} else if (str2.length > 1) {
    console.log('Делитель должен быть коротким, <= 9');
} else {
    num1.getDivOnShortInt(num2).write();
}