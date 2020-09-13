import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:search_arch/core/usecases/usecase.dart';
import 'package:search_arch/features/number_triva/domain/entities/number_trivia.dart';
import 'package:search_arch/features/number_triva/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_arch/features/number_triva/domain/usecases/get_random_number_trivia.dart';



class MockNumberTriviaRepository extends
Mock implements NumbertTriviaRepository{}

//use loose cuppling
//this is called the setup methods
void main(){
  GetRandomNumberTrivia usecase; // this is a red phase right now because there are red swiggly lines so not compileable
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp((){
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  //no specified number because it's random
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');
  //AAA test means arrange, act, and assert
  test(
      'should get trivia from the repository',
          () async{
        //arrange
        //when the program is called with any number then always answers with success(Right side)
        when(mockNumberTriviaRepository.getRandomNumberTrivia()).thenAnswer((_) async => Right(tNumberTrivia)); //Right means success while Left means failure
        //act
        //you can type usecase.call to call to but no need
        final result = await usecase(NoParams());
        //assert
        expect(result, Right(tNumberTrivia));
        //42 is a life saver number it would output an incorrect result
        verify(mockNumberTriviaRepository.getRandomNumberTrivia());
        //should do anymore with the test
        verifyNoMoreInteractions(mockNumberTriviaRepository);
      }
  );
}
