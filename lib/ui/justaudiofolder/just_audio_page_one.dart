// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:just_audio/just_audio.dart';

// class JustAudioPageOne extends StatefulWidget {
//   const JustAudioPageOne({super.key});

//   @override
//   State<JustAudioPageOne> createState() => _JustAudioPageOneState();
// }

// class _JustAudioPageOneState extends State<JustAudioPageOne> {
//   final player = AudioPlayer();
//   Duration position = Duration.zero;
//   Duration duration = Duration.zero;

//   String formatDuration(Duration d) {
//     final minutes = d.inMinutes.remainder(60);
//     final seconds = d.inSeconds.remainder(60);
//     return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
//   }
  
//   void handlePlayPause() async {
//     if (player.playing) {
//       player.pause();
//     } else {
//       player.play();
//     }
//   }

//   void handleSeek(double value) {
//     player.seek(Duration(seconds: value.toInt()));
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     player.setUrl('https://download.samplelib.com/mp3/sample-15s.mp3');

//     //listen to position updates
//     player.positionStream.listen((p) {
//       print("p $p"); //p 0:00:00.000000
//       setState(() {
//         position = p;
//       });
//     });

//     player.durationStream.listen((d) {
//       setState(() {
//         duration = d!;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("just audio"),
//       ),
//       body: Column(
//         children: [
//           Container(
//             child: Text(formatDuration(position)),
//           ),
//           Slider(
//               value: position.inSeconds.toDouble(),
//               onChanged: handleSeek,
//               min: 0.0,
//               max: duration.inSeconds.toDouble()),
//           Text(formatDuration(duration)),
//           IconButton(
//               onPressed: handlePlayPause,
//               icon: Icon(player.playing ? Icons.pause : Icons.play_arrow))
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class JustAudioPageOne extends StatefulWidget {
  const JustAudioPageOne({super.key});

  @override
  State<JustAudioPageOne> createState() => _JustAudioPageOneState();
}

class _JustAudioPageOneState extends State<JustAudioPageOne> {
  final player = AudioPlayer();

  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    initAudio();
  }

  Future<void> initAudio() async {
    await player.setUrl('https://download.samplelib.com/mp3/sample-15s.mp3');

    player.positionStream.listen((p) {
      setState(() => position = p);
    });

    player.durationStream.listen((d) {
      if (d != null) {
        setState(() => duration = d);
      }
    });
  }

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void handlePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
    setState(() {});
  }

  void handleSeek(double value) {
    player.seek(Duration(seconds: value.toInt()));
//     So instead of playing continuously,
// you are searching and moving to a chosen timestamp.
  }

  @override
  void dispose() {
    player.dispose(); // IMPORTANT (avoid memory leak)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WhatsApp Audio UI")),
      body: Align(
        alignment: Alignment.centerRight, // like sent message
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            width: 260,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffDCF8C6), // WhatsApp green bubble
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                // ▶️ Play Button
                GestureDetector(
                  onTap: handlePlayPause,
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff128C7E),
                    ),
                    child: Icon(
                      player.playing ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // 📊 Progress + Time
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                          trackHeight: 2,
                        ),
                        child: Slider(
                          value: position.inSeconds.toDouble().clamp(
                                0,
                                duration.inSeconds.toDouble() == 0
                                    ? 1
                                    : duration.inSeconds.toDouble(),
                              ),
                          onChanged: handleSeek,
                          min: 0,
                          max: duration.inSeconds.toDouble() == 0
                              ? 1
                              : duration.inSeconds.toDouble(),
                          activeColor: const Color(0xff075E54),
                          inactiveColor: Colors.grey.shade400,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                                                                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          formatDuration(position),
                          style: const TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),

                      // ⏱ Duration Text
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          formatDuration(duration),
                          style: const TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      )
                        ],
                      )

                      //                       Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Text(
                      //     formatDuration(position),
                      //     style: const TextStyle(fontSize: 12, color: Colors.black54),
                      //   ),
                      // ),

                      // // ⏱ Duration Text
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Text(
                      //     formatDuration(duration),
                      //     style: const TextStyle(fontSize: 12, color: Colors.black54),
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

