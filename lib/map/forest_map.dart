import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'neme_town_map.dart';

class ForestMap extends StatelessWidget {
  const ForestMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Forest",
        map: [
          "new_map/Forest_Morning.png",
          "new_map/Forest_Day.png",
          "new_map/Forest_Noon.png",
          "new_map/Forest_Night.png",
        ],
        dragPlayer: dragPlayerLists,
        dragTargetArea: forestMapTargetAreaList,
        dragTargetDestination: [NemeTownMap()],
      ),
    );
  }
}
