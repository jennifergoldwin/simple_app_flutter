
class Genshin{
  String name;
  String url;

  Genshin({
        required this.name,required this.url});

  factory Genshin.fromMap(json,x) =>
      Genshin(
          name: json['name'], url: x
      );
}