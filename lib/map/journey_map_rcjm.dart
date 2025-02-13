import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'journey_map_jgwo.dart';

class JourneyMapRcjm extends StatefulWidget {
  const JourneyMapRcjm({super.key});

  @override
  State<JourneyMapRcjm> createState() => _JourneyMapRcjmState();
}

class _JourneyMapRcjmState extends State<JourneyMapRcjm> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "JourneyMap (RC,JM)",
        dragPlayer: dragPlayerLists,
        dragTargetArea: journeyMapRcjmTargerAreaLists,
        map: [
          "new_map/Journey_Map(RC,JM)_Morning.png",
          "new_map/Journey_Map(RC,JM)_Day.png",
          "new_map/Journey_Map(RC,JM)_Noon.png",
          "new_map/Journey_Map(RC,JM)_Night.png",
        ],
        dragTargetDestination: [
          JourneyMapRcjm(),
          JourneyMapJgwo(),
        ],
      ),
    );
  }
}
