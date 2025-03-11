import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  String? audioUrl;
  String? coverUrl;
  bool? isFavorite;
  String? songId;

  SongModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releaseDate,
      required this.audioUrl,
      required this.coverUrl});

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
    audioUrl = data['audioUrl'];
    coverUrl = data['coverUrl'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
        title: title!,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!,
        audioUrl: audioUrl!,
        coverUrl: coverUrl!,
        isFavorite: isFavorite!,
        songId: songId!);
  }
}
