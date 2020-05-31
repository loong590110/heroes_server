import '../heroes_server.dart';

class HeroesController extends ResourceController {
  final _heroes = [
    {"id": 101, "name": "Julius", "desc": "handsome"},
    {"id": 102, "name": "Aaron", "desc": "smart"}
  ];

  @Operation.get()
  Future<Response> getHeroes() async {
    return Response.ok(_heroes);
  }

  @Operation.get('id')
  Future<Response> getHeroById(@Bind.path('id') int id) async {
    return Response.ok(
        _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => {}));
  }
}
