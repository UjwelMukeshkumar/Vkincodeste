import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vkin/Controller/salescontroller.dart';
import 'package:vkin/Font1.dart';

class SalesPage extends StatelessWidget {
  final SalesController _salesController = Get.put(SalesController());

  SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sales Estimate",
          style: costumstyle(16, Color.fromARGB(255, 0, 0, 0), FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.add, color: Color.fromARGB(255, 42, 96, 245)),
          )
        ],
      ),
      body: Obx(
        () {
          if (_salesController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: const Color(0xFFFBFBFB),
                    filled: true,
                    hintText: "      Search",
                    hintStyle: costumstyle(
                        14, const Color(0xFFA5A5A5), FontWeight.w400),
                    suffixIcon:
                        const Icon(Icons.search, color: Color(0xFFA5A5A5)),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _salesController.salesData.length,
                    itemBuilder: (BuildContext context, int index) {
                      var sale = _salesController.salesData[index];

                      return ListTile(
                        title: const Text("#Invoice No"),
                        subtitle: Text(
                          sale.customerName,
                          style: costumstyle(15, Color.fromARGB(255, 0, 0, 0),
                              FontWeight.w500),
                        ),
                        trailing: Container(
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(sale.status,
                                  style: const TextStyle(fontSize: 12)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text("SAR",
                                      style:
                                          TextStyle(color: Color(0xFFA5A5A5))),
                                  SizedBox(width: 10),
                                  Text(
                                    "${sale.grandTotalRounded}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
