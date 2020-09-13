import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:search_arch/core/error/failures.dart';
import 'package:search_arch/core/usecases/usecase.dart';
import 'package:search_arch/features/number_triva/domain/entities/number_trivia.dart';
import 'package:search_arch/features/number_triva/domain/repositories/number_trivia_repository.dart';

//created the class to get to the green phase
class GetConcreteNumberTrivia implements UseCase<NumberTrivia, int>{
  final NumbertTriviaRepository repository;

  // api.com/42   <-- concrete
  // api.com/random   <-- random

  GetConcreteNumberTrivia(this.repository);

  //useful things to know (UTTK): callable classes <-- very simple call
  @override
  Future <Either<Failure, NumberTrivia>> call(
  //don't need to call number just params
  Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable{
  final int number;

  Params({@required this.number}): super([number]);
}