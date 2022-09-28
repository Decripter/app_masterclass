import 'package:uno/uno.dart';

import '../../domain/errors/errors.dart';
import '../../infra/datasources/commits_gitrepo_datasource.dart';

class CommitsGitRepoDatasource implements ICommitsGitRepoDatasource {
  final String userName;
  final Uno uno;

  CommitsGitRepoDatasource({
    required this.userName,
    required this.uno,
  });

  @override
  Future<List> getCommitsRepo({
    required repositoryName,
  }) async {
    try {
      final response = await uno.get(
          'https://api.github.com/repos/$userName/$repositoryName/commits');

      return response.data;
    } catch (e, s) {
      throw DatasourcePostException(e.toString(), s);
    }
  }
}
