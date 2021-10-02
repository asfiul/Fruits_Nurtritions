import 'package:flutter/material.dart';
import 'package:fruits_nurtrition/services/apiservices.dart';
import 'package:fruits_nurtrition/services/model.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text("Fruits Nutrition"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ApiServices().getAllfruits(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    FruitsData fruitsData = snapshot.data[index];
                    return Card(
                      color: Colors.black54,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: ListTile(
                        title: Center(
                          child: Text(
                            fruitsData.name,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.pink,
                            ),
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                                "Carbohydrates: ${fruitsData.nutritions.carbohydrates}"),
                            Text("Protein: ${fruitsData.nutritions.protein}"),
                            Text("Fat: ${fruitsData.nutritions.fat}"),
                            Text(" Calories: ${fruitsData.nutritions.calories}")
                          ],
                        ),
                      ),
                    );
                  });
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
