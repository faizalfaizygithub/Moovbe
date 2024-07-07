import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round3/controller/Provider/driver_provider.dart';
import 'package:round3/view/Pages/add_driver_page.dart';
import 'package:round3/view/widgets/custom_Button.dart';
import 'package:round3/view/widgets/custom_DriverList_Tile.dart';

class DriverPage extends StatelessWidget {
  const DriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final driverProvider = Provider.of<DriverProvider>(context);

    return driverProvider.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Driver List'),
            ),
            body: Consumer<DriverProvider>(
              builder: (context, value, child) => ListView.builder(
                itemCount: value.driverList!.length,
                itemBuilder: (context, index) {
                  return DriverTile(driver: value.driverList![index]);
                },
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: CustomButton(
              txt: 'Add Driver',
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddDriverPage();
                }));
              },
              txtColor: Colors.white,
              buttonColor: Colors.red,
            ),
          );
  }
}
