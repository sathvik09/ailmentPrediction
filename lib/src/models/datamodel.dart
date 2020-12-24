class DataModel {
  String id;
  String name;
  String desc;
  int price;
  String url;

  DataModel(Map<String,dynamic> parsed){
    name = parsed['name'];
    desc = parsed['desc'];
    price = parsed['price'];
    url = parsed['url'];
  }
}