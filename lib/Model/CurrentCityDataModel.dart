class CurrentCityDataModel {
  var _cityname;
  var _lon;
  var _lat;
  var _main;
  var _description;
  var _temp;
  var _temp_min;
  var _temp_max;
  var _pressure;
  var _humidity;
  var _windSpeed;
  var _dataTime;
  var _country;
  var _sunrise;
  var _sunset;

  CurrentCityDataModel(
      this._cityname,
      this._lon,
      this._lat,
      this._main,
      this._description,
      this._temp,
      this._temp_min,
      this._temp_max,
      this._pressure,
      this._humidity,
      this._windSpeed,
      this._dataTime,
      this._country,
      this._sunrise,
      this._sunset);

  get sunset => _sunset;

  get sunrise => _sunrise;

   get country => _country;

  get dataTime => _dataTime;

  get windSpeed => _windSpeed;

  get humidity => _humidity;

  get pressure => _pressure;

  get temp_max => _temp_max;

  get temp_min => _temp_min;

  get temp => _temp;

   get description => _description;

   get main => _main;

  get lat => _lat;

  get lon => _lon;

   get cityname => _cityname;
}