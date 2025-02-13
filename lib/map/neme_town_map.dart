import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'bridge_map.dart';
import 'forest_map.dart';

class NemeTownMap extends StatelessWidget {
  const NemeTownMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "NemeTown",
        dragPlayer: dragPlayerLists,
        dragTargetArea: nemeTownMapTargetAreaLists,
        map: [
          "new_map/NemeTown_Morning.png",
          "new_map/NemeTown_Day.png",
          "new_map/NemeTown_Noon.png",
          "new_map/NemeTown_Night.png",
        ],
        dragTargetDestination: [
          BridgeMap(),
          ForestMap(),
        ],
      ),
    );
  }
}
