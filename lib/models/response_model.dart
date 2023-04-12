class ResponseModel {
  bool _isSuccess;
  String _message;

  ResponseModel(this._message, this._isSuccess);

  bool get isSuccess => _isSuccess;
  String get message => _message;
}
