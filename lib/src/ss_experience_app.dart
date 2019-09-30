import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:shell_events/shell_events.dart' show ShellPostMessageEvent;

part 'ss_experience_app.over_react.g.dart';

@Factory()
UiFactory<SSExperienceAppProps> SSExperienceApp = _$SSExperienceApp;

@Props()
class _$SSExperienceAppProps extends UiProps {
}

@State()
class _$SSExperienceAppState extends UiState {
  int counter;
}

@Component2()
class SSExperienceAppComponent extends UiStatefulComponent2<SSExperienceAppProps, SSExperienceAppState>  {
  InputElement _postMessageInput;

  Map get initialState => (newState()
    ..counter = 0
  );

  render() {
    return Dom.div()(
      (Dom.h4()..style = {'margin': 0})('Spreadsheets: Using over_react 3.1.0-wip & Component2'),
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

    event.target.dispatchEvent(new ShellPostMessageEvent(_postMessageInput.value).e);
  }
}
