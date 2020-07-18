let computerMove;
let humanMove;
let humanScore = 0;
let computerScore = 0;
let result = 'No game yet';

const compStatus = document.querySelector('#compStatus');
const restartGame = document.querySelector('#restart');
const rock = document.querySelector('#rock');
const paper = document.querySelector('#paper');
const scissors = document.querySelector('#scissors');


rock.addEventListener('click', () => {
    humanMove = 'rock';
    playRoundAndCalcScore(humanMove)
})

paper.addEventListener('click', () => {
    humanMove = 'paper';
    playRoundAndCalcScore(humanMove)
})

scissors.addEventListener('click', () => {
    humanMove = 'scissors';
    playRoundAndCalcScore(humanMove)
})

restart.addEventListener('click', () => {
    humanScore = 0;
    computerScore = 0;
    console.log(humanScore);
    console.log(computerScore);

    const humanScorePrint = document.querySelector('#humanScore');
    humanScorePrint.textContent = 'Human score: ' + humanScore;
    const computerScorePrint = document.querySelector('#computerScore');
    computerScorePrint.textContent = 'Computer score: ' + computerScore;
})



function playRoundAndCalcScore(humanMove) {
    computerMove = computerPlay();
    result = playRound(humanMove,computerMove);
    humanScore = calcHumanPoints(humanScore,result);
    computerScore = calcComputerPoints(computerScore,result);
    humanScore = setHumanScoreForNextRound(humanScore,computerScore);
    computerScore = setComputerScoreForNextRound(humanScore,computerScore);
    console.log(humanScore);
    console.log(computerScore);

    const humanScorePrint = document.querySelector('#humanScore');
    humanScorePrint.textContent = 'Human score: ' + humanScore;
    const computerScorePrint = document.querySelector('#computerScore');
    computerScorePrint.textContent = 'Computer score: ' + computerScore;
}

function calcHumanPoints(humanScore, result) {
    if(result === 1){
        humanScore += 1;
    }
    if(humanScore === 5) {
        alert('You win!');
    }
    return humanScore
}

function calcComputerPoints(computerScore, result) {
    if(result === 0){
        computerScore += 1;
    }
    if(computerScore === 5) {
        alert('GAME OVER: You lose!');
    }
    return computerScore
}

function setHumanScoreForNextRound(humanScore,computerScore) {
    if(humanScore===5 || computerScore==5){
        return 0;
    } else {
        return humanScore;
    }
}

function setComputerScoreForNextRound(humanScore,computerScore) {
    if(humanScore===5 || computerScore==5){
        return 0;
    } else {
        return computerScore;
    }
}

function playRound(humanMove, computerMove) {
    humanMove = humanMove.toLowerCase();
    computerMove = computerMove.toLowerCase();

    if (humanMove === 'rock') {
        if(computerMove === 'rock'){
            alert("it's a draw");
            return 'draw';
        }
        else if (computerMove === 'paper'){
            alert('You lose to paper');
            return 0;
        }
        else if (computerMove === 'scissors') {
            alert('You win against scisors');
            return 1;
        }
        else {
            alert('error: something went wrong...');
            return -999;
        }
    }
    else if (humanMove === 'paper'){
        if (computerMove === 'rock'){
            alert('You win against rock');
            resutl = 1;
        }
        else if (computerMove === 'paper') {
            alert("it's draw");
            return 'draw';
        }
        else if (computerMove === 'scissors') {
            alert('You lose to scissors');
            return 0;
        }
        else {
            alert('error: something went wrong...');
            return -999;
        }
    }
    else if (humanMove === 'scissors') {
        if(computerMove === 'rock') {
            alert('You lose to rock');
            result = 0;
        }
        else if (computerMove === 'paper') {
            alert('You win against paper');
            return 1;
        }
        else if (computerMove === 'scissors') {
            alert("it's a draw");
            return 'draw';
        }
        else {
            alert('error: something went wrong...');
            return -999;
        }
    }
    else {
        alert('error: something went wrong...');
            return -999;
    }
}

function computerPlay() {
    choiceID = getRandomNumber(1,3);
    switch(choiceID) {
        case 1: 
            computerMove = "Rock";
            break;
        case 2:
            computerMove = "Paper";
            break;
        case 3:
            computerMove = "Scissors";
            break;
        default:
            computerMove = "Error";
    }
    return computerMove;
}

function getRandomNumber(min,max) {
    min = Math.ceil(min);
    max = Math.floor(max+1);
    return Math.floor(Math.random() * (max - min)) + min;
}