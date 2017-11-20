import 'dart:html';

import 'package:ss_experience/ss_experience.dart';

void main() {
  document.registerElement('ss-experience', SSExperience);
  document.querySelector('#ssExperience').append(new Element.tag('ss-experience'));
}