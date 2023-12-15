

import 'Person.dart';

main(){
  var person = Person(weight: 90, height: 100);
  var imc = person.calculerImc();
  print(imc);
  print(person.getMessage(39));
}