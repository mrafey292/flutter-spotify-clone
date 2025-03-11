import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:red/domain/usecases/song/add_or_remove_favorite_songs.dart';
import 'package:red/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated(String songId) async {
    var result =
        await sl<AddOrRemoveFavoriteSongsUseCase>().call(params: songId);

    result.fold((l) {}, (isFavorite) {
      emit(FavoriteButtonUpdated(isFavorite: isFavorite));
    });
  }
}
