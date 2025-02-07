import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/src/utf8.dart';
import 'package:printer_sdk/printer_sdk.dart';

class MockPrinterBindings implements PrinterBindings {
  bool _initialized = false;
  bool _hasCard = false;
  bool _canvasReady = false;
  PrinterStatus _status = PrinterStatus(
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

  @override
  int initLibrary() {
    _initialized = true;
    return 0;
  }

  @override
  bool checkCardPosition() {
    if (!_initialized) {
      throw PrinterException('Printer not initialized');
    }
    return _hasCard;
  }

  @override
  void prepareCanvas({bool isColor = true}) {
    if (!_initialized) {
      throw PrinterException('Printer not initialized');
    }
    _canvasReady = true;
  }

  @override
  PrinterStatus? getPrinterStatus() {
    if (!_initialized) {
      throw PrinterException('Printer not initialized');
    }
    return _status;
  }

  // 테스트를 위한 헬퍼 메서드들
  void setHasCard(bool value) => _hasCard = value;
  void setStatus(PrinterStatus status) => _status = status;
  bool get isInitialized => _initialized;
  bool get isCanvasReady => _canvasReady;

  @override
  int commitCanvas(Pointer<Utf8> strPtr, Pointer<Int32> lenPtr) {
    // TODO: implement commitCanvas
    throw UnimplementedError();
  }

  @override
  void drawImage(
      {required String imagePath,
      required double x,
      required double y,
      required double width,
      required double height,
      bool noAbsoluteBlack = true}) {
    // TODO: implement drawImage
  }

  @override
  void drawText(
      {required String text,
      required double x,
      required double y,
      required double width,
      required double height,
      bool noAbsoluteBlack = true}) {
    // TODO: implement drawText
  }

  @override
  void ejectCard() {
    // TODO: implement ejectCard
  }

  @override
  Uint8List flipImage180(Uint8List imageBytes) {
    // TODO: implement flipImage180
    throw UnimplementedError();
  }

  @override
  String getErrorInfo(int errorCode) {
    // TODO: implement getErrorInfo
    throw UnimplementedError();
  }

  @override
  void initializeUsb() {
    // TODO: implement initializeUsb
  }

  @override
  void injectCard() {
    // TODO: implement injectCard
  }

  @override
  void printCard({required String frontImageInfo, String? backImageInfo}) {
    // TODO: implement printCard
  }

  @override
  void setCanvasOrientation(bool isPortrait) {
    // TODO: implement setCanvasOrientation
  }

  @override
  void setCoatingRegion(
      {required double x,
      required double y,
      required double width,
      required double height,
      required bool isFront,
      required bool isErase}) {
    // TODO: implement setCoatingRegion
  }

  @override
  void setImageParameters({required int transparency, required int rotation, required double scale}) {
    // TODO: implement setImageParameters
  }

  @override
  bool checkFeederStatus() {
    // TODO: implement checkFeederStatus
    throw UnimplementedError();
  }

  @override
  void clearLibrary() {
    // TODO: implement clearLibrary
  }

  @override
  bool connectPrinter({bool isEtherNet = false}) {
    // TODO: implement connectPrinter
    throw UnimplementedError();
  }

  @override
  void drawWaterMark(String imagePath) {
    // TODO: implement drawWaterMark
  }

  @override
  bool ensurePrinterReady() {
    // TODO: implement ensurePrinterReady
    throw UnimplementedError();
  }

  @override
  void setFont(String fontName, double fontSize) {
    // TODO: implement setFont
  }

  @override
  void setRibbonOpt(int isWrite, int key, String value, int valueLen) {
    // TODO: implement setRibbonOpt
  }

  @override
  void setTextIsStrong(int isStrong) {
    // TODO: implement setTextIsStrong
  }
}
