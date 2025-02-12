import 'package:flutter/material.dart';

class DragPlayer {
  final int id;
  final String name;
  final String imageChar;
  Offset position;
  final Offset defaultPosition;

  DragPlayer({
    required this.id,
    required this.name,
    required this.position,
    required this.imageChar,
  }) : defaultPosition = position;

  void resetPosition() {
    position = defaultPosition;
  }
}

List<DragPlayer> dragPlayerLists = [
  DragPlayer(
      id: 1,
      name: "Vito",
      position: Offset(0, 80),
      imageChar: "player/vito_char.png"),
  DragPlayer(
      id: 2,
      name: "Yaru",
      position: Offset(0, 160),
      imageChar: "player/yaru_char.png"),
  // DragPlayer(
  //     id: 3,
  //     name: "Adhi",
  //     position: Offset(0, 240),
  //     imageChar: "player/adhi_char.png"),

  // DragPlayer(
  //     id: 4,
  //     name: "Sendo",
  //     position: Offset(0, 320),
  //     imageChar: "player/sendo_char.png"),
  // DragPlayer(
  //     id: 3,
  //     name: "Arif",
  //     position: Offset(0, 100),
  //     imageChar: "player/rakan_char.png"),
  // DragPlayer(
  //     id: 2,
  //     name: "Rakan",
  //     position: Offset(0, 150),
  //     imageChar: "player/arif_char.png"),
  // DragPlayer(id: 5, name: "Rajan", position: Offset(0, 250)),
  // DragPlayer(id: 6, name: "Arul", position: Offset(0, 300)),
  // DragPlayer(id: 7, name: "Sendo", position: Offset(0, 350)),
];
