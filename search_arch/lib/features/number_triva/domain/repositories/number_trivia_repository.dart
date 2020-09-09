import 'package:dartz/dartz.dart';
import 'package:search_arch/core/error/failures.dart';
import 'package:search_arch/features/number_triva/domain/entities/number_trivia.dart';

abstract class NumbertTriviaRepository{
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
} 
