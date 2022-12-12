//  query => 서버 데이터 조회(CRUD에서 R) 을 위한 단순 fetch용 쿼리를 날릴 때 사용
String getPostByID = r'''
 query($id: ID!) { 
  POST(id: $id) {
   }
  }
''';

// Mutation => 서버 데이터 변경을 요청할 때 사용하는 방식으로 http의 post 같은 개
String createPost = r'''
  mutation($post: createPostInput) {
    createPost(input: $post) {
    post {
      title
      }
     }
    }
''';

// Subscription => Query와 비슷하지만 web socket과 stream을 사용하여 실시간으로 변화는 데이터 조회
String fetchUsers = r'''
  subscription fetchOnlineUsers {
    online_users {
      user {
        name
      }
     }
    }
''';

String tokenAuth = r'''
  login($id: String!, $password: password) {
    login {
      tokenAuth {
      success
      accesstoken
      refreshtoken
     }
   }
  }
''';