import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:app_masterclass/components/header_page_widget.dart';
import 'package:app_masterclass/app/home/tabs/activities/details_page/details_page.dart';
import 'package:app_masterclass/app/home/tabs/activities/components/card_activity_widget.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HeaderPageWidget(title: 'Atividades'),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CardActivityWidget(
                  icon: const Icon(FontAwesomeIcons.personRunning),
                  title: 'Animações',
                  amountOfExercises: '4',
                  content:
                      'Estudos sobre animações implícitas e controladas, contendo 4 exercícios e 2 estudos.',
                  navigateTo: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const DetailsPage(
                          title: 'Animações',
                          amountOfExercises: 4,
                        ),
                      ),
                    );
                  },
                ),
                CardActivityWidget(
                  icon: const Icon(FontAwesomeIcons.glasses),
                  title: 'Leitura de Mockup',
                  amountOfExercises: '2',
                  content:
                      'Aplicação da tecnica de leitura de mockup, contendo 2 exercicios',
                  navigateTo: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const DetailsPage(
                          title: 'Leitura de Mockup',
                          amountOfExercises: 2,
                        ),
                      ),
                    );
                  },
                ),
                CardActivityWidget(
                  icon: Image.asset(
                    'assets/material-toys/Icon material-toys.png',
                    color: Theme.of(context).indicatorColor,
                  ),
                  title: 'Playground',
                  amountOfExercises: '3',
                  content: 'Ambiente destinado a testes e estudos em geral',
                  navigateTo: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const DetailsPage(
                          title: 'Playground',
                          amountOfExercises: 3,
                        ),
                      ),
                    );
                  },
                ),
                CardActivityWidget(
                  icon: const Icon(FontAwesomeIcons.personRunning),
                  title: 'Animações',
                  amountOfExercises: '4',
                  content:
                      'Estudos sobre animações implícitas e controladas, contendo 4 exercícios e 2 estudos.',
                  navigateTo: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const DetailsPage(
                          title: 'Animações',
                          amountOfExercises: 4,
                        ),
                      ),
                    );
                  },
                ),
                CardActivityWidget(
                  icon: const Icon(FontAwesomeIcons.glasses),
                  title: 'Leitura de Mockup',
                  amountOfExercises: '2',
                  content:
                      'Aplicação da tecnica de leitura de mockup, contendo 2 exercicios',
                  navigateTo: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const DetailsPage(
                          title: 'Leitura de Mockup',
                          amountOfExercises: 2,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
