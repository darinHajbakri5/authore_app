import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/author_cubit.dart';
import 'screens/author_search_page.dart';
import 'api/author_api_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Author Search',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => AuthorCubit(apiClient: AuthorApiClient()),
        child: AuthorSearchPage(),
      ),
    );
  }
}
