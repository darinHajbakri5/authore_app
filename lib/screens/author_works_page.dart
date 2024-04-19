import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/author_cubit.dart';
import '../bloc/author_state.dart';

class AuthorWorksPage extends StatefulWidget {
  final String authorId;

  const AuthorWorksPage({Key? key, required this.authorId}) : super(key: key);

  @override
  _AuthorWorksPageState createState() => _AuthorWorksPageState();
}

class _AuthorWorksPageState extends State<AuthorWorksPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        BlocProvider.of<AuthorCubit>(context).fetchAuthorWorks(widget.authorId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Author Works'),
      ),
      body: BlocBuilder<AuthorCubit, AuthorState>(
        builder: (context, state) {
          if (state is WorksLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WorksLoaded) {
            return ListView.builder(
              itemCount: state.works.length,
              itemBuilder: (context, index) {
                final work = state.works[index];
                return ListTile(
                  title: Text(work['title']),
                  subtitle:
                      Text('Published Year: ${work['first_publish_year']}'),
                );
              },
            );
          } else if (state is WorksError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: Text('No data available'));
        },
      ),
    );
  }
}
