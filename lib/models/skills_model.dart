class SkillsModel {

  SkillsModel(this.skill,this.percentage);
  String skill;
  double percentage;

  static List<SkillsModel> getSkills(){
    List<SkillsModel> skills = new List();
    skills.add(SkillsModel("Android",0.8));
    skills.add(SkillsModel("Java",0.7));
    skills.add(SkillsModel("Kotlin",0.6));
    skills.add(SkillsModel("Flutter",0.7));
    skills.add(SkillsModel("Dart",0.6));
    skills.add(SkillsModel("React-Native",0.5));
    skills.add(SkillsModel("JavaScript",0.5));
    skills.add(SkillsModel("SQL",0.5));
    skills.add(SkillsModel("Firebase",0.7));
    skills.add(SkillsModel("Spring",0.5));
    skills.add(SkillsModel("Hibernate",0.5));
    return skills;
  }
}