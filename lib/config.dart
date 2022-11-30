import 'package:flutter/material.dart';
import 'package:flutter_cowork_practice/api.dart';
import 'package:flutter_cowork_practice/login/cubit/token_cubit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class Config {
  final TokenCubit tokenCubit;
  Config({
    required String origin,
    required this.tokenCubit,
  });
  final httpLink = HttpLink('http://buildpay.co.kr');

  final authLink = AuthLink(
    getToken: () async {
      return tokenCubit;
    },
  );
  final link = authLink.concat(httpLink);

  // ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
  //   link: link,
  //   cache: GraphQLCache(),
  //   defaultPolicies: DefaultPolicies(
  //     query: Policies(fetch: FetchPolicy.networkOnly),
  //   ),
  // ));
  final client = GraphQLClient(
    link: link,
    cache: GraphQLCache(),
    defaultPolicies: DefaultPolicies(
      query: Policies(fetch: FetchPolicy.networkOnly),
    ),
  );
  void token =  TokenCubit(
    
  );

// final result = await mutate(
//   MutationOptions(
//     document:
     
//     ),
//   );

  // final readRespositioriesResult = useQuery(
  //   QueryOptions(
  //     document: gql(getPostByID), // document : 쿼리문을 포함하고 있는 필수 인자
  //     variables: {
  //       // variables: 쿼리문에 필요한 변수들을 넣어주는 곳
  //       'nRepositories ': 20,
  //     },

  //     // pollInterval: const Duration(seconds: 3), // 쿼리를 계속해서 특정 시간마다 refetch해야 할 경우 쓰는 것
  //   ),
  // );
  // final createPostMutaion = useMutation(
  //   MutationOptions(
  //       document: gql(createPost),
  //       update: (cache, result) => result,
  //       onCompleted: (data) {
  //         Text('d');
  //       }),
  // );

  void Config_Query() {
    client.query(QueryOptions(document: gql(getPostByID)));
    print('${getPostByID}');
  }
}

void Config_Mutation() {
  result.mutate()
}
