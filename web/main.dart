import 'dart:html';
import 'dart:svg';

Iterable<String> thingsTodo() sync* {
  const actions = ['Walk', 'Wash', 'Feed'];
  const pets = ['cats', 'dogs'];

  for (final action in actions) {
    for (final pet in pets) {
      if (pet != 'cats' || action == 'Feed') {
        yield '$action the $pet';
      }
    }
  }
}


LIElement newLI(String itemText) =>
    (document.createElement('li') as LIElement)..text = itemText;

void main() {
  // querySelector('#output')?.text = 'Your Dart app is running.';
  final HtmlElement output = querySelector('#output') as DivElement;
  output.text = 'Aloha';

  Element list = Element.ul();

  for (final item in thingsTodo()) {
    list?.append(newLI(item));
  }

  list.onClick.listen((event) {
    print("Clicked");
    list?.append(newLI("Clicked"));
  });

  output.append(list);
}
