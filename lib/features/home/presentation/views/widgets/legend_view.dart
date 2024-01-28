import 'package:flutter/material.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle
          ),
          child: Container(),
        ),
        const SizedBox(width: 10,),
        const Text("Max (°C)"),
        const SizedBox(width: 20,),
        Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle
          ),
        ),
        const SizedBox(width: 10,),
        const Text("Min (°C)"),
      ],
    );
  }
}
