import 'package:flutter/material.dart';
import'package:flutter_application_1/projeto.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  String _feedbackMessage = ''; 
  Color _feedbackColor = Colors.transparent; 

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Qual é a capital da França?',
      'options': ['Berlim', 'Madrid', 'Paris', 'Lisboa'],
      'answer': 2
    },
    {
      'question': 'Qual é o maior planeta do sistema solar?',
      'options': ['Terra', 'Marte', 'Júpiter', 'Saturno'],
      'answer': 2
    },
    {
      'question': 'Quantos continentes existem na Terra?',
      'options': ['5', '6', '7', '8'],
      'answer': 2
    },
    {
      'question': 'Quantos dedos existem em uma mão?',
      'options': ['7', '6', '5', '8'],
      'answer': 2
    },
    {
      'question': 'Qual desses números corresponde a uma cédula que existe no Brasil?',
      'options': ['7', '6', '5', '8'],
      'answer': 2
    },
    {
      'question': 'Se João se casou com Maria, quem é o marido de Maria?',
      'options': ['Jonas', 'Guilherme', 'João', 'Pedro'],
      'answer': 2
    },
    {
      'question': 'Quantos cômodos uma casa com sala, quarto, banheiro e cozinha tem?',
      'options': ['5', '6', '4', '8'],
      'answer': 2
    },
    {
      'question': 'Se você tem 4 irmãos, quantos membros sua família tem?',
      'options': ['5', '6', '7', '8'],
      'answer': 2
    },
    {
      'question': 'Qual a principal matéria escolar do ensino Fundamental (1) que usa como principal instrumento o cálculo?',
      'options': ['Português', 'Química', 'Matemática', 'Física'],
      'answer': 2
    },
    {
      'question': 'Qual é o menor país do mundo?',
      'options': ['Mônaco', 'Nauru', 'Vaticano', 'São Marino'],
      'answer': 2
    }
  ];

  void _answerQuestion(int selectedOption) {
    setState(() {
      if (selectedOption == _questions[_currentQuestionIndex]['answer']) {
        _feedbackMessage = 'Resposta Correta!';
        _feedbackColor = Colors.green;
        _score++;
      } else {
        _feedbackMessage = 'Resposta Errada!';
        _feedbackColor = Colors.red;
      }
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _feedbackMessage = '';
        _feedbackColor = Colors.transparent;
        _currentQuestionIndex++;
      });

      if (_currentQuestionIndex >= _questions.length) {
        _showScoreDialog();
      }
    });
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Quiz Concluído!'),
        content: Text('Você acertou $_score de ${_questions.length} perguntas.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetQuiz();
            },
            child: Text('Tentar Novamente'),
          ),
        ],
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _currentQuestionIndex = 0;
      _feedbackMessage = '';
      _feedbackColor = Colors.transparent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Perguntas'),
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
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Pergunta ${_currentQuestionIndex + 1} de ${_questions.length}',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Image.network(
            'https://png.pngtree.com/png-clipart/20230120/ourmid/pngtree-quiz-design-vector-clipart-png-image_6569418.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.scaleDown,
          ),
          SizedBox(height: 20),
          Text(
            question['question'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ...List.generate(question['options'].length, (index) {
            return _buildOptionButton(index, question['options'][index]);
          }),
          SizedBox(height: 20),
          FeedbackMessage(message: _feedbackMessage, color: _feedbackColor),
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
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
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