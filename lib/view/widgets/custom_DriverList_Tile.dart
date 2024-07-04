import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round3/controller/Provider/driver_provider.dart';
import 'package:round3/model/driver_list_model.dart';

class DriverTile extends StatefulWidget {
  final Driver driver;
  const DriverTile({super.key, required this.driver});

  @override
  State<DriverTile> createState() => _DriverTileState();
}

class _DriverTileState extends State<DriverTile> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DriverProvider>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DriverProvider>(
      builder: (context, value, child) => Card(
        surfaceTintColor: Colors.white,
        elevation: 3,
        child: ListTile(
          contentPadding: EdgeInsets.all(15),
          leading: SizedBox(
            height: double.infinity,
            child: Image.asset('assets/driver.png'),
          ),
          title: Text(
            widget.driver.name.toString(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          subtitle: Text(
            widget.driver.licenseNo.toString(),
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          trailing: GestureDetector(
            onTap: () async {},
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(8)),
              child: const Center(
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
