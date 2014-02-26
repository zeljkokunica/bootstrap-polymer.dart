import "package:polymer/polymer.dart";
import "package:bootjack/bootjack.dart";
import "dart:html";
import "./bootstrap/dropdown.dart";
void main() {
  initPolymer().run(init);
}

void init() {
  Dropdown.use();
  Tab.use();
  
  BsDropDown dropDown = querySelector("#testDropdown");
  dropDown.addOption("Dodaj", "glyphicon-search", () {
    dropDown.addOption("Dodano", "glyphicon-edit", () => print("Dodan!"));
  });
  dropDown.addOption("Druga", "glyphicon-wrench", () => print("odabrao 2"));
  dropDown.addOption("Treca", "", () => print("odabrao 3"));
  
  BsDropDown otherDropDown = new Element.tag("bs-dropdown") as BsDropDown;
  otherDropDown.addOption("Other", "glyphicon-search", () => print("other"));
  querySelector("#sample_container_id").children.add(otherDropDown);
  
}