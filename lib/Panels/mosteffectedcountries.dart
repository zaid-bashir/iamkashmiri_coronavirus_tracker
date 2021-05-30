import 'package:flutter/material.dart';

class MostAffectedPanel extends StatefulWidget {
  final List countryData;
  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);
   @override
  _MostAffectedPanelState createState() => _MostAffectedPanelState(countryData);
}

class _MostAffectedPanelState extends State<MostAffectedPanel> {
  List countryData;

  _MostAffectedPanelState(this.countryData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20),

        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder:(context,index){
          return Container(
            margin:EdgeInsets.symmetric(horizontal:10,vertical: 10 ),
            child:Row(
              children: [
                Image.network(countryData[index]['countryInfo']['flag'],height: 30,),
                SizedBox(width: 10,),//for padding
                Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                Text('deaths:' +countryData[index]['deaths'].toString(),style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold),),
              ],
            ) ,
          );
        },
          itemCount: 5,
        ),

      ),
    );
  }
}
