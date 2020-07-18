// VARIABLES
let result = 0;
let display_value = '';
let temp;
let ptCounter = 0;
let num1;
let num2;

const button_0 = document.querySelector('#button0');
const button_1 = document.querySelector('#button1');
const button_2 = document.querySelector('#button2');
const button_3 = document.querySelector('#button3');
const button_4 = document.querySelector('#button4');
const button_5 = document.querySelector('#button5');
const button_6 = document.querySelector('#button6');
const button_7 = document.querySelector('#button7');
const button_8 = document.querySelector('#button8');
const button_9 = document.querySelector('#button9');
const button_Pt = document.querySelector('#buttonPt');
const button_clear = document.querySelector('#clear');
const button_add = document.querySelector('#add');
const button_subtract = document.querySelector('#subtract');
const button_multiply = document.querySelector('#multiply');
const button_divide = document.querySelector('#divide');
const button_equal = document.querySelector('#equals');

document.addEventListener('keydown', event => {
        const key = event.key;
        //console.log(key);
        if (key === '0') {
          display_value = display_value + '0';
          temp = 0;
          display(display_value);
        } else if (key === '1') {
          display_value = display_value + '1';
          temp = 1;
          display(display_value);
        } else if (key === '2') {
          display_value = display_value + '2';
          temp = 2;
          display(display_value);
        } else if (key === '3') {
          display_value = display_value + '3';
          temp = 3;
          display(display_value);
        } else if (key === '4') {
          display_value = display_value + '4';
          temp = 4;
          display(display_value);
        } else if (key === '5') {
          display_value = display_value + '5';
          temp = 5;
          display(display_value);
        } else if (key === '6') {
          display_value = display_value + '6';
          temp = 6;
          display(display_value);
        } else if (key === '7') {
          display_value = display_value + '7';
          temp = 7;
          display(display_value);
        } else if (key === '8') {
          display_value = display_value + '8';
          temp = 8;
          display(display_value);
        } else if (key === '9') {
          display_value = display_value + '9';
          temp = 9;
          display(display_value);
        } else if (key === '.') {
          if (ptCounter == 0) {
            display_value = display_value + '.';
            ptCounter = 1;
            display(display_value);
          }
        } else if (key === '+') {
          num1 = temp;
          display_value = num1 + ' + ';
          temp = 0;
          ptCounter = 0;
          display(display_value);
          func = '+';
        } else if (key === '-') {
          num1 = temp;
          display_value = display_value + ' - ';
          temp = 0;
          ptCounter = 0;
          display(display_value);
          func = '-';
        } else if (key === '*') {
          num1 = temp;
          display_value = display_value + ' * ';
          temp = 0;
          ptCounter = 0;
          display(display_value);
          func = '*';
        } else if (key === '/') {
          num1 = temp;
          display_value = display_value + ' / ';
          temp = 0;
          ptCounter = 0;
          display(display_value);
          func = '/';
        } else if (key === '=' || key === 'Enter') {
          num2 = temp;
          if (num2 === 0 && func === '/' ) {
            display('ERROR - division by zero');
            num1 = 0;
            num2 = 0;
            temp = 0;
            ptCounter = 0;
            display_value = '';
          } else {
            result = operate(func,num1,num2);
            display(num1 + func + num2 + ' = ' + result);
            num1 = 0;
            num2 = 0;
            temp = 0;
            ptCounter = 0;
            display_value = '';
          }
        } else if (key === 'c') {
          display_value = '';
          temp = 0;
          ptCounter = 0;
          display(display_value);
        }
    })

// BUTTON RESPONSES
button_0.addEventListener('click', () => {
  display_value = display_value + '0';
  temp = 0;
  display(display_value);
})
button_1.addEventListener('click', () => {
  display_value = display_value + '1';
  temp = 1;
  display(display_value);
})
button_2.addEventListener('click', () => {
  display_value = display_value + '2';
  temp = 2;
  display(display_value);
})
button_3.addEventListener('click', () => {
  display_value = display_value + '3';
  temp = 3;
  display(display_value);
})
button_4.addEventListener('click', () => {
  display_value = display_value + '4';
  temp = 4;
  display(display_value);
})
button_5.addEventListener('click', () => {
  display_value = display_value + '5';
  temp = 5;
  display(display_value);
})
button_6.addEventListener('click', () => {
  display_value = display_value + '6';
  temp = 6;
  display(display_value);
})
button_7.addEventListener('click', () => {
  display_value = display_value + '7';
  temp = 7;
  display(display_value);
})
button_8.addEventListener('click', () => {
  display_value = display_value + '8';
  temp = 8;
  display(display_value);
})
button_9.addEventListener('click', () => {
  display_value = display_value + '9';
  temp = 9;
  display(display_value);
})
button_Pt.addEventListener('click', () => {
  if (ptCounter == 0) {
    display_value = display_value + '.';
    ptCounter = 1;
    display(display_value);
  }
})

button_add.addEventListener('click', () => {
  num1 = temp;
  display_value = display_value + ' + ';
  temp = 0;
  ptCounter = 0;
  display(display_value);
  func = '+';
})
button_subtract.addEventListener('click', () => {
  num1 = temp;
  display_value = display_value + ' - ';
  temp = 0;
  ptCounter = 0;
  display(display_value);
  func = '-';
})
button_multiply.addEventListener('click', () => {
  num1 = temp;
  display_value = display_value + ' * ';
  temp = 0;
  ptCounter = 0;
  display(display_value);
  func = '*';
})
button_divide.addEventListener('click', () => {
  num1 = temp;
  display_value = display_value + ' / ';
  temp = 0;
  ptCounter = 0;
  display(display_value);
  func = '/';
})

button_equal.addEventListener('click', () => {
  num2 = temp;
  if (num2 === 0 && func === '/' ) {
    display('ERROR - division by zero');
    num1 = 0;
    num2 = 0;
    temp = 0;
    ptCounter = 0;
    display_value = '';
  } else {
    result = operate(func,num1,num2);
    console.log(num1);
    console.log(num2);
    console.log(result);
    display(num1 + func + num2 + ' = ' + result);
    num1 = 0;
    num2 = 0;
    temp = result;
    ptCounter = 0;
    display_value = '';
  }
})

button_clear.addEventListener('click', () => {
  display_value = '';
  temp = 0;
  ptCounter = 0;
  display(display_value);
})

// FUNCTIONS
function display(display_value) {
  let display_box = document.querySelector('p');
  display_box.innerHTML = display_value;
}

function add(num1, num2) {
  console.log(num1);
  console.log(num2);
  result = num1 + num2;
  return result.toFixed(4);
}

function subtract(num1, num2) {
  result = num1 - num2;
  return result.toFixed(4);
}

function multiply(num1, num2) {
  result = num1 * num2;
  return result.toFixed(4);
}

function divide(num1, num2) {
  result = num1 / num2;
  return result.toFixed(4);
}

function operate(func, num1, num2) {
  if (func === "+") {
    result = add(num1, num2);
  } else if (func === "-") {
    result = subtract(num1, num2);
  } else if (func === "*") {
    result = multiply(num1, num2);
  } else if (func === "/") {
    result = divide(num1,num2);
  } else {
    result = "ERROR";
  }

  return result;
}
