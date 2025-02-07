import 'package:test/test.dart';

import 'mock_printer_bindings.dart';

void main() {
  late MockPrinterBindings mockBindings;

  setUp(() {
    mockBindings = MockPrinterBindings();
  });

  test('complete printing workflow', () async {
    // 1. 초기화
    expect(mockBindings.initLibrary(), 0);

    // 2. 카드 체크
    mockBindings.setHasCard(true);
    expect(mockBindings.checkCardPosition(), true);

    // 3. 캔버스 준비
    mockBindings.prepareCanvas();
    expect(mockBindings.isCanvasReady, true);

    // 4. 상태 체크
    final status = mockBindings.getPrinterStatus();
    expect(status?.errorStatus, 0);
  });
}
