 import 'package:flutter/material.dart';
import 'package:flutter_application_2/projeto.dart';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Perguntas sobre Países'),
      ),
      body: _currentQuestionIndex < _questions.length
          ? _buildQuizQuestion()
          : _buildFinalScreen(),
    );
  }

  Widget _buildQuizQuestion() {
    final question = _questions[_currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            question['question'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ...List.generate(question['options'].length, (index) {
            return _buildOptionButton(index, question['options'][index]);
          }),
          SizedBox(height: 20),
          Text(
            _feedbackMessage,
            style: TextStyle(fontSize: 18, color: _feedbackColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(int index, String option) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton(
        onPressed: () => _answerQuestion(index),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          backgroundColor: Colors.blueAccent,
        ),
        child: Text(
          option,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildFinalScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Parabéns! Você completou o quiz.',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _resetQuiz,
            child: Text('Reiniciar Quiz'),
          ),
        ],
      ),
    );
  }
}
