import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red/common/widgets/appbar/app_bar.dart';
import 'package:red/common/widgets/favorite_button/favorite_button.dart';
import 'package:red/core/configs/theme/app_colors.dart';
import 'package:red/domain/entities/song/song.dart';
import 'package:red/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:red/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerPage({required this.songEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          'Now Playing',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        action: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) => SongPlayerCubit()
          ..loadSong(
            songEntity.audioUrl,
          ),
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                _songCover(context),
                const SizedBox(height: 20),
                _songInfo(),
                const SizedBox(height: 20),
                _songPlayer(context),
              ],
            )),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          // fit: BoxFit.cover,
          image: NetworkImage(songEntity.coverUrl),
        ),
      ),
    );
  }

  Widget _songInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              songEntity.artist,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        FavoriteButton(songEntity: songEntity)
      ],
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
        builder: (context, state) {
      if (state is SongPlayerLoading) {
        return const CircularProgressIndicator();
      }
      if (state is SongPlayerLoaded) {
        return Column(
          children: [
            Slider(
              onChanged: (value) {},
              value: context
                  .read<SongPlayerCubit>()
                  .songPosition
                  .inSeconds
                  .toDouble(),
              min: 0.0,
              max: context
                  .read<SongPlayerCubit>()
                  .songDuration
                  .inSeconds
                  .toDouble(),
              activeColor: AppColors.primary,
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDuration(
                      context.read<SongPlayerCubit>().songPosition,
                    ),
                  ),
                  Text(
                    formatDuration(
                      context.read<SongPlayerCubit>().songDuration,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.read<SongPlayerCubit>().playOrPauseSong();
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  context.read<SongPlayerCubit>().audioPlayer.playing
                      ? Icons.pause
                      : Icons.play_arrow,
                ),
              ),
            )
          ],
        );
      }
      return Container();
    });
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
