import 'package:red/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:red/domain/repository/song/song.dart';
import 'package:red/service_locator.dart';

class AddOrRemoveFavoriteSongsUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongsRepository>().addOrRemoveFavoriteSongs(params!);
  }
}
