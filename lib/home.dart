import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  TextEditingController ageEcontroll= TextEditingController();
  TextEditingController ftEcontroll= TextEditingController();
  TextEditingController inEcontroll= TextEditingController();
  TextEditingController kgEcontroll= TextEditingController();

 double result=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI Calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(

                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      SizedBox(
                        width: 70,
                        child: TextFormField(
                          controller: ageEcontroll,

                          keyboardType: TextInputType.number,

                          decoration: InputDecoration(

                              labelText: 'Age'
                          ),

                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: TextFormField(
                          controller: ftEcontroll,
                          keyboardType: TextInputType.number,

                          decoration: InputDecoration(

                              labelText: 'Ht(ft)'
                          ),

                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: TextFormField(
                          controller: inEcontroll,
                          keyboardType: TextInputType.number,

                          decoration: InputDecoration(

                              labelText: 'Ht(in)'
                          ),

                        ),
                      ),



                    ],



                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.male)),

                      Text('|'),

                      IconButton(onPressed: (){}, icon: Icon(Icons.female)),
                      SizedBox(
                        width: 90,
                        child: TextFormField(

                          controller: kgEcontroll,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Weight(kg)'
                          ),

                        ),
                      ),
                      IconButton(onPressed: (){
                        double ft=double.tryParse(ftEcontroll.text)??0;
                        double inch=double.tryParse(inEcontroll.text)??0;
                        double kg=double.tryParse(kgEcontroll.text)??0;

                        double meter=(ft*12+inch)*0.0254;

                             result=kg/(meter*meter);


                              setState(() {

                             });



                      }, icon: Icon(Icons.arrow_forward_ios_rounded)),
                    ],
                  ),


                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 300,
                    child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(minimum: 15, maximum: 40,
                              ranges: <GaugeRange>[
                                GaugeRange(startValue: 0, endValue: 18, color:Colors.green),
                                GaugeRange(startValue: 18,endValue: 24,color: Colors.orange),
                                GaugeRange(startValue: 24,endValue: 40,color: Colors.red)],
                              pointers: <GaugePointer>[
                                NeedlePointer(value: result?.toDouble()??0
                                )],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(widget: Container(child:
                                Text(result.toStringAsFixed(2).toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                                    angle: 90, positionFactor: 0.5
                                )]
                          )]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text('Very Serverely Underweight',
                      style: TextStyle(
                        color: (result?.toDouble()??0) <= 15.9? Colors.green: Colors.black
                      ),
                      ),
                      Text('<- 15.9',
                        style: TextStyle(
                            color: (result?.toDouble()??0) <= 15.9? Colors.green: Colors.black
                        ),)
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Text('serverely Underweight'
                      ,style: TextStyle(

                          color: (result?.toDouble()??0) > 16.0 && (result?.toDouble()??0)<16.9? Colors.green:Colors.black

                        ),
                      ),
                      Text('16.0-16.9',
                        style: TextStyle(

                            color: (result?.toDouble()??0) > 16.0 && (result?.toDouble()??0)<16.9? Colors.green:Colors.black

                        ),)

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Text('Underweight',
                      style: TextStyle(

                        color: (result?.toDouble()??0) >17 && (result?.toDouble()??0) <18.4? Colors.green:Colors.black

                      ),
                      ),
                      Text('17.0-18.4',style: TextStyle(

                          color: (result?.toDouble()??0) >17 && (result?.toDouble()??0) <18.4? Colors.green:Colors.black

                      ),)

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Text('Normal',
                        style: TextStyle(

                            color: (result?.toDouble()??0) >18.5 && (result?.toDouble()??0) <24.9? Colors.green:Colors.black

                        ),
                      ),
                      Text('18.5-24.9', style: TextStyle(

                          color: (result?.toDouble()??0) >18.5 && (result?.toDouble()??0) <24.9? Colors.green:Colors.black

                      ),)

                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Text(' overweight',
                        style: TextStyle(

                            color: (result?.toDouble()??0) >25.0 && (result?.toDouble()??0) <29.9 ? Colors.green:Colors.black

                        ),
                      ),
                      Text('25.0-29.9',style: TextStyle(

                          color: (result?.toDouble()??0) >25.0 && (result?.toDouble()??0) <29.9 ? Colors.green:Colors.black

                      ),),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Text('Obese Class |',style: TextStyle(

                          color: (result?.toDouble()??0) >30.0 && (result?.toDouble()??0) <34.9 ? Colors.green:Colors.black

                      ),),
                      Text('30.0-34.9',style: TextStyle(

                          color: (result?.toDouble()??0) >25.0 && (result?.toDouble()??0) <29.9 ? Colors.green:Colors.black

                      ),)

                    ],
                  ),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Text('Obese Class ||',style: TextStyle(

                          color: (result?.toDouble()??0) >35.0 && (result?.toDouble()??0) <39.9 ? Colors.green:Colors.black

                      ),
                      ),
                      Text('30.0-39.9',style: TextStyle(

                          color: (result?.toDouble()??0) >30.0 && (result?.toDouble()??0) <39.9 ? Colors.green:Colors.black

                      ),)

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Text('Obese Class |||',style: TextStyle(

                          color: (result?.toDouble()??0) >=45.0  ? Colors.green:Colors.black

                      ),),
                      Text('>=45.0',style: TextStyle(

                          color: (result?.toDouble()??0) >45.0  ? Colors.green:Colors.black

                      ),)

                    ],
                  ),


                  Text('Normal Weight:119.180',
                    style:  TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.green
                    ),)



                ] ),
          ),
        )
    );


  }

  @override
  void dispose() {
ageEcontroll.dispose();
inEcontroll.dispose();
ftEcontroll.dispose();
kgEcontroll.dispose();
    super.dispose();
  }

  }


