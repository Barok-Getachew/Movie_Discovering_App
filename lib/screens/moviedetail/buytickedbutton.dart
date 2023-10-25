import 'package:flutter/material.dart';

class TicketButton extends StatelessWidget {
  final double screenWidth;
  const TicketButton({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.5,
      height: screenWidth * 0.15,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(8),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        child: const Text('Buy Ticket'),
      ),
    );
  }
}
