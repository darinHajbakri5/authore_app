import 'package:equatable/equatable.dart';

abstract class AuthorState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthorInitial extends AuthorState {}

class AuthorLoading extends AuthorState {}

class AuthorLoaded extends AuthorState {
  final List<dynamic> authors;

  AuthorLoaded(this.authors);

  @override
  List<Object> get props => [authors];
}

class AuthorError extends AuthorState {
  final String message;

  AuthorError(this.message);

  @override
  List<Object> get props => [message];
}

class WorksLoading extends AuthorState {}

class WorksLoaded extends AuthorState {
  final List<dynamic> works;

  WorksLoaded(this.works);

  @override
  List<Object> get props => [works];
}

class WorksError extends AuthorState {
  final String message;

  WorksError(this.message);

  @override
  List<Object> get props => [message];
}
