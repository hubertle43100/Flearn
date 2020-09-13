import 'package:dartz/dartz.dart';
import 'package:search_arch/core/error/failures.dart';
import 'package:search_arch/core/usecases/usecase.dart';
import 'package:search_arch/features/number_triva/domain/entities/number_trivia.dart';
import 'package:search_arch/features/number_triva/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams>{
  final NumbertTriviaRepository repository;
  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}