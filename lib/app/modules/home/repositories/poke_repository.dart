import 'package:dio/dio.dart';
import '../models/poke_model.dart';

class PokeRepository{
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokeModel>> getAllPokemons() async {
    var response = await dio.get('/pokemon');
    List<PokeModel> list = [];
    for(var json in response.data['results']){
      PokeModel model = PokeModel(name: json['name']);
      list.add(model);
    }
    return list;
  }
}