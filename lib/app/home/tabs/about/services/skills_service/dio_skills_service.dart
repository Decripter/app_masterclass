import 'package:app_masterclass/app/home/tabs/about/models/dev_skills_model.dart';
import 'package:app_masterclass/app/home/tabs/about/services/skills_service/skills_service.dart';
import 'package:app_masterclass/security/hasura_key.dart';

import 'package:dio/dio.dart';

class DioSkillsService extends ISkillsService {
  @override
  Future<DevSkillsModel> getDevSkills({url}) async {
    var dio = Dio();
    final response = await dio.get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "x-hasura-admin-secret": HasuraKey.key
        },
      ),
    );
    return DevSkillsModel.fromMap(response.data);
  }
}
