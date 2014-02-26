import "package:polymer/polymer.dart";
import "package:bootjack/bootjack.dart";
import "dart:html";
import "package:polyboot/polyboot.dart";

void main() {
  initPolymer().run(init);
}

void init() {
  Dropdown.use();
  Tab.use();
  
  Function removeButtonEnabledCheck;
     
  BsDropDown optionsDropDown = querySelector("#optionsDrowDown");
  optionsDropDown.buttonType = Constants.BUTTON_TYPE_INFO;
  optionsDropDown.addHeader("Main stuff");
  optionsDropDown.addOption("Add item", "glyphicon-plus", () {
    optionsDropDown.addOption("Added", "glyphicon-edit", () => print("I was added!"));
    removeButtonEnabledCheck();
  });
  DropDownOption removeItem = optionsDropDown.addOption("Remove", "glyphicon-minus", (){
    if (optionsDropDown.options.length > 0) {
      optionsDropDown.removeOption(optionsDropDown.options.last);
      removeButtonEnabledCheck();
    }
  });
  
  optionsDropDown.addDivider();
  optionsDropDown.addOption("Third", "glyphicon-wrench", () => print("selected 3"));
  optionsDropDown.addHeader("Other stuff");
  int defaultOptionsCount = optionsDropDown.options.length;
  removeButtonEnabledCheck = () {
      if (optionsDropDown.options.length <= defaultOptionsCount) {
        removeItem.enabled = false;
      }
      else {
        removeItem.enabled = true;
      }
    };
    
  removeButtonEnabledCheck();
  
  BsDropDown otherDropDown = new Element.tag("bs-dropdown") as BsDropDown
      ..buttonLabel = "Other options"
      ..buttonType = Constants.BUTTON_TYPE_WARNING
      ..buttonSize = Constants.BUTTON_SIZE_SMALL
      ..isSplit = true;
  otherDropDown.addOption("Other", "glyphicon-search", () => print("other"));
  
  querySelector("#dropdownTab").children.add(otherDropDown);
  
  
}