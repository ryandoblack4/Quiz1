import 'package:flutter/material.dart';
import 'package:flutter_application_2/projeto.dart';


class QuizPage extends StatefulWidget {
  @override
  State_QuizPage createState() => State_QuizPage();
}

class State_QuizPage extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  String _feedbackMessage = '';
  Color _feedbackColor = Colors.transparent;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Qual é a capital do Japão?',
      'options': ['Seul', 'Pequim', 'Tóquio', 'Bangkok'],
      'correctAnswer': 'Tóquio',
      'imagem': '',
      'answer': 2,
    },
    {
      'question': 'Qual país tem o maior número de habitantes?',
      'options': ['Índia', 'Brasil', 'China', 'Estados Unidos'],
      'correctAnswer': 'China',
      'imagem': '',
      'answer': 2,
    },
    {
      'question': 'Em qual continente fica o Egito?',
      'options': ['África', 'Ásia', 'Europa', 'Oceania'],
      'correctAnswer': 'África',
      'imagem': '',
      'answer': 0,
    },
    {
      'question': 'Qual é o país conhecido como "terra do sol nascente"?',
      'options': ['Coreia do Sul', 'Japão', 'China', 'Tailândia'],
      'correctAnswer': 'Japão',
      'imagem': '',
      'answer': 1,
    },
    {
      'question': 'Qual é o menor país do mundo?',
      'options': ['Mônaco', 'Nauru', 'Vaticano', 'São Marino'],
      'correctAnswer': 'Vaticano',
      'imagem': '',
      'answer': 2,
    },
    {
      'question': 'Qual desses países possui mais de uma língua oficial?',
      'options': ['Brasil', 'Canadá', 'Japão', 'Argentina'],
      'correctAnswer': 'Canadá',
      'imagem': '',
      'answer': 1,
    },
    {
      'question': 'Qual é o maior país em extensão territorial?',
      'options': ['Estados Unidos', 'China', 'Rússia', 'Canadá'],
      'correctAnswer': 'Rússia',
      'imagem': '',
      'answer': 2,
    },
    {
      'question': 'Qual país é conhecido por sua pizza e pasta?',
      'options': ['França', 'Itália', 'Espanha', 'Grécia'],
      'correctAnswer': 'Itália',
      'imagem': '',
      'answer': 1,
    },
    {
      'question': 'Em qual país podemos encontrar as pirâmides de Gizé?',
      'options': ['Egito', 'México', 'Irã', 'Marrocos'],
      'correctAnswer': 'Egito',
      'imagem': '',
      'answer': 0,
    },
    {
      'question': 'Qual país tem o maior deserto do mundo?',
      'options': ['China', 'Arábia Saudita', 'Egito', 'Antártica'],
      'correctAnswer': 'Antártica',
      'imagem': '',
      'answer': 3,
    },
  ];

  void _answerQuestion(int selectedOption) {
    final question = _questions[_currentQuestionIndex];
    setState(() {
      if (selectedOption == question['answer']) {
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
}
