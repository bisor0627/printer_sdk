import 'package:printer_sdk/printer_sdk.dart';
import 'package:test/test.dart';

import 'mock_printer_bindings.dart';

void main() {
  late MockPrinterBindings mockBindings;

  setUp(() {
    mockBindings = MockPrinterBindings();
  });

  group('PrinterBindings', () {
    test('initialization sequence', () {
      expect(mockBindings.isInitialized, false);

      final result = mockBindings.initLibrary();
      expect(result, 0);
      expect(mockBindings.isInitialized, true);
    });

    test('card position check', () {
      mockBindings.initLibrary();

      mockBindings.setHasCard(false);
      expect(mockBindings.checkCardPosition(), false);

      mockBindings.setHasCard(true);
      expect(mockBindings.checkCardPosition(), true);
    });

    test('throws exception when not initialized', () {
      expect(
        () => mockBindings.checkCardPosition(),
        throwsA(isA<PrinterException>()),
      );
    });

    test('canvas preparation', () {
      mockBindings.initLibrary();

      expect(mockBindings.isCanvasReady, false);
      mockBindings.prepareCanvas();
      expect(mockBindings.isCanvasReady, true);
    });

    test('printer status monitoring', () {
      mockBindings.initLibrary();

      final normalStatus = PrinterStatus(
        mainCode: 0,
        subCode: 0,
        mainStatus: 0,
        errorStatus: 0,
        warningStatus: 0,
        chassisTemperature: 25,
        printHeadTemperature: 30,
        heaterTemperature: 35,
        subStatus: 0,
      );

      mockBindings.setStatus(normalStatus);
      var status = mockBindings.getPrinterStatus();
      expect(status?.errorStatus, 0);

      final errorStatus = PrinterStatus(
        mainCode: 1,
        subCode: 0,
        mainStatus: 0,
        errorStatus: 1,
        warningStatus: 0,
        chassisTemperature: 25,
        printHeadTemperature: 30,
        heaterTemperature: 35,
        subStatus: 0,
      );

      mockBindings.setStatus(errorStatus);
      status = mockBindings.getPrinterStatus();
      expect(status?.errorStatus, 1);
    });
  });
}
