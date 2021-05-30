import 'package:flutter/material.dart';
class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 3),
          children: [
            StatusPanel(
              title:"Confirmed Cases:-\n",
              panelColor:Colors.red,
              textColor:Colors.white,
              count:worldData['cases'].toString()//to covert the json values to string format
            ),
            StatusPanel(
                title:"Active Cases:-\n",
                panelColor:Colors.orange,
                textColor:Colors.black,
                count:worldData['active'].toString()
            ),
            StatusPanel(
                title:"Recoverd:-\n",
                panelColor:Colors.white,
                textColor:Colors.green,
                count:worldData['recovered'].toString()
            ),
            StatusPanel(
                title:"Deaths:-\n",
                panelColor:Colors.black,
                textColor:Colors.white,
                count:worldData['deaths'].toString()
            ),
            StatusPanel(
                title:"Today Cases:-\n",
                panelColor:Colors.orange,
                textColor:Colors.black,
                count:worldData['todayCases'].toString()//to covert the json values to string format
            ),
            StatusPanel(
                title:"Today Deaths:-\n",
                panelColor:Colors.red,
                textColor:Colors.white,
                count:worldData['todayDeaths'].toString()//to covert the json values to string format
            ),
          ],
        ),
      ),
    );
  }
}
class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;//device width
    return Container(
      padding: EdgeInsets.all(10),
      height: 900,width: width/2,
      color:panelColor,
      margin: EdgeInsets.all(6),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16,color:textColor),
          ),
          Text(
            count,
            style:TextStyle(fontWeight:FontWeight.bold,fontSize: 16,color: textColor),
          )],
      ),
    );
  }
}




