import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/author_cubit.dart';
import '../bloc/author_state.dart';
import 'author_works_page.dart';

class AuthorSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Authors')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) =>
                  context.read<AuthorCubit>().searchAuthor(value),
              decoration: InputDecoration(
                labelText: 'Enter author name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<AuthorCubit, AuthorState>(
              builder: (context, state) {
                if (state is AuthorLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is AuthorLoaded) {
                  return ListView.builder(
                    itemCount: state.authors.length,
                    itemBuilder: (context, index) {
                      final author = state.authors[index];
                      String birthDate = author['birth_date'] ?? 'Unknown';
                      String deathDate = author['death_date'] ?? 'Unknown';
                      return ListTile(
                        title:
                            Text('${author['name']} ($birthDate - $deathDate)'),
                        subtitle: Text('Top Work: ${author['top_work']}'),
                        onTap: () {
                          final authorId = author['key'].split('/').last;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AuthorWorksPage(authorId: authorId),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (state is AuthorError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return Center(
                    child: Text('Please start searching for authors'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
