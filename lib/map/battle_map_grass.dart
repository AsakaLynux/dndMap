import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/drag.dart';
import '../model/drag_mob.dart';
import '../model/drag_player.dart';

class BattleMapGrass extends StatefulWidget {
  final List<DragPlayer> dragPlayerLists;
  final int mobQuantity;
  final String mobName;
  const BattleMapGrass({
    super.key,
    required this.dragPlayerLists,
    this.mobQuantity = 5,
    this.mobName = "Mob",
  });

  @override
  State<BattleMapGrass> createState() => _BattleMapGrassState();
}

class _BattleMapGrassState extends State<BattleMapGrass> {
  int dropCount1 = 0;

  final Set<int> target1Users = {};

  Set<int> usersInAnyTargetSet = {};

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
    if (dropCount == dragPlayerLists.length) Navigator.pop(context);
  }

  Widget userCount(int dropCount) {
    return dropCount != 0
        ? Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Player $dropCount / ${dragPlayerLists.length}",
              style: TextStyle(color: Colors.white, fontSize: 29),
            ),
          )
        : Align(alignment: Alignment.topCenter, child: SizedBox());
  }

  List<DragMob> dragMobLists = [];

  late List<DragPlayer> dragPlayerLists;
  final FocusNode _focusNode = FocusNode();

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
              "new_map/Battle_Map_Grass_Day.png",
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
          if (event.logicalKey == LogicalKeyboardKey.escape) {
            Navigator.pop(context);
          }
        }
      },
    );
  }
}
