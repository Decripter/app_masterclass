import 'package:app_masterclass/app/home/tabs/repositories/domain/usecases/get_posts.dart';
import 'package:app_masterclass/app/home/tabs/repositories/presenter/dependencies/repo_injections.dart';
import 'package:flutter/material.dart';
import 'package:uno/uno.dart';

import '../../external/datasources/gitrepo_datasource.dart';
import '../../infra/repositories/gitrepo_repository.dart';
import '../bloc/repository_bloc.dart';

class RepositoryDependency extends InheritedWidget {
  RepositoryDependency({super.key, required super.child});

  final RepoInjection repoInjection = RepoInjection(
      repoBloc: BlocRepository(GetGitRepo(
          GitRepoRepository(GitRepoDatasource(Uno(), userName: 'Decripter')))));
  BlocRepository get repoBloc => repoInjection.repoBloc;

  static of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<RepositoryDependency>()!;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}