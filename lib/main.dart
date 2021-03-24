import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'My Food App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 Future<List<Foods>> bringFoods() async {

   var foodList=List<Foods>();
   
   var y1=Foods(1, "Meatball", "ayran.png", 36.78);
   var y2=Foods(2, "Buttermilk", "kofte.png", 5.09);
   var y3=Foods(3, "Fanta", "fanta.png", 7.98);
   var y4=Foods(1, "Pasta", "makarna.png", 36.78);
   var y5=Foods(1, "Kadayıf", "kadayif.png", 12.36);
   var y6=Foods(1, "Baklava", "baklava.png", 17.45);

   foodList.add(y1);
   foodList.add(y2);
   foodList.add(y3);
   foodList.add(y4);
   foodList.add(y5);
   foodList.add(y6);

   return foodList;


 }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),


      body: FutureBuilder<List<Foods>>(
        future: bringFoods(),
        builder: (context, snaoshot){
          if (snaoshot.hasData){
            var foodList=snaoshot.data;

            return ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context,indeks){
                var food=foodList[indeks];

                return GestureDetector(
                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(food: food,)));
                  },

                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150,
                            height: 150,
                            child: Image.asset("images/${food.foodPictureName}")),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(food.foodName,style: TextStyle(fontSize: 20, color: Colors.blue ),),
                            SizedBox(height: 50,),
                            Text("${food.foodPrice} \u{20BA} ",style: TextStyle(fontSize: 25, ),),
                          ],
                        ),

                        Spacer(),
                        Icon(Icons.arrow_right),


                      ],
                    ),

                  ),
                );

              },

            );

          }

          else{
            return Center();
          }
        },

      ),

    );
  }
}



//FOOD CLASS...
class Foods{
  int foodID;
  String foodName;
  String foodPictureName;
  double foodPrice;

  Foods(this.foodID, this.foodName, this.foodPictureName, this.foodPrice);

}


//DETAILS PAGE...

class DetailPage extends StatefulWidget {

  Foods food;

  DetailPage({this.food});


  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.foodName),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Image.asset("images/${widget.food.foodPictureName}"),

            Text("${widget.food.foodPrice} \u{20BA} ",style: TextStyle(fontSize: 40, ),),

            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                child: Text("Orders"),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: (){
                  print("${widget.food.foodName} , You Ordered!");
                },

              ),
            ),

          ],
        ),

      ),

    );
  }
}








































































