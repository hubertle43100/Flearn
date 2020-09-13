import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:search_arch/core/error/failures.dart';
import 'package:search_arch/features/number_triva/domain/entities/number_trivia.dart';

//good idea to leave Params to use it in the future
abstract class UseCase< Type, Params> {
  Future<Either<Failure, NumberTrivia>> call(Params params);
}

class NoParams extends Equatable{}