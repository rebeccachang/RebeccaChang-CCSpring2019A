/*
Rebecca C
Week12_HW
Sketch supposed to load questions from a JSON with various random quiz questions
*/

//Could not run the sketch (Target VM failed to initialize)
JSONArray quiz;

void setup(){
  size(900, 900);
  background(150);

  //load JSON file
  quiz = loadJSONArray("Questions.json");
  
  for(int i = 0; i < quiz.size(); i++){
    
    JSONObject randQuestion = quiz.getJSONObject(i); 

    String question = randQuestion.getString("question");
    String answer1 = randQuestion.getString("incorrect_answers");
    String answer2 = randQuestion.getString("correct_answer");

    println(question + ", " + answer1 + ", " + answer2);
  }
}

void draw(){
}
