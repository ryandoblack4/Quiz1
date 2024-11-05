class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz de Perguntas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuizPage(),
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
