import 'dart:html';

import 'package:react/react_client.dart';
import 'package:react/react_dom.dart' as react;

import 'ss_experience_app.dart';

class SSExperience {
  final HtmlElement element;

  SSExperience(this.element) {
    setClientConfiguration();

    ShadowRoot shadow = element.attachShadow({'mode': 'open'});
    react.render(SSExperienceApp()(), shadow);
  }
}