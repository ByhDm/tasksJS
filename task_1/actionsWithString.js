// Методы модуля
// 1.1. Преобразование строки к нижнему регистру, но первая буква большая.

function convertStrToLowercase(str) {
    return str[0].toUpperCase() + str.slice(1).toLowerCase();
}

alert( 'ABSDC -> ' + convertStrToLowercase("ABSDC") );

// 1.2. Преобразование строки с целью правильно расстановки пробелов.

function convertStrToArrangementSpace(str) {
    return str.replaceAll(",", ", ")
              .replaceAll(" ,", ", ")
              .replaceAll(".", ". ")
              .replaceAll(" .", ". ")
              .split(' ')
              .filter(element => element !== '')
              .join(' ');
}

let s = "Вот пример строки,в которой     используются знаки препинания.После знаков должны стоять пробелы , а перед знаками их быть не должно .    Если есть лишние подряд идущие пробелы, они должны быть устранены.";

alert( s + '\n\n' + convertStrToArrangementSpace(s) );

// 1.3. Подсчитывающие кол-во слов в строке.

function countWordInLine(str) {
    return str.replaceAll(",", " , ")
              .replaceAll(".", " . ")
              .split(' ')
              .filter(element => element !== '' && element !== '.'
                                                && element !== ',')
              .length;
}

alert( `${s}\n\n Количество слов в строке = ${countWordInLine(s)}\n\n`);

// 1.4. Подсчитывающий, уникальные слова.

function countUniqueWordInLine(str) {
    let words = str.replaceAll(",", " , ")
                   .replaceAll(".", " . ")
                   .split(' ')
                   .filter(element => element !== '' && element !== '.'
                                      && element !== ',');

    let wordsCount = words.reduce(function (count, word) {
        if(count[word.toLowerCase()]) {
            count[word.toLowerCase()]++;
        } else {
            count[word.toLowerCase()] = 1;
        }
                                       
        return count;
    }, {});

    for (let word in wordsCount) {
        console.log('Слово "%s" встречается %d раз', word, wordsCount[word]);
    }

    return 'Метод отработал, результаты в консоли браузера';
}

let template = "Текст, в котором слово текст несколько раз встречается и слово тоже";

alert( countUniqueWordInLine(template) );