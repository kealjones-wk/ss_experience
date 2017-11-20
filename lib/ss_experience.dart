library ss_experience;

import 'dart:html';

import './src/ss_experience.dart';

export './src/ss_experience.dart';
export './src/ss_experience_app.dart';

void main() {
  document.registerElement('ss-experience', SSExperience);
}