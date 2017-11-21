import 'dart:html';

import 'package:react/react_client.dart';
import 'package:react/react_dom.dart' as react;

import 'ss_experience_app.dart';

class SSExperience extends HtmlElement {
  SSExperience.created() : super.created() {}
  
  void attached() {
    setClientConfiguration();

  ShadowRoot shadow = attachShadow({'mode': 'open'});
    react.render(SSExperienceApp()(), shadow);
  }
}