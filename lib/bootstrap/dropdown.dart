library bs_dropdown;
import 'package:polymer/polymer.dart';
import 'polymer_base.dart';
import 'dart:html';

class DropDownOption {
  String type;
  String label;
  String glyph;
  String enabledClass = "";
  bool _enabled = true;
  bool get enabled => _enabled;
  void set enabled(bool value) {
    _enabled = value;
    enabledClass = (_enabled ? "" : "disabled");
  }
  Function action;
}

@CustomTag('bs-dropdown')
class BsDropDown extends BsPolymerElement with Observable {
  @published List<DropDownOption> options = toObservable([]);
  @published String label = "Button";
  @published String buttonType = "btn btn-default";
  @published bool isSplit = false;
  
  BsDropDown.created() : super.created() {
    onClick.listen(onItemClicked);
  }
  
  DropDownOption addOption(String label, String glyph, Function action) {
    DropDownOption option = new DropDownOption()
      ..type = "item"
      ..label = label
      ..glyph = (glyph != null ? glyph : "")
      ..action = action;
    options.add(option);
    return option;
  }
  
  DropDownOption addDivider() {
      DropDownOption option = new DropDownOption()
        ..type = "divider";
      options.add(option);
      return option;
  }
  
  DropDownOption addHeader(String label) {
      DropDownOption option = new DropDownOption()
        ..type = "header"
        ..label = label;
      options.add(option);
      return option;
  }
  
  bool removeOption(DropDownOption option) {
      return options.remove(option);
    }
  
  void onItemClicked(MouseEvent e) {
    String itemIndex = readAttribute((e.target as Element), "data-item-index");
    if (itemIndex != null && !itemIndex.isEmpty && options[int.parse(itemIndex)].action != null && options[int.parse(itemIndex)].enabled) {
      options[int.parse(itemIndex)].action();
    }
  }
  
}

