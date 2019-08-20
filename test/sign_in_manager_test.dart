import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_manager.dart';

import 'mocks.dart';

class MockValueNotifier<T> extends ValueNotifier<T> {
  MockValueNotifier(T value) : super(value);

  List<T> values = [];

  @override
  set value(T newValue) {
    values.add(newValue);
    super.value = newValue;
  }
}

void main() {

  MockAuth mockAuth;
  MockValueNotifier<bool> isLoading;
  SignInManager manager;

  setUp(() {
    mockAuth = MockAuth();
    isLoading = MockValueNotifier<bool>(false);
    manager = SignInManager(auth: mockAuth, isLoading: isLoading);
  });

  test('sign-in', () async {

    await manager.signInAnonymously();

    expect(isLoading.values, [true, false]);
  });
}