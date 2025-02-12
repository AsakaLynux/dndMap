import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/drag.dart';
import '../model/drag_mob.dart';
import '../model/drag_player.dart';

class BattleMapMud extends StatefulWidget {
  final List<DragPlayer> dragPlayerLists;
  final int mobQuantity;
  final String mobName;
  const BattleMapMud({
    super.key,
    required this.dragPlayerLists,
    this.mobQuantity = 5,
    this.mobName = "Mob",
  });

  @override
  State<BattleMapMud> createState() => _BattleMapMudState();
}

class _BattleMapMudState extends State<BattleMapMud> {
  int dropCount1 = 0;
  final Set<int> target1Users = {};
  Set<int> usersInAnyTargetSet = {};
  List<DragMob> dragMobLists = [];
  late List<DragPlayer> dragPlayerLists;
  final FocusNode _focusNode = FocusNode();
  int currentMapIndex = 0;
  List<String> mapList = [
    "new_map/Battle_Map_Mud_Morning.png",
    "new_map/Battle_Map_Mud_Day.png",
    "new_map/Battle_Map_Mud_Noon.png",
    "new_map/Battle_Map_Mud_Night.png",
  ];

  void updateDropTargets({
    required Rect draggableRect,
    required List<DragTargetData> dragTargets,
    required Set<int> usersInTarget,
    required int userId,
    required Function(int) updateDropCount,
  }) {
    bool isInAnyTarget = false;

    for (var target in dragTargets) {
      if (target.targetRect.overlaps(draggableRect)) {
        isInAnyTarget = true;

        if (!target.usersInTarget.contains(userId)) {
          target.usersInTarget.add(userId); // Add user ID to this target's set
          target.updateDropCount(1); // Increment this target's drop count
        }
      } else if (target.usersInTarget.contains(userId)) {
        target.usersInTarget
            .remove(userId); // Remove user ID from this target's set
        target.updateDropCount(-1); // Decrement this target's drop count
      }
    }

    // Optionally, handle logic if the draggable is not in any target
    if (!isInAnyTarget) {
      usersInTarget.remove(userId); // Remove user ID from all targets' sets
    }
  }

  void navigatorMap(int dropCount) {
    if (dropCount == dragPlayerLists.length) {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    dragPlayerLists = widget.dragPlayerLists.map((user) {
      return DragPlayer(
        id: user.id,
        name: user.name,
        position: user.defaultPosition,
        imageChar: user.imageChar,
      );
    }).toList();
    for (int i = 1; i <= widget.mobQuantity; i++) {
      dragMobLists.add(DragMob(
          mobName: "${widget.mobName} $i", position: Offset(i * 80, 0)));
    }

    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              mapList[currentMapIndex],
              width: screenSize.width,
              height: screenSize.height,
              fit: BoxFit.fill,
            ),

            // Draggable users
            ...dragPlayerLists.map(
              (user) {
                return DragablePayer(
                  dragPlayer: user,
                  onPositionUpdate: (newPosition) {
                    setState(() {
                      user.position = newPosition;
                    });
                  },
                );
              },
            ),
            ...dragMobLists.map(
              (mob) {
                return DragableMob(
                  dragMob: mob,
                  mobChar: "",
                  onPositionUpdate: (newPosition) {
                    setState(() {
                      mob.position = newPosition;
                    });
                  },
                );
              },
            )
          ],
        ),
      ),
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          setState(() {
            if (event.logicalKey == LogicalKeyboardKey.escape) {
              Navigator.pop(context);
            } else if (event.logicalKey == LogicalKeyboardKey.keyA) {
              // Morning
              currentMapIndex = 0;
              if (kDebugMode) {
                print("Morning Pressed: $currentMapIndex");
              }
            } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
              // Day
              currentMapIndex = 1;
              if (kDebugMode) {
                print("Day Pressed: $currentMapIndex");
              }
            } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
              // Noon
              currentMapIndex = 2;
              if (kDebugMode) {
                print("Noon Pressed: $currentMapIndex");
              }
            } else if (event.logicalKey == LogicalKeyboardKey.keyF) {
              // Night
              currentMapIndex = 3;
              if (kDebugMode) {
                print("Night Pressed: $currentMapIndex");
              }
            }
          });
        }
      },
    );
  }
}
