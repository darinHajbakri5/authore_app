import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/author_api_client.dart';
import 'author_state.dart';

class AuthorCubit extends Cubit<AuthorState> {
  final AuthorApiClient apiClient;

  AuthorCubit({required this.apiClient}) : super(AuthorInitial());

  void searchAuthor(String name) async {
    emit(AuthorLoading());
    try {
      final authors = await apiClient.fetchAuthors(name);
      emit(AuthorLoaded(authors));
    } catch (e) {
      emit(AuthorError("Failed to fetch authors: $e"));
    }
  }

  void fetchAuthorWorks(String authorId) async {
    emit(WorksLoading());
    try {
      final works = await apiClient.fetchWorks(authorId);
      emit(WorksLoaded(works));
    } catch (e) {
      emit(WorksError("Failed to fetch works: $e"));
    }
  }
}
