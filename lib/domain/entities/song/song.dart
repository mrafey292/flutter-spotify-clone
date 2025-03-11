import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final String audioUrl;
  final String coverUrl;
  final bool isFavorite;
  final String songId;

  SongEntity(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releaseDate,
      required this.audioUrl,
      required this.coverUrl,
      required this.isFavorite,
      required this.songId});
}
