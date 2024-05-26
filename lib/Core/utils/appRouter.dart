import 'package:go_router/go_router.dart';
import 'package:library_app/Features/Search/presentation/views/search_view.dart';
import 'package:library_app/Features/home/presentation/screens/home_screen.dart';

import '../../Features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const splash_View(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const Search_View(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const homeScreen(),
      ),
      // GoRoute(
      //   path: kBookDetailsView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => CombleteBookCubit(
      //       HomeRepoImp(api: DioConsumer(dio: Dio())),
      //     ),
      //     child: book_detils_view_body(
      //       bookModel: state.extra as BookModel,
      //     ),
      //   ),
      // ),
    ],
  );
}
