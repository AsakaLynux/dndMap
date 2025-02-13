import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'ancient_ruin_basement_map.dart';
import 'journey_map_woav.dart';

class AncientRuinMap extends StatelessWidget {
  const AncientRuinMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Ancient Ruin",
        dragPlayer: dragPlayerLists,
        dragTargetArea: ancientRuinMapTargetAreaLists,
        map: [
          "new_map/Ancient_Ruin_Morning.png",
          "new_map/Ancient_Ruin_Day.png",
          "new_map/Ancient_Ruin_Noon.png",
          "new_map/Ancient_Ruin_Night.png",
        ],
        dragTargetDestination: [
          JourneyMapWoav(),
          AncientRuinBasementMap(),
        ],
      ),
    );
  }
}
