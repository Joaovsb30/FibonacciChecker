import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
        ),
        useMaterial3: true,
      ),
      title: 'Verificador de Fibonacci',
      home: const FibonacciChecker(),
    );
  }
}

class FibonacciChecker extends StatefulWidget {
  const FibonacciChecker({super.key});

  @override
  _FibonacciCheckerState createState() => _FibonacciCheckerState();
}

class _FibonacciCheckerState extends State<FibonacciChecker> {
  // Controlador para o campo de texto, permitindo gerenciar o seu valor.
  final TextEditingController _textEditingController = TextEditingController();
  // String que armazena o resultado da verificação de Fibonacci.
  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificador de Fibonacci'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de texto para o usuário digitar o número.
            TextField(
              controller: _textEditingController,
              keyboardType:
                  TextInputType.number, // Define o tipo de teclado numérico
              decoration: const InputDecoration(
                labelText:
                    'Digite um número inteiro', // Rótulo do campo de texto
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey, // Cor de fundo.
                        elevation: 0,
                        shape: const RoundedRectangleBorder()),
                    onPressed: () {
                      _verificarFibonacci(); // Chama a função de verificação ao pressionar
                    },
                    child: const Text(
                      'Verificar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Espaçamento vertical
            // Texto que exibe o resultado da verificação.
            Text(
              _resultado,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Função que verifica se um número pertence à sequência de Fibonacci.
  void _verificarFibonacci() {
    // Tenta converter o texto do campo de texto para um inteiro.
    // Se a conversão falhar, usa 0 como valor padrão.
    int numero = int.tryParse(_textEditingController.text) ?? 0;

    // Verifica se o número pertence à sequência.
    if (eFibonacci(numero)) {
      // Se pertencer, atualiza o estado _resultado com a mensagem de sucesso.
      setState(() {
        _resultado = 'O número $numero pertence à sequência de Fibonacci.';
      });
    } else {
      // Se não pertencer, atualiza o estado _resultado com a mensagem de falha.
      setState(() {
        _resultado = 'O número $numero não pertence à sequência de Fibonacci.';
      });
    }
  }

  // Função auxiliar que verifica se um número pertence à sequência de Fibonacci.
  bool eFibonacci(int num) {
    // Casos base: 0 e 1 pertencem à sequência.
    if (num == 0 || num == 1) {
      return true;
    }

    // Calcula a sequência de Fibonacci até que o número atual seja maior ou igual ao número informado.
    int a = 0;
    int b = 1;
    while (b < num) {
      int temp = b;
      b = a + b;
      a = temp;
    }

    // Se o último número calculado for igual ao número informado, então ele pertence à sequência.
    return b == num;
  }
}
