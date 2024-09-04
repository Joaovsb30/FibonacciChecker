import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fibonacci_checker/main.dart';

void main() {
  testWidgets('Verificar número de Fibonacci', (WidgetTester tester) async {
    // Inicializa o Widget MyApp para o teste.
    await tester.pumpWidget(const MyApp());

    // Encontra o TextField pelo seu tipo.
    final textField = find.byType(TextField);

    // Testa um número que pertence à sequência de Fibonacci (ex: 13).
    await tester.enterText(textField, '13');

    // Encontra o botão pelo seu texto.
    final botaoVerificar = find.text('Verificar');

    // Simula um toque no botão para acionar a verificação.
    await tester.tap(botaoVerificar);

    // Reconstrói o Widget para aplicar as mudanças.
    await tester.pump();

    // Encontra o Widget Text que exibe o resultado.
    final resultadoTexto =
        find.text('O número 13 pertence à sequência de Fibonacci.');

    // Verifica se o texto de resultado está presente na tela.
    expect(resultadoTexto, findsOneWidget);

    // Testa um número que NÃO pertence à sequência de Fibonacci (ex: 7).
    await tester.enterText(textField, '7');
    await tester.tap(botaoVerificar);
    await tester.pump();

    final resultadoTexto2 =
        find.text('O número 7 não pertence à sequência de Fibonacci.');
    expect(resultadoTexto2, findsOneWidget);
  });
}
