import 'package:flutter/material.dart';

import 'package:app_masterclass/app/home/tabs/about/models/dev_model.dart';
import 'package:app_masterclass/components/header_page_widget.dart';
import 'package:app_masterclass/app/home/tabs/about/components/skills_widget.dart';
import 'package:app_masterclass/app/home/tabs/about/components/card_about_widget.dart';
import 'package:app_masterclass/app/home/tabs/about/blocs/bloc_about/about_state.dart';
import 'package:app_masterclass/app/home/tabs/about/blocs/bloc_about/about_events.dart';
import 'package:app_masterclass/app/home/tabs/about/blocs/bloc_skills/skills_state.dart';
import 'package:app_masterclass/app/home/tabs/about/blocs/bloc_skills/skills_events.dart';
import 'package:app_masterclass/app/home/tabs/about/dependencies/dependency_injection.dart';
import 'package:app_masterclass/app/home/tabs/about/components/favorite_tecnologies_list.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dependencies = DependencyInjection.of(context);

    final skillsBloc = dependencies.skillsBloc;
    final aboutBloc = dependencies.aboutBloc;
    aboutBloc.inputAbout.add(LoadAboutEvent(userName: 'decripter'));

    return Scaffold(
      appBar: HeaderPageWidget(title: 'Sobre o dev'),
      body: StreamBuilder<AboutState>(
          stream: aboutBloc.stream,
          builder: (context, AsyncSnapshot<AboutState> snapshot) {
            final dev = snapshot.data?.devModel ??
                DevModel(avatarUrl: '', name: '', bio: '', blog: '');

            if (dev.blog.isNotEmpty) {
              skillsBloc.inputSkills.add(LoadSkillsEvent(devModel: dev));
            }
            return Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                child: SingleChildScrollView(
                  //TODO! fix this!!!!!!!
                  physics: const ScrollPhysics(),
                  child: StreamBuilder<SkillsState>(
                      stream: skillsBloc.stream,
                      builder: (context, AsyncSnapshot<SkillsState> snapshot) {
                        final favoritesTecnologies = snapshot
                                .data?.devSkillsModel.favoritesTecnologies ??
                            [];
                        final skillsList =
                            snapshot.data?.devSkillsModel.skills ?? [];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardAboutWidget(
                              urlImage: dev.avatarUrl,
                              userName: dev.name,
                              bio: dev.bio,
                            ),
                            FavoriteTecnologiesList(
                                favoritesTecnologies: favoritesTecnologies),
                            SkilsWidget(skills: skillsList),
                          ],
                        );
                      }),
                ));
          }),
    );
  }
}
