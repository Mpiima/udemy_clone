import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Model/categoryModel.dart';
import 'package:udemy_clone/Screens/DetailSection/categoryDetail.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text('Browse categories',
              style: TextStyle(color: Colors.white, fontSize: 22.0)),
        ),
        ListView.builder(
            itemCount: categoriesList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, i) {
              return InkWell(
                radius: 0.4,
                onTap: () {
                  Get.to(CategoryDetail(), arguments: categoriesList[i].name);
                },
                child: Container(
                  child: ListTile(
                      leading: categoriesList[i].iconName,
                      title: Text(categoriesList[i].name,
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16))),
                ),
              );
            })
      ],
    );
  }
}
