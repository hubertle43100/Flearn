import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:search_arch/core/error/failures.dart';
import 'package:search_arch/features/number_triva/domain/entities/number_trivia.dart';
import 'package:search_arch/features/number_triva/domain/repositories/number_trivia_repository.dart';

//created the class to get to the green phase
class GetConcreteNumberTrivia{
  final NumbertTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future <Either<Failure, NumberTrivia>> execute({
  @required int number,
}) async{
    return await repository.getConcreteNumberTrivia(number);
  }
}