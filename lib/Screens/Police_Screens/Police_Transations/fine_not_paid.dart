import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/fine_to_summons_service.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Transations/fine_paid_details_service.dart';
import 'package:sidarth_new/Widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class FineNotPaid extends StatelessWidget {
  FineNotPaid({super.key});
  FinePaidDetailsService service = FinePaidDetailsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(35),
          child: FutureBuilder(
              future: service.getFinDetails(psId: "1"),
              builder: (context, val) {
                if (val.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: val.data!.data!.length,
                    itemBuilder: (context, index) {
                      final data = val.data!.data;
                      if (data![index].mode == 'online' ||
                          data[index].mode == null) {
                        return fineNotPaidCard(context,
                            amount: data[index].amount.toString(),
                            fineId: data[index].fineId.toString(),
                            name: data[index].name.toString(),
                            offense: data[index].offenseId.toString(),
                            regNo: data[index].registernumber.toString(),
                            typeOfTransaction: data[index].mode.toString());
                      } else
                        return SizedBox();
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        )));
  }

  Column fineNotPaidCard(
    BuildContext context, {
    required String name,
    required String regNo,
    required String offense,
    required String amount,
    required String typeOfTransaction,
    required String fineId,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        margin: EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 15,
            ),
            MyText2(name1: "Name", width: 69, name2: name),
            MyText2(name1: "Reg No : ", width: 51, name2: regNo),
            MyText2(name1: "Offense :", width: 48, name2: offense),
            MyText2(name1: "Amount : ", width: 45, name2: amount),
            MyText2(
                name1: "Type Of \nTransaction :", width: 22, name2: 'online'),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 80),
              child: Container(
                color: Colors.green,
                child: IconButton(
                    onPressed: () async {
                      var url = Uri.parse("tel:");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    icon: const Icon(Icons.call)),
              ),
            )
          ],
        ),
      ),
      Container(
        color: Colors.blue,
        child: TextButton(
          onPressed: () {
            FineToSummonsModal model = FineToSummonsModal(fineId: fineId);
            FineToSummons service = FineToSummons();
            service.sentFineToSummons(model).then((value) {
              log("success");
              return SnackBar(
                content: const Text('Successfully sent fine as summons'),
                // action: SnackBarAction(
                //   label: 'Undo',
                //   onPressed: () {
                //     // Some code to undo the change.
                //   },
                // ),
              );
            });
          },
          child: const Text(
            "Send As Summons",
            style: TextStyle(color: Colors.white),
          ),
        ),
      )
    ]);
  }
}
