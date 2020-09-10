import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:search_arch/features/number_triva/domain/entities/number_trivia.dart';
import 'package:search_arch/features/number_triva/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_arch/features/number_triva/domain/usecases/get_concrete_number_trivia.dart';


class MockNumberTriviaRepository extends
Mock implements NumbertTriviaRepository{}

//use loose cuppling
//this is called the setup methods
void main(){
  GetConcreteNumberTrivia usecase; // this is a red phase right now because there are red swiggly lines so not compileable
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp((){
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');
  //AAA test means arrange, act, and assert
  test(
    'should get trivia for the number from the repository',
      () async{
        //arrange
        //when the program is called with any number then always answers with success(Right side)
        when(mockNumberTriviaRepository.getConcreteNumberTrivia(any)).thenAnswer((_) async => Right(tNumberTrivia)); //Right means success while Left means failure
        //act
        final result = await usecase.execute(number: tNumber);
        //assert
        expect(result, Right(tNumberTrivia));
        //42 is a life saver number it would output an incorrect result
        verify(mockNumberTriviaRepository.getConcreteNumberTrivia(42));
        //should do anymore with the test
        verifyNoMoreInteractions(mockNumberTriviaRepository);
      }
  )
}
