import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_music_1116/api.dart';
import 'package:graphql_music_1116/config.dart';
import 'package:graphql_music_1116/login/cubit/token_cubit.dart';

// import 'package:graphql_music_1116/cubit/deep_link_cubit.dart';
import 'package:graphql_music_1116/login/login_page.dart';
import 'package:graphql_music_1116/utils/constants.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tokenCubit = TokenCubit();
    final client = Config(origin: '$clientUrl/graphql', tokenCubit: tokenCubit);

    return MultiProvider(
      providers: [
        Provider.value(value: client),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
//Widget build(BuildContext context) {
  //return Query(options: QueryOptions(document: gql(getPostByID), variables: {"id" : "${검색할 ID}"}),
//    builder: (result, {fetchMore, refetch}) 
//    );
// }
// builder: (result, {refetch, fetchMore}) {  
// refetch : 쿼리를 다시 실행 / 무조건 네트워크에서 fetch한 결과를 반환한다. 새로고침 시에 실행하면 된다.
// fetchmore 쿼리의 options 를 변경해 쿼리를 쓸 수 있다. 가져온 쿼리 결과를 원래의 쿼리 결과와 합쳐서 return 할 수 있어서 페이지네이션을 할 때 쓰기 좋다.
//    if (result.isLoading) {
//          return CircularProgressIndicator();
// }
// }
