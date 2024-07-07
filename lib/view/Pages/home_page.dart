import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round3/controller/Provider/busList_provider.dart';
import 'package:round3/view/Pages/driver_page.dart';
import 'package:round3/view/widgets/custom_Box.dart';
import 'package:round3/view/widgets/custom_ListTile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final busProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo.png',
          height: 50,
          width: 200,
        ),
        toolbarHeight: 100,
        actions: const [
          Icon(
            Icons.settings_power_sharp,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomBox(
                      ontap: () {},
                      boxColor: Colors.red,
                      headOne: 'Bus',
                      headTwo: 'Manage your Bus',
                      imageURL: 'assets/bus.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomBox(
                      ontap: () async {
                        // await context.read<DriverProvider>().fetchDriverList();

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DriverPage();
                        }));
                      },
                      boxColor: Colors.black87,
                      headOne: 'Driver',
                      headTwo: 'Manage your Driver',
                      imageURL: 'assets/driver.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            busProvider.isLoading
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                        itemCount: busProvider.busList!.length ?? 0,
                        itemBuilder: (context, index) {
                          return CustomTile(
                            busList: busProvider.busList![index],
                          );
                        }))
          ],
        ),
      ),
    );
  }
}
