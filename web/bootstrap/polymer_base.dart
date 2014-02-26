import 'package:polymer/polymer.dart';
import 'dart:html';

class BsPolymerElement extends PolymerElement with Observable {
  //This enables the styling via bootstrap.css
  bool get applyAuthorStyles => true;
  
  // This enables the bootstrap javascript to see the elements
  @override
  Node shadowFromTemplate(Element template) {
    var dom = instanceTemplate(template);
    append(dom);
    shadowRootReady(this, template);
    return null; // no shadow here, it's all bright and shiny
  }  
  
  String readAttribute(Element element, String name, {bool recursive: true}) {
      if (element == null) {
        return null;
      }
      if(element.attributes.containsKey(name)) {
        String value = element.attributes[name];
        if (value == "") {
          value = null;
        }
        return value;
      }
      else if (recursive == true) { 
        return readAttribute(element.parent, name);
      }
      else {
        return null;
      }
    }
  
  
  BsPolymerElement.created() : super.created() {
  }
}

