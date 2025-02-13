import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'ancient_ruin_map.dart';

class AncientRuinBasementMap extends StatelessWidget {
  const AncientRuinBasementMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Ancient Ruin Basement",
        dragPlayer: dragPlayerLists,
        dragTargetArea: ancientRuinBasementMapTargetAreaList,
        map: [
          "new_map/Ancient_Ruin_Basement.png",
          "new_map/Ancient_Ruin_Basement_Light.png",
        ],
        dragTargetDestination: [
          AncientRuinMap(),
        ],
      ),
    );
  }
}
