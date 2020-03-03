class MovieConsulta{
  int id;
  String Name;
  String Description;
  String Duration;
  String Genus;
  String Idiom;
  String Digest;
  int Rating;
  DateTime DatePremiere;
  String Url_insercion;

  MovieConsulta({this.id,this.Name,this.Description,this.Duration,this.Genus,this.Idiom,this.Digest,this.Rating,this.DatePremiere,this.Url_insercion});

  factory MovieConsulta.fromJson(Map<String, dynamic> item){
    return MovieConsulta(
      id: item['id'],
      Name: item['Name'],
      Description: item['Description'],
      Duration: item['Duration'],
      Genus: item['Genus'],
      Idiom: item['Idiom'],
      Digest: item['Digest'],
      Rating: item['Rating'],
      DatePremiere: DateTime.parse(item['DatePremiere']),
      Url_insercion: item['Url_insercion'],
    );
  }
}