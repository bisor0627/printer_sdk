class PrinterException implements Exception {
  final String message;
  final int? errorCode;

  PrinterException(this.message, [this.errorCode]);

  @override
  String toString() =>
      errorCode != null ? 'PrinterException: $message (code: $errorCode)' : 'PrinterException: $message';
}
