import 'package:flutter/material.dart';

import 'drag_mob.dart';
import 'drag_npc.dart';
import 'drag_player.dart';

class DragTargetArea extends StatelessWidget {
  final double width;
  final double height;

  const DragTargetArea({
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      child: SizedBox(),
    );
  }
}

class DragTargetData {
  final Rect targetRect;
  final Set<int> usersInTarget;
  final Function(int) updateDropCount;

  DragTargetData({
    required this.targetRect,
    required this.usersInTarget,
    required this.updateDropCount,
  });
}

class DragablePayer extends StatelessWidget {
  final DragPlayer dragPlayer;
  final ValueChanged<Offset> onPositionUpdate;

  const DragablePayer({
    required this.dragPlayer,
    required this.onPositionUpdate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: dragPlayer.position.dx,
      top: dragPlayer.position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          onPositionUpdate(dragPlayer.position + details.delta);
        },
        child: SizedBox(
          height: 80,
          child: Column(
            children: [
              Text(
                dragPlayer.name,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(dragPlayer.imageChar, fit: BoxFit.fill),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DragableNpc extends StatelessWidget {
  final DragNpc dragNpc;
  final ValueChanged<Offset> onPositionUpdate;

  const DragableNpc({
    required this.dragNpc,
    required this.onPositionUpdate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: dragNpc.position.dx,
      top: dragNpc.position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          onPositionUpdate(dragNpc.position + details.delta);
        },
        child: SizedBox(
          height: 80,
          child: Column(
            children: [
              Text(
                dragNpc.npcName,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(dragNpc.npcChar, fit: BoxFit.fill),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DragableMob extends StatelessWidget {
  final DragMob dragMob;
  final ValueChanged<Offset> onPositionUpdate;
  final String mobChar;

  const DragableMob({
    required this.dragMob,
    required this.onPositionUpdate,
    required this.mobChar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: dragMob.position.dx,
      top: dragMob.position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          onPositionUpdate(dragMob.position + details.delta);
        },
        child: SizedBox(
          width: 80,
          height: 80,
          child: mobChar.isNotEmpty
              ? Image.asset(mobChar, fit: BoxFit.fill)
              : Text(
                  dragMob.mobName,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
        ),
      ),
    );
  }
}
