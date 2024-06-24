abstract class BaseUseCase<Type, Parameters> {
  //methods
  Future<Type> call({required Parameters parameters});
}
