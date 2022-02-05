import 'dart:collection';

import 'package:app_age/age_module.dart';
import 'package:app_age/calculateage.dart';
import 'package:app_age/duration_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class Details extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  Age _userage = Age();
  final durnext _nextduration = durnext() ;
  final TextEditingController _birthdaydate = 
  TextEditingController(text: "2000-01-01");
  final TextEditingController _todaydate = 
  TextEditingController(text: "2000-01-01");
   DateTime dateofbirth;
   DateTime dateoftoday;
  
   BuildContext context;
  


  @override
  Widget build(BuildContext context) {
    this.context = context;
    _nextduration.days = 16;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          
          children: [     
            _datefield(),
            
            SizedBox(
              height: 40,
            ),
            btns(),
            SizedBox(
              height: 40,
            ),
            Text("Age is",style: TextStyle(
              fontSize: 26
            ),),
            SizedBox(
              height: 10,
            ),
            ageIs(),
            SizedBox(
              height: 40,
            ),
            Text("Next Birthday in ",style: TextStyle(
              fontSize: 26
            ),),
            SizedBox(
              height: 10,
            ),
            nextbirthday(),
           
          ],
        ),
      ),
    );
  }

  
  _datefield(){
    return Column(
      
      children: [
        Padding(padding: EdgeInsets.only(top: 20.0)),
        Text("Enter your Birthday date" , style: TextStyle(
          fontSize: 26,
        )),
        SizedBox(
         height: 10,
        ),
        Container(
          
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(5),
        
            ),
          
          child: birthdaydate(),
            
          ),
          SizedBox(
            height: 20,
          ),
            Text("Enter date of today" , style: TextStyle(
          fontSize: 26,
        )),
        SizedBox(
         height: 10,
        ),
        Container(
          
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(5),
        
            ),
          
          child: todaydate(),
            
          ),
        
      ],
    );
  }

  Row btns (){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold)),
          onPressed: () {
            print("reset");
          },
          child:  Text("Reset"),
        ),
       ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold)),
          onPressed: () {
           
          Age _test= calculatorage().calculateAge(dateofbirth, dateoftoday);
          durnext _tests = calculatorage().calculatenextbirthday(dateofbirth, dateoftoday);
          print(_tests);
          
          },
          child:  Text("Calcule")),
      ],

    );
  }
  

  Flexible birthdaydate() {
    return Flexible(
    flex: 2,
    child: DateTimeField(
      controller: _birthdaydate,
      readOnly: true,
      textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top:15),
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.all(0.0),                
                      child: Icon(                    
                          Icons.calendar_today,
                          color: Colors.blue,
                          
                          
                        ),
                    ),
                    
                  ) ,
                  format: format,
                  onShowPicker: (context, currentValue)  async{
                    
                    
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100),
                        
                        );
                    dateofbirth = date;
                        
                  },
                      
                ),
  );

  
  }
  Flexible todaydate() {
    return Flexible(
    flex: 2,
    child: DateTimeField(
      controller: _todaydate,
      readOnly: true,
      textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top:15),
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.all(0.0),                
                      child: Icon(                    
                          Icons.calendar_today,
                          color: Colors.blue,
                          
                          
                        ),
                    ),
                    
                  ) ,
                  format: format,
                  onShowPicker: (context, currentValue) async{
                    
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100),
                        );
                        dateoftoday = date;
                        
                  },
                      
                ),
  );

  
  }
  
 shapecol(String nbr , String nbrm){
   return Container(
     decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(5),
     ),
     
     width: 100,
     height: 60,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         Flexible(
           flex: 1,
           child: Container(
             color: Colors.blue,
             child: Center(
               child: Text(nbr,style: TextStyle(
                 color: Colors.white,
                 fontSize: 16.0
               ),),
             ),
           ),
         ),
         Flexible(
           flex: 1,
           child: Container(
             
             child: Center(
               child: Text(nbrm,style: TextStyle(
                 
                 color: Colors.blue,
                 fontSize: 16.0
               ),),
             ),
           ),
         )
        
       ],
     ),
   );
 }

 ageIs(){
   return Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: [
       shapecol("Years",_userage.years.toString()),
       shapecol("Month",_userage.month.toString()),
       shapecol("Days",_userage.days.toString())
       
     ],
   );
 }
 nextbirthday(){
   return Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: [
       
       shapecol("Years",""),
       shapecol("Month",_nextduration.month.toString()),
       shapecol("Days",_nextduration.days.toString())
     ],
   );
 }
}