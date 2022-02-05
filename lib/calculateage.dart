
import 'package:app_age/age_module.dart';
import 'package:app_age/details.dart';
import 'package:app_age/duration_model.dart';
import 'package:age/age.dart' as ag;
class calculatorage{
  

Age calculateAge(DateTime birthday , DateTime futuredate){
  ag.AgeDuration age;


  age = ag.Age.dateDifference(
      fromDate: birthday, toDate: futuredate, includeToDate: false);

  print('Your age is $age'); // Your age is Years: 30, Months: 0, Days: 4
  
  Age userage = Age();

  userage.years = age.years;
  userage.month = age.months;
  userage.days = age.days;
  return userage;

}  

durnext calculatenextbirthday(DateTime birthday , DateTime futuredate){

  durnext usernextbirth = durnext();
  ag.AgeDuration age;

  age = ag.Age.dateDifference(fromDate: birthday, toDate: futuredate);

  usernextbirth.month = age.months;
  usernextbirth.days = age.days;
  print('Your age is $age'); 
  return usernextbirth;

}
  
}




