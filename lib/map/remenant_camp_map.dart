import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'journey_map_rcjm.dart';
import 'jungle_map.dart';

class RemenantCampMap extends StatelessWidget {
  const RemenantCampMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Remenant Camp",
        dragPlayer: dragPlayerLists,
        dragTargetArea: remenantCampMapTargetAreaLists,
        map: [
          "new_map/Remenant_Camp_Morning.png",
          "new_map/Remenant_Camp_Day.png",
          "new_map/Remenant_Camp_Noon.png",
          "new_map/Remenant_Camp_Night.png",
        ],
        dragTargetDestination: [
          JungleMap(),
          JourneyMapRcjm(),
        ],
      ),
    );
  }
}
