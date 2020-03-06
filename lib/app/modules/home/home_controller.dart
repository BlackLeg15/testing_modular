import 'package:mobx/mobx.dart';
import 'models/poke_model.dart';
import 'repositories/poke_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final PokeRepository repository;

  _HomeControllerBase(this.repository){
    fetchPokemons();
  }

  @observable
  ObservableFuture<List<PokeModel>> pokemons;

  @action
  fetchPokemons() {
    pokemons = repository.getAllPokemons().asObservable();
  }
}