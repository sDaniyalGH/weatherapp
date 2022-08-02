class futureDataModel{
  var _temp;
  var _icon;
  var _time;
  var _description;
  var _main;

  futureDataModel(
      this._temp, this._icon, this._time, this._description, this._main);

  get main => _main;
  get description => _description;
  get time => _time;
  get icon => _icon;
  get temp => _temp;

}