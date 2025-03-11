import 'package:red/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:red/domain/repository/song/song.dart';
import 'package:red/service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getNewsSongs();
  }
}
