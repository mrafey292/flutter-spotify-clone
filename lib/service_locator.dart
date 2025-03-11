import 'package:get_it/get_it.dart';
import 'package:red/data/repository/auth/auth_repository_impl.dart';
import 'package:red/data/repository/song/song_repository_impl.dart';
import 'package:red/data/sources/auth/auth_firebase_service.dart';
import 'package:red/data/sources/song/song_firebase_service.dart';
import 'package:red/domain/repository/auth/auth.dart';
import 'package:red/domain/repository/song/song.dart';
import 'package:red/domain/usecases/auth/signin.dart';
import 'package:red/domain/usecases/auth/signup.dart';
import 'package:red/domain/usecases/song/add_or_remove_favorite_songs.dart';
import 'package:red/domain/usecases/song/get_news_songs.dart';
import 'package:red/domain/usecases/song/get_play_list.dart';
import 'package:red/domain/usecases/song/is_favorite_song.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());

  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());

  sl.registerSingleton<AddOrRemoveFavoriteSongsUseCase>(
      AddOrRemoveFavoriteSongsUseCase());
  sl.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());
}
