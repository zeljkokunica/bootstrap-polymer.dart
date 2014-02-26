import 'package:polymer/polymer.dart';
import 'polymer_base.dart';
import 'dart:html';

class DrowDownOption {
  String label;
  String glyph;
  Function action;
}

@CustomTag('bs-dropdown')
class BsDropDown extends BsPolymerElement with Observable {
  @published List<DrowDownOption> options = toObservable([]);
  @published String label = "Button";
  
  
  BsDropDown.created() : super.created() {
    onClick.listen(onItemClicked);
  }
  
  DrowDownOption addOption(String label, String glyph, Function action) {
    DrowDownOption option = new DrowDownOption()
      ..label = label
      ..glyph = (glyph != null ? glyph : "")
      ..action = action;
    options.add(option);
    return option;
  }
  
  void onItemClicked(MouseEvent e) {
    String itemIndex = readAttribute((e.target as Element), "data-item-index");
    if (itemIndex != null && !itemIndex.isEmpty && options[int.parse(itemIndex)].action != null) {
      options[int.parse(itemIndex)].action();
    }
  }
  
}

