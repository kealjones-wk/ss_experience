import 'dart:html';

import 'package:js/js_util.dart';
import 'package:over_react/over_react.dart';
import 'package:shell_events/shell_events.dart' show ShellPostMessageEvent;

@Factory()
UiFactory<SSExperienceAppProps> SSExperienceApp;

@Props()
class SSExperienceAppProps extends UiProps {
}

@State()
class SSExperienceAppState extends UiState {
  int counter;
}

@Component()
class SSExperienceAppComponent extends UiStatefulComponent<SSExperienceAppProps, SSExperienceAppState>  {
  InputElement _postMessageInput;
  FormElement _postMessageForm;

  Map getInitialState() => (newState()
    ..counter = 0
  );

  render() {
    return Dom.div()(
      (Dom.h4()..style = { 'margin': 0 })('Spreadsheets: using over_react 1.18.1'),
      Dom.p()('Counter: ' + state.counter.toString()),
      Dom.div()(
        (Dom.button()
          ..onClick = (event) => setState(newState()..counter = ++state.counter)
        )('Increment'),
        (Dom.button()
          ..onClick = (event) => setState(newState()..counter = --state.counter)
        )('Decrement')
      ),
      (Dom.form()
        ..onSubmit = _handlePostMessageSubmit
        ..ref = (ref) {
          _postMessageForm = ref;
        }
      )(
        (Dom.label()
          ..htmlFor = 'shellMessage'
          ..style = {
            'display': 'block',
            'margin': '.8rem 0 .2rem 0'
          }
        )('Message'),
        (Dom.input()
          ..type = 'text'
          ..id = 'shellMessage'
          ..autoComplete = false
          ..ref = (ref) {
            _postMessageInput = ref;
          }
        )(),
        (Dom.button()
          ..type = 'submit'
          ..style = {
            'margin': '0 .2rem'
          }
        )('Post Message')
      )
    );
  }

  _handlePostMessageSubmit(SyntheticFormEvent event) {
    event.preventDefault();
    event.stopPropagation();
    
    var eventDetail = jsify({'message': _postMessageInput.value});
    _postMessageForm.dispatchEvent(new ShellPostMessageEvent(detail: eventDetail));
  }
}
