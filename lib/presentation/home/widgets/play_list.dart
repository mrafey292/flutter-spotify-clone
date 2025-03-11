import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red/common/widgets/favorite_button/favorite_button.dart';
import 'package:red/domain/entities/song/song.dart';
import 'package:red/presentation/home/bloc/play_list_cubit.dart';
import 'package:red/presentation/home/bloc/play_list_state.dart';
import 'package:red/presentation/song_player/pages/song_player.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PlayListCubit()..getPlayList(),
        child: BlocBuilder<PlayListCubit, PlayListState>(
          builder: (context, state) {
            if (state is PlayListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PlayListLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Playlist',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'See More',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _songs(state.songs),
                ]),
              );
            }
            return Container();
          },
        ));
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SongPlayerPage(
                  songEntity: songs[index],
                ),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].title,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        songs[index].artist,
                        style: const TextStyle(
                          fontSize: 9,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    songs[index].duration.toString().replaceAll('.', ':'),
                  ),
                  const SizedBox(width: 10),
                  FavoriteButton(songEntity: songs[index]),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      itemCount: songs.length,
    );
  }
}
