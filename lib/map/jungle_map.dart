import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'remenant_camp_map.dart';

class JungleMap extends StatelessWidget {
  const JungleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Jungle",
        map: [
          "new_map/Jungle_Morning.png",
          "new_map/Jungle_Day.png",
          "new_map/Jungle_Noon.png",
          "new_map/Jungle_Night.png",
        ],
        dragPlayer: dragPlayerLists,
        dragTargetArea: jungleMapTargetAreaList,
        dragTargetDestination: [RemenantCampMap()],
      ),
    );
  }
}
