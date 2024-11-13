import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz de Perguntas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo ao Quiz!'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://png.pngtree.com/png-clipart/20230120/ourmid/pngtree-quiz-design-vector-clipart-png-image_6569418.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(height: 20),
              Text(
                'Bem-vindo ao Quiz!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Teste seus conhecimentos sobre países e veja quantas perguntas você consegue acertar.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
                child: Text('Iniciar Quiz'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
      'question': 'Qual é a capital do Japão?',
      'options': ['Seul', 'Pequim', 'Tóquio', 'Bangkok'],
      'imagem': 'lib/assets/tokyo1.png',
      'answer': 2,
    },
    {
      'question': 'Qual país tem o maior número de habitantes?',
      'options': ['Índia', 'Brasil', 'China', 'Estados Unidos'],
      'imagem': 'lib/assets/china02.png',
      'answer': 2,
    },
    {
      'question': 'Em qual continente fica o Egito?',
      'options': ['África', 'Ásia', 'Europa', 'Oceania'],
      'imagem': 'lib/assets/africa03.png',
      'answer': 0,
    },
    {
      'question': 'Qual é o país conhecido como "terra do sol nascente"?',
      'options': ['Coreia do Sul', 'Japão', 'China', 'Tailândia'],
      'imagem': 'lib/assets/japao04.png',
      'answer': 1,
    },
    {
      'question': 'Qual é o menor país do mundo?',
      'options': ['Mônaco', 'Nauru', 'Vaticano', 'São Marino'],
      'imagem': 'lib/assets/vaticano05.png',
      'answer': 2,
    },
    {
      'question': 'Qual desses países possui mais de uma língua oficial?',
      'options': ['Brasil', 'Canadá', 'Japão', 'Argentina'],
      'imagem': 'lib/assets/canada06.png',
      'answer': 1,
    },
    {
      'question': 'Qual é o maior país em extensão territorial?',
      'options': ['Estados Unidos', 'China', 'Rússia', 'Canadá'],
      'imagem': 'lib/assets/russo07.png',
      'answer': 2,
    },
    {
      'question': 'Qual país é conhecido por sua pizza e pasta?',
      'options': ['França', 'Itália', 'Espanha', 'Grécia'],
      'imagem': 'lib/assets/italia08.png',
      'answer': 1,
    },
    {
      'question': 'Em qual país podemos encontrar as pirâmides de Gizé?',
      'options': ['Egito', 'México', 'Irã', 'Marrocos'],
      'imagem': 'lib/assets/gize09.png',
      'answer': 0,
    },
    {
      'question': 'Qual país tem o maior deserto do mundo?',
      'options': ['China', 'Arábia Saudita', 'Egito', 'Antártica'],
      'imagem': 'lib/assets/antartica10.png',
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
          Image.asset(
            question['imagem'],
            height: 200,
            width: double.infinity,
            fit: BoxFit.scaleDown,
          ),
          SizedBox(height: 20),
          Text(
            question['question'],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz Concluído!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Você acertou $_score de ${_questions.length} perguntas.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _resetQuiz();
              },
              child: Text('Tentar Novamente'),
              style: ElevatedButton.styleFrom(
               padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}