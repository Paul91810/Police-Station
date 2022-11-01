import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Transations/fine_paid_details_service.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class FinePaid extends StatelessWidget {
  FinePaid({super.key});
  FinePaidDetailsService service = FinePaidDetailsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(35),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
                future: service.getFinDetails(psId: "1"),
                builder: (context, val) {
                  if (val.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: val.data!.data!.length,
                      itemBuilder: (context, index) {
                        final data = val.data!.data;
                        if (data![index].mode != 'online' &&
                            data[index].mode != null) {
                          return Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(20),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  '${data[index].updatedAt}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                MyText2(
                                    name1: "Name",
                                    width: 98,
                                    name2: data[index].name.toString()),
                                MyText2(
                                    name1: "RC No :",
                                    width: 90,
                                    name2:
                                        data[index].registernumber.toString()),
                                MyText2(
                                    name1: "Offense :",
                                    width: 80,
                                    name2: data[index].offenseId.toString()),
                                MyText2(
                                    name1: "Amount :",
                                    width: 81,
                                    name2: data[index].amount.toString()),
                                MyText2(
                                    name1: "Type Of \nTransaction:",
                                    width: 60,
                                    name2: data[index].mode.toString()),
                                MyText2(
                                    name1: "Phone number",
                                    width: 48,
                                    name2: data[index].phoneNumber.toString())
                              ],
                            ),
                          );
                        } else
                          return SizedBox();
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        )));
  }
}
