@JS()
library whatever;

import 'dart:html';
import 'dart:js';
import 'dart:js_util';

import 'package:js/js.dart';

import 'package:ss_experience/ss_experience.dart';

@JS('Function')
external JSFunction(String arg1, String arg2, String functionBody);

Function(String, Function) defineElement = JSFunction('name', 'construct', '''
  customElements.define(name, class extends HTMLElement {
    constructor() {
      super();
      construct(this);
    }
  });
''');

void main() {
  defineElement('ss-experience', allowInterop((e) => SSExperience(e)));
}
