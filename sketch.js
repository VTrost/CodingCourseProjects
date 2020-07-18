
const box = document.querySelector('#box');
const body = document.querySelector('body');
const reset = document.querySelector('#reset');

let size;

reset.addEventListener('click', () => {
    box.querySelectorAll('*').forEach(n => n.remove());
    size = prompt('number: ');
    setGrid(size);
})



function setGrid(size) {
    let divName = '0';
    let count = 0;
    let row = 0;
    let col = 1;

    let sizeSquared = size ** 2;
    for(i=1; i < (sizeSquared+1); i++) {
        divName = 'grid' + i;
        row = (i%size) + 1;

        if(count == size){
            count = 0;
            col += 1;
        }
        count += 1;
        
        const newDiv = document.createElement(divName);
        newDiv.style['background-color'] = 'white';
        newDiv.style.borderStyle = 'solid';
        newDiv.style.borderWidth = '1px';
        newDiv.style.borderColor = 'black';
        newDiv.style['grid-area'] = row + '/' + col + '/' + row + '/' + col;
        newDiv.onmouseover = function() {newDiv.style['background-color'] = 'black'};
        box.appendChild(newDiv);
    }
}

