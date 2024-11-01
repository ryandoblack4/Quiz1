// Definindo a interface Celular
abstract class Celular {
  void ligar(String numero);
  void desligar();
  void enviarMensagem(String numero, String mensagem);
  void receberMensagem(String numero, String mensagem);
}

// Implementação da interface Celular
class Smartphone implements Celular {
  String modelo;
  String sistemaOperacional;

  Smartphone(this.modelo, this.sistemaOperacional);

  @override
  void ligar(String numero) {
    print('Ligando para $numero...');
  }

  @override
  void desligar() {
    print('Desligando o celular...');
  }

  @override
  void enviarMensagem(String numero, String mensagem) {
    print('Enviando mensagem para $numero: "$mensagem"');
  }

  @override
  void receberMensagem(String numero, String mensagem) {
    print('Mensagem recebida de $numero: "$mensagem"');
  }

  void exibirInformacoes() {
    print('Modelo: $modelo');
    print('Sistema Operacional: $sistemaOperacional');
  }
}

void main() {
  // Criando um objeto Smartphone
  Smartphone meuCelular = Smartphone('Samsung Galaxy S21', 'Android');

  // Exibindo informações do celular
  meuCelular.exibirInformacoes();

  // Usando métodos da interface
  meuCelular.ligar('123456789');
  meuCelular.enviarMensagem('987654321', 'Olá, como você está?');
  meuCelular.receberMensagem('987654321', 'Estou bem, obrigado!');
  meuCelular.desligar();
}