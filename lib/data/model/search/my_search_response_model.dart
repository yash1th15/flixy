import '../auth/registration_response_model.dart';

class MySearchResponseModel {
  MySearchResponseModel({
      String? remark, 
      String? status, 
     Message? message, 
      MainData? mainData,}){
    _remark = remark;
    _status = status;
    _message = message;
    _mainData = mainData;
}

  MySearchResponseModel.fromJson(dynamic json) {
    _remark = json['remark'];
    _status = json['status'];
    _message = json['message'] != null ? Message.fromJson(json['message']):null;
    _mainData = json['data'] != null ? MainData.fromJson(json['data']) : null;
  }
  String? _remark;
  String? _status;
  Message? _message;
  MainData? _mainData;

  String? get remark => _remark;
  String? get status => _status;
  Message? get message => _message;
  MainData? get data => _mainData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['remark'] = _remark;
    map['status'] = _status;
   if(_message!=null){
      map['message'] = _message?.toJson();
    }
    if (_mainData != null) {
      map['data'] = _mainData?.toJson();
    }
    return map;
  }

}

class MainData {
  MainData({
      Items? items,}){
    _items = items;
}

  MainData.fromJson(dynamic json) {
    _items = json['items'] != null ? Items.fromJson(json['items']) : null;
  }
  Items? _items;

  Items? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_items != null) {
      map['items'] = _items?.toJson();
    }
    return map;
  }

}

class Items {
  Items({
      List<Data>? data,
      String? nextPageUrl}){
    _data = data;
    _nextPageUrl = nextPageUrl;
}

  Items.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
  }

  List<Data>? _data;
  String? _nextPageUrl;

  List<Data>? get data => _data;
  String? get nextPageUrl => _nextPageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    return map;
  }

}


class Data {
  Data({
      int? id, 
      String? categoryId, 
      dynamic subCategoryId, 
      String? title, 
      String? previewText, 
      String? description, 
      Team? team, 
      Image? image, 
      String? itemType, 
      String? status, 
      String? single,
      String? trending, 
      String? featured, 
      String? version,
      String? tags, 
      String? ratings, 
      String? view, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _categoryId = categoryId;
    _subCategoryId = subCategoryId;
    _title = title;
    _previewText = previewText;
    _description = description;
    _team = team;
    _image = image;
    _itemType = itemType;
    _status = status;
    _single = single;
    _trending = trending;
    _featured = featured;
    _version = version;
    _tags = tags;
    _ratings = ratings;
    _view = view;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'].toString();
    _subCategoryId = json['sub_category_id'].toString();
    _title = json['title']??'';
    _previewText = json['preview_text']??'';
    _description = json['description']??'';
    _team = json['team'] != null ? Team.fromJson(json['team']) : null;
    _image = json['image'] != null ? Image.fromJson(json['image']) : null;
    _itemType = json['item_type'].toString();
    _status = json['status'].toString();
    _single = json['single'].toString();
    _trending = json['trending'].toString();
    _featured = json['featured'].toString();
    _version = json['version'].toString();
    _tags = json['tags'].toString();
    _ratings = json['ratings'].toString();
    _view = json['view'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _categoryId;
  dynamic _subCategoryId;
  String? _title;
  String? _previewText;
  String? _description;
  Team? _team;
  Image? _image;
  String? _itemType;
  String? _status;
  String? _single;
  String? _trending;
  String? _featured;
  String? _version;
  String? _tags;
  String? _ratings;
  String? _view;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get categoryId => _categoryId;
  dynamic get subCategoryId => _subCategoryId;
  String? get title => _title;
  String? get previewText => _previewText;
  String? get description => _description;
  Team? get team => _team;
  Image? get image => _image;
  String? get itemType => _itemType;
  String? get status => _status;
  String? get single => _single;
  String? get trending => _trending;
  String? get featured => _featured;
  String? get version => _version;
  String? get tags => _tags;
  String? get ratings => _ratings;
  String? get view => _view;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['sub_category_id'] = _subCategoryId;
    map['title'] = _title;
    map['preview_text'] = _previewText;
    map['description'] = _description;
    if (_team != null) {
      map['team'] = _team?.toJson();
    }
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    map['item_type'] = _itemType;
    map['status'] = _status;
    map['tags'] = _tags;
    map['ratings'] = _ratings;
    map['view'] = _view;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Image {
  Image({
      String? landscape, 
      String? portrait,}){
    _landscape = landscape;
    _portrait = portrait;
}

  Image.fromJson(dynamic json) {
    _landscape = json['landscape'];
    _portrait = json['portrait'];
  }
  String? _landscape;
  String? _portrait;

  String? get landscape => _landscape;
  String? get portrait => _portrait;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['landscape'] = _landscape;
    map['portrait'] = _portrait;
    return map;
  }

}

class Team {
  Team({
      String? director, 
      String? producer, 
      String? casts,}){
    _director = director;
    _producer = producer;
    _casts = casts;
}

  Team.fromJson(dynamic json) {
    _director = json['director'];
    _producer = json['producer'];
    _casts = json['casts'];
  }
  String? _director;
  String? _producer;
  String? _casts;

  String? get director => _director;
  String? get producer => _producer;
  String? get casts => _casts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['director'] = _director;
    map['producer'] = _producer;
    map['casts'] = _casts;
    return map;
  }

}