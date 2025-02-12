import 'package:flutter/material.dart';

import 'model/drag.dart';
import 'main.dart';
import 'model/drag_player.dart';

class Example extends StatefulWidget {
  final List<DragPlayer> dragPlayerLists;

  const Example({super.key, required this.dragPlayerLists});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int dropCount1 = 0;
  int dropCount2 = 0;
  int dropCount3 = 0;

  final Set<int> target1Users = {};
  final Set<int> target2Users = {};
  final Set<int> target3Users = {};
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
            child: Text(
              "Player $dropCount / ${dragPlayerLists.length}",
              style: TextStyle(color: Colors.white, fontSize: 29),
            ),
          )
        : Align(alignment: Alignment.topCenter, child: SizedBox());
  }

  late List<DragPlayer> dragPlayerLists;

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    Widget map() {
      return Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "map/Example.png",
              width: screenSize.width,
              height: screenSize.height,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  userCount(dropCount1),
                  const SizedBox(width: 10),
                  userCount(dropCount2),
                  const SizedBox(width: 10),
                  userCount(dropCount3),
                ],
              ),
            ),

            Positioned(
              left: 0,
              top: screenSize.height / 2,
              child: DragTargetArea(
                width: 100,
                height: 160,
              ),
            ),

            Positioned(
              left: screenSize.width - 100,
              top: screenSize.height / 2 + 110,
              child: DragTargetArea(
                width: 100,
                height: 140,
              ),
            ),
            Positioned(
              left: screenSize.width / 2,
              top: screenSize.height - 100,
              child: DragTargetArea(
                width: 430,
                height: 100,
              ),
            ),

            // Draggable users
            ...dragPlayerLists.map(
              (user) {
                return DragablePayer(
                  dragPlayer: user,
                  onPositionUpdate: (newPosition) {
                    setState(() {
                      user.position = newPosition;

                      // First Target
                      final target1Rect = Rect.fromLTWH(
                        0,
                        screenSize.height / 2,
                        100,
                        160,
                      );

                      // Second Target
                      final target2Rect = Rect.fromLTWH(
                        screenSize.width - 100,
                        screenSize.height / 2 + 110,
                        100,
                        140,
                      );

                      final target3Rect = Rect.fromLTWH(
                        screenSize.width / 2,
                        screenSize.height - 100,
                        430,
                        100,
                      );

                      final userRect = Rect.fromLTWH(
                        user.position.dx,
                        user.position.dy,
                        50,
                        50,
                      );

                      List<DragTargetData> dragTargets = [
                        DragTargetData(
                          targetRect: target1Rect,
                          usersInTarget: target1Users,
                          updateDropCount: (change) =>
                              setState(() => dropCount1 += change),
                        ),
                        DragTargetData(
                          targetRect: target2Rect,
                          usersInTarget: target2Users,
                          updateDropCount: (change) =>
                              setState(() => dropCount2 += change),
                        ),
                        DragTargetData(
                          targetRect: target3Rect,
                          usersInTarget: target3Users,
                          updateDropCount: (change) =>
                              setState(() => dropCount3 += change),
                        ),
                      ];
                      updateDropTargets(
                        draggableRect: userRect,
                        dragTargets: dragTargets,
                        usersInTarget: usersInAnyTargetSet,
                        userId: user.id,
                        updateDropCount: (change) {},
                      );
                    });

                    // navigatorMap(dropCount3,
                    //     (context) => Map1(dragPlayerLists: dragPlayerLists));

                    // navigatorMap(
                    //     dropCount1,
                    //     (context) =>
                    //         JourneyMud(dragPlayerLists: dragPlayerLists));

                    // navigatorMap(
                    //     dropCount2,
                    //     (context) =>
                    //         BridgeMap(dragPlayerLists: dragPlayerLists));
                  },
                );
              },
            ),
            // ...ExampleDragNpcLists.map(
            //   (npc) {
            //     return DragableNpc(
            //       dragNpc: npc,
            //       onPositionUpdate: (newPosition) {
            //         setState(() {
            //           npc.position = newPosition;
            //         });
            //       },
            //     );
            //   },
            // )
          ],
        ),
      );
    }

    return Scene(widget: map());
  }
}
