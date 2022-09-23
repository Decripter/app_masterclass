import 'package:app_masterclass/app/repositories/external/datasources/commits_gitrepo_datasource.dart';
import 'package:app_masterclass/app/repositories/infra/adapters/commits_gitrepo_adapter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uno/uno.dart';

import '../../domain/entities/gitrepo.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/gitrepo_repository.dart';
import '../../external/datasources/stars_gitrepo_datasource.dart';
import '../adapters/gitrepo_adapter.dart';
import '../adapters/stars_gitrepo_adapter.dart';
import '../datasources/commits_gitrepo_datasource.dart';
import '../datasources/gitrepo_datasource.dart';
import '../datasources/stars_gitrepo_datasource.dart';

class GitRepoRepository extends IGitRepoRepository {
  final IGitRepoDatasource gitrepoDatasource;

  GitRepoRepository(this.gitrepoDatasource);

  @override
  Future<Either<IGitRepoException, List<GitRepo>>> getRepos() async {
    late ICommitsGitRepoDatasource commitGitRepoDatasource;
    late IStarsGitRepoDatasource starGitRepoDatasource;
    try {
      final list = await gitrepoDatasource.getRepos();

      final reposList = list.map(GitRepoAdapter.fromJson).toList();
      for (int repo = 0; repo < 5; repo++) {
//commits

        commitGitRepoDatasource = CommitsGitRepoDatasource(
            //TODO!
            userName: 'decripter',
            repositoryName: reposList[repo].name,
            uno: Uno());
        var resultCommits = await commitGitRepoDatasource.getCommitsRepo();
        var commitsList =
            resultCommits.map(CommitsGitRepoAdapter.fromJson).toList();
        // print(commitsList.length);

        reposList[repo].commits = commitsList.length;

//stars
        starGitRepoDatasource = StarsGitRepoDatasource(
            userName: 'decripter',
            repositoryName: reposList[repo].name,
            uno: Uno()); //TODO noa instanciar nada aqui, tudo via injecao
        var resultStars = await starGitRepoDatasource.getStarsRepo();
        var starsList = resultStars.map(StarsGitRepoAdapter.fromJson).toList();
        reposList[repo].stars = starsList.length;
      }
      return right(reposList.sublist(0, 5));
    } on IGitRepoException catch (e) {
      return left(e);
    }
  }
}
