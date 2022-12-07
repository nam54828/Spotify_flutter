class Post {
  String? name;
  String? singer;
  String? image;
  String? song;
  String? id;

  Post({this.name, this.singer, this.image, this.song, this.id});

  Post.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    singer = json['singer'];
    image = json['image'];
    song = json['song'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['singer'] = this.singer;
    data['image'] = this.image;
    data['song'] = this.song;
    data['id'] = this.id;
    return data;
  }
}
