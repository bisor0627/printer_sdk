import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:printer_sdk/bindings/printer_bindings.dart';
import 'package:test/test.dart';

List<String> dirPath = ['assets', 'luca'];

String _buildPath(List<String> parts) {
  final segments = <String>[Directory.current.path];
  segments.addAll(parts.reversed);
  return path.joinAll(segments);
}

void main() {
  group('PrinterBindings Tests', () {
    late PrinterBindings _bindings;

    setUp(() {
      _bindings = PrinterBindings(dllPath: _buildPath(dirPath));
    });

    test('Library should be cleared', () {
      final result = _bindings.checkFeederStatus();
      expect(result, isTrue); // Assuming clearLibrary returns a boolean
    });

    test('Printer should be connected', () {
      _bindings.connectPrinter();
      // Add assertions to verify the printer is connected
    });

    test('Ribbon options should be set correctly', () {
      _bindings.setRibbonOpt(1, 0, "2", 2);
      _bindings.setRibbonOpt(1, 1, "255", 4);
      // Add assertions to verify the ribbon options are set correctly
    });

    test('Printer should be ready', () {
      final ready = _bindings.ensurePrinterReady();
      expect(ready, isTrue); // Assuming ensurePrinterReady returns a boolean
    });
  });
}
