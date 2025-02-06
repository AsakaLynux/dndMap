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
    position: Offset(1261, 587),
  ),
  DragNpc(
    npcChar: "npc/carina_char.png",
    npcName: "Carina",
    position: Offset(1070, 519),
  ),
  DragNpc(
    npcChar: "npc/agilo_char.png",
    npcName: "Agilo",
    position: Offset(1784, 378),
  ),
  DragNpc(
    npcChar: "npc/chengiz_char.png",
    npcName: "Chengiz",
    position: Offset(1155, 174),
  ),
  DragNpc(
    npcChar: "npc/mevis_char.png",
    npcName: "Mevis",
    position: Offset(1725, 357),
  ),
  DragNpc(
    npcChar: "npc/jendrik_char.png",
    npcName: "Jendrik",
    position: Offset(96, 97),
  ),
  DragNpc(
    npcChar: "npc/shopkeeper_char.png",
    npcName: "Shopkeeper",
    position: Offset(670, 230),
  ),
  DragNpc(
    npcChar: "npc/olga_char.png",
    npcName: "olga",
    position: Offset(1784, 128),
  )
];

List<DragNpc> cliffMudDragNpcLists = [
  DragNpc(
    npcChar: "npc/helena_char.png",
    npcName: "Helena",
    position: Offset(876, 425),
  )
];

List<DragNpc> brigDragNpcLists = [
  DragNpc(
    npcChar: "npc/jalina_char.png",
    npcName: "Jalina",
    position: Offset(1365, 351),
  )
];
