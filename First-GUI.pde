int playerScore = 0;    // Player score
int aiScore = 0;        // AI score
int maxPoints = 5;      // Max points to win
String playerChoice = ""; // Player's choice
String aiChoice = "";    // AI's choice
String resultMessage = "Click your choice to start!"; // Result display
PFont font;

void setup() {
  size(600, 400);
  font = createFont("Arial", 16, true);
  textFont(font);
}

void draw() {
  background(255);
  
  // Draw Title and Instructions
  fill(0);
  textSize(24);
  textAlign(CENTER);
  text("ROCK, PAPER, SCISSORS", width / 2, 30);
  textSize(16);
  text(resultMessage, width / 2, 60);
  
  // Draw Choices
  drawChoices();
  
  // Draw Scores
  textSize(18);
  text("Player: " + playerScore, 150, 350);
  text("AI: " + aiScore, 450, 350);
  
  // Check if anyone reached max points
  if (playerScore >= maxPoints || aiScore >= maxPoints) {
    resultMessage = (playerScore >= maxPoints) ? "Player Wins!" : "AI Wins!";
    noLoop(); // Stop the game 
  }
}

void drawChoices() {
  fill(200);
  rect(100, 150, 100, 50); // Rock button
  rect(250, 150, 100, 50); // Paper button
  rect(400, 150, 100, 50); // Scissors button
  
  fill(0);
  textAlign(CENTER, CENTER);
  text("Rock", 150, 175);
  text("Paper", 300, 175);
  text("Scissors", 450, 175);
  
  // Display the current choices
  textSize(16);
  text("Player choice: " + playerChoice, 150, 270);
  text("AI choice: " + aiChoice, 450, 270);
}

void mousePressed() {
  if (mouseY > 150 && mouseY < 200) {
    if (mouseX > 100 && mouseX < 200) {
      playerChoice = "rock";
    } else if (mouseX > 250 && mouseX < 350) {
      playerChoice = "paper";
    } else if (mouseX > 400 && mouseX < 500) {
      playerChoice = "scissors";
    } else {
      return; // Click outside buttons
    }
    
    aiChoice = getRandomChoice();
    updateScores();
  }
}

String getRandomChoice() {
  int choice = int(random(1, 4)); // Randomly select between 1 and 3
  if (choice == 1) return "rock";
  if (choice == 2) return "paper";
  return "scissors";
}

void updateScores() {
  if (playerChoice.equals(aiChoice)) {
    resultMessage = "It's a tie!";
  } else if ((playerChoice.equals("rock") && aiChoice.equals("scissors")) ||
             (playerChoice.equals("paper") && aiChoice.equals("rock")) ||
             (playerChoice.equals("scissors") && aiChoice.equals("paper"))) {
    playerScore++;
    
    if (playerScore >= maxPoints) {
    resultMessage = "Player Wins the match!";
    // Stop the game 
    }
    
    else resultMessage = "Player wins this round!";
    
  } else {
    aiScore++;
    
    if (aiScore >= maxPoints) {
    resultMessage = "AI Wins the match!";
    // Stop the game 
    }
    
    else resultMessage = "AI wins this round!";
  }
}
