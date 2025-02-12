import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'journey_mud.dart';

class JourneyGrass extends StatefulWidget {
  const JourneyGrass({super.key});

  @override
  State<JourneyGrass> createState() => _JourneyGrassState();
}

class _JourneyGrassState extends State<JourneyGrass> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Journey Grass Map",
        dragPlayer: dragPlayerLists,
        dragTargetArea: journeyGrassTargerAreaLists,
        map: "map/journey_grass.png",
        dragTargetDestination: [
          JourneyGrass(),
          JourneyMud(),
        ],
      ),
    );
  }
}
