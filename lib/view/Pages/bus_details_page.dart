import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/material.dart';

class BusDetails extends StatefulWidget {
  final String driverName;
  final String drivingLicence;
  final bool isTwoIntoTwo;
  const BusDetails({
    super.key,
    required this.driverName,
    required this.drivingLicence,
    required this.isTwoIntoTwo,
  });

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  Set<SeatNumber> selectedSeats = {};
  final twoIntoTwo = [
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
  ];

  final oneIntoThree = [
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bus Details',
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.driverName,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.drivingLicence,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset(
                        'assets/driver.png',
                        height: 80,
                        width: 100,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: SingleChildScrollView(
                  child: SeatLayoutWidget(
                    onSeatStateChanged: (rowI, colI, seatState) {
                      if (seatState == SeatState.selected) {
                        selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
                      } else {
                        selectedSeats
                            .remove(SeatNumber(rowI: rowI, colI: colI));
                      }
                    },
                    stateModel: SeatLayoutStateModel(
                      rows: 7,
                      cols: 5,
                      seatSvgSize: 50,
                      pathSelectedSeat: 'assets/seat.svg',
                      pathDisabledSeat: 'assets/seat.svg',
                      pathSoldSeat: 'assets/seat.svg',
                      pathUnSelectedSeat: 'assets/seat.svg',
                      currentSeatsState:
                          widget.isTwoIntoTwo ? twoIntoTwo : oneIntoThree,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeatNumber {
  final int rowI;
  final int colI;

  const SeatNumber({required this.rowI, required this.colI});

  @override
  bool operator ==(Object other) {
    return rowI == (other as SeatNumber).rowI && colI == other.colI;
  }

  @override
  int get hashCode => rowI.hashCode;

  @override
  String toString() {
    return '[$rowI][$colI]';
  }
}
