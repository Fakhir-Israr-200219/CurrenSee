// // import 'package:flutter/material.dart';

// // class ConverterScreen extends StatefulWidget {
// //   const ConverterScreen({super.key});

// //   @override
// //   State<ConverterScreen> createState() => _ConverterScreenState();
// // }

// // class _ConverterScreenState extends State<ConverterScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("converter page"),
// //       ),
// //       body: Container(
// //         child: Column(
// //           children: [
// //             Row(
// //               children: [
// //                 TextField(),
// //                 OutlinedButton(
// //                   onPressed: () {},
// //                   child: Row(
// //                     children: [
// //                       Text("Select the Currency"),
// //                       Icon(Icons.arrow_forward)
// //                     ],
// //                   ),
// //                 )
// //               ],
// //             ),
// //             Row(
// //               children: [
// //                 TextField(),
// //                 OutlinedButton(
// //                   onPressed: () {},
// //                   child: Row(
// //                     children: [
// //                       Text("Select the Currency"),
// //                       Icon(Icons.arrow_forward)
// //                     ],
// //                   ),
// //                 )
// //               ],
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class ConverterScreen extends StatefulWidget {
//   const ConverterScreen({super.key});

//   @override
//   State<ConverterScreen> createState() => _ConverterScreenState();
// }

// class _ConverterScreenState extends State<ConverterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Converter Page"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0), // Add padding for spacing
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: "Enter amount",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10), // Space between TextField and Button
//                 OutlinedButton(
//                   onPressed: () {},
//                   child: Row(
//                     children: [
//                       Text("Select Currency"),
//                       Icon(Icons.arrow_forward),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20), // Space between rows
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: "Converted amount",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 OutlinedButton(
//                   onPressed: () {},
//                   child: Row(
//                     children: [
//                       Text("Select Currency"),
//                       Icon(Icons.arrow_forward),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Converter Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Minimal padding for screen edges
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400.0,
              margin: EdgeInsets.only(
                bottom: 60,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.purple.shade100,
              ),
              child: Center(
                child: Text(
                  "\$ 900",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Align from left to right
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Enter amount",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text("Select Currency"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Space between rows
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Align from left to right
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Converted amount",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text("Select Currency"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
