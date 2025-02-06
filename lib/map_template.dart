import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'model/drag.dart';
import 'model/drag_player.dart';
import 'model/map.dart';

class MapTemplate extends StatefulWidget {
  final DndMap dndMapModel;
  const MapTemplate({super.key, required this.dndMapModel});

  @override
  State<MapTemplate> createState() => _MapTemplateState();
}

class _MapTemplateState extends State<MapTemplate> {
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

    if (!isInAnyTarget) {
      usersInTarget.remove(userId);
    }
  }

  void navigatorMap(int dropCount, WidgetBuilder builder) {
    if (dropCount == dragPlayerLists.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: builder,
        ),
      );
    }
  }

  Widget userCount(int dropCount) {
    return dropCount != 0
        ? Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: Text(
                "Player $dropCount / ${dragPlayerLists.length}",
                style: TextStyle(color: Colors.white, fontSize: 29),
              ),
            ),
          )
        : Align(alignment: Alignment.topCenter, child: SizedBox());
  }

  @override
  void initState() {
    dragPlayerLists = widget.dndMapModel.dragPlayer
      ..map((user) {
        return DragPlayer(
          id: user.id,
          name: user.name,
          position: user.defaultPosition,
          imageChar: user.imageChar,
        );
      }).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<int> dropCount = [];
    List<Set<int>> targetUser = [];
    Set<int> usersInAnyTargetSet = {};

    for (int i = 0; i < widget.dndMapModel.dragTargetArea.length; i++) {
      dropCount.add(0);
      targetUser.add({});
    }

    Widget map() {
      return Scaffold(
        body: Stack(
          children: [
            Image.asset(
              widget.dndMapModel.map,
              width: screenSize.width,
              height: screenSize.height,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...dropCount.map((e) {
                    // if (kDebugMode) {
                    //   print(e);
                    // }
                    return userCount(e);
                  }),
                ],
              ),
            ),
            ...widget.dndMapModel.dragTargetArea.map(
              (e) {
                return Positioned(
                  left: e[0],
                  top: e[1],
                  child: DragTargetArea(
                    width: e[2],
                    height: e[3],
                  ),
                );
              },
            ),

            // Draggable users
            ...widget.dndMapModel.dragPlayer.map(
              (user) {
                return DragablePayer(
                  dragPlayer: user,
                  onPositionUpdate: (newPosition) {
                    setState(() {
                      user.position = newPosition;

                      final userRect = Rect.fromLTWH(
                        user.position.dx,
                        user.position.dy,
                        80,
                        80,
                      );

                      List<DragTargetData> dragTargets = [];
                      for (int i = 0;
                          i < widget.dndMapModel.dragTargetArea.length;
                          i++) {
                        dragTargets.add(DragTargetData(
                          targetRect: Rect.fromLTWH(
                            widget.dndMapModel.dragTargetArea[i][0],
                            widget.dndMapModel.dragTargetArea[i][1],
                            widget.dndMapModel.dragTargetArea[i][2],
                            widget.dndMapModel.dragTargetArea[i][3],
                          ),
                          usersInTarget: targetUser[i],
                          updateDropCount: (change) => setState(() {
                            dropCount[i] += change;
                            if (kDebugMode) {
                              print("drop count $i: ${dropCount[i]}");
                            }
                          }),
                        ));
                      }
                      updateDropTargets(
                        draggableRect: userRect,
                        dragTargets: dragTargets,
                        usersInTarget: usersInAnyTargetSet,
                        userId: user.id,
                        updateDropCount: (change) {},
                      );
                    });

                    for (int i = 0;
                        i < widget.dndMapModel.dragTargetArea.length;
                        i++) {
                      navigatorMap(
                          dropCount[i],
                          (context) =>
                              widget.dndMapModel.dragTargetDestination[i]);
                    }
                  },
                );
              },
            ),

            ...widget.dndMapModel.dragNpc.map(
              (npc) {
                return DragableNpc(
                  dragNpc: npc,
                  onPositionUpdate: (newPosition) {
                    setState(() {
                      npc.position = newPosition;
                    });
                  },
                );
              },
            ),
          ],
        ),
      );
    }

    return Scene(widget: map());
  }
}
