import 'package:flutter/material.dart';

class DragNpc {
  final String npcName;
  final String npcChar;
  Offset position;

  DragNpc({
    required this.npcName,
    required this.position,
    this.npcChar = "",
  });
}

List<DragNpc> woodCutterDragNpcLists = [
  DragNpc(
    npcChar: "npc/blaan_char.png",
    npcName: "Blaan",
    position: Offset(1597, 327),
  ),
  DragNpc(
    npcChar: "npc/carina_char.png",
    npcName: "Carina",
    position: Offset(1626, 424),
  ),
  DragNpc(
    npcChar: "npc/agilo_char.png",
    npcName: "Agilo",
    position: Offset(1380, 359),
  ),
  DragNpc(
    npcChar: "npc/chengiz_char.png",
    npcName: "Chengiz",
    position: Offset(1042, 253),
  ),
  DragNpc(
    npcChar: "npc/mevis_char.png",
    npcName: "Mevis",
    position: Offset(1286, 344),
  ),
  DragNpc(
    npcChar: "npc/jendrik_char.png",
    npcName: "Jendrik",
    position: Offset(137, 87),
  ),
  DragNpc(
    npcChar: "npc/shopkeeper_char.png",
    npcName: "Shopkeeper",
    position: Offset(634, 365),
  ),
  DragNpc(
    npcChar: "npc/olga_char.png",
    npcName: "olga",
    position: Offset(1831, 121),
  )
];

List<DragNpc> cliffMudDragNpcLists = [
  DragNpc(
    npcChar: "npc/helena_char.png",
    npcName: "Helena",
    position: Offset(948, 310),
  )
];

List<DragNpc> brigDragNpcLists = [
  DragNpc(
    npcChar: "npc/jalina_char.png",
    npcName: "Jalina",
    position: Offset(1442, 363),
  )
];
