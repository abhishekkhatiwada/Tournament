



class Game{

  final List<Party> Participants;
  final String imageUrl;
  final String label;
  final String id;

  Game({
    required this.id,
    required this.imageUrl,
    required this.label,
    required this.Participants
});

}


class Party{

  final String teamName;
  final String captain;
  final String player1;
  final String player2;
  final String player3;
  final int contact;
  final String logo;

  Party({
 required this.logo,
 required this.captain,
 required this.contact,
 required this.player1,
 required this.player2,
 required this.player3,
 required this.teamName
 });


  factory Party.fromJson(Map<String, dynamic> json){
    return Party(
        logo: json['logo'],
        captain: json['captain'],
        contact: json['contact'],
        player1: json['player1'],
        player2: json['player2'],
        player3: json['player3'],
        teamName: json['teamName']
    );
  }

  Map<String, dynamic> toJson(){
    return {
    'captain': this.captain,
    'contact': this.contact,
    'player1': this.player1,
    'player2': this.player2,
    'player3': this.player3,
    'teamName': this.teamName,
      'logo': this.logo
    };
  }

}