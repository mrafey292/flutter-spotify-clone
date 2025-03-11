import 'package:red/core/usecase/usecase.dart';
import 'package:red/domain/repository/song/song.dart';
import 'package:red/service_locator.dart';

class IsFavoriteSongUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<SongsRepository>().isFavoriteSong(params!);
  }
}
