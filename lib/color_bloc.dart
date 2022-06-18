import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { event_red, event_green }

class ColorBloc {
  Text _color = Text('Red');

  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Text>();
  Stream<Text> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(ColorEvent event) {
    if (event == ColorEvent.event_red)
      _color = Text('Red');
    else if (event == ColorEvent.event_green)
      _color = Text('Green');
    else
      throw Exception('Wrong Event Type');

    _outputStateController.sink.add(_color);
  }

  ColorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
