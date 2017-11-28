import 'package:over_react/over_react.dart';

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
      )
    );
  }
}
