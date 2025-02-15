import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'map/battle_map_grass.dart';
import 'map/battle_map_mud.dart';
import 'map/wood_cutter_map.dart';
import 'model/drag_player.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WoodCutterMap(),
    ),
  );
}

class Scene extends StatefulWidget {
  final Widget widget;
  const Scene({super.key, required this.widget});

  @override
  State<Scene> createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
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
    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      child: widget.widget,
      onKeyEvent: (event) async {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.keyW) {
            final result = await showDialog<List<dynamic>>(
              context: context,
              builder: (context) => const NumberInputDialog(),
            );
            if (result != null && context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BattleMapGrass(
                    dragPlayerLists: dragPlayerLists,
                    mobQuantity: result[1],
                    mobName: result[0],
                  ),
                ),
              );
            }
          }
          if (event.logicalKey == LogicalKeyboardKey.keyQ) {
            final result = await showDialog<List<dynamic>>(
              context: context,
              builder: (context) => const NumberInputDialog(),
            );
            if (result != null && context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BattleMapMud(
                    dragPlayerLists: dragPlayerLists,
                    mobQuantity: result[1],
                    mobName: result[0],
                  ),
                ),
              );
            }
          }
        }
      },
    );
  }
}

class NumberInputDialog extends StatefulWidget {
  const NumberInputDialog({super.key});

  @override
  State<NumberInputDialog> createState() => _NumberInputDialogState();
}

class _NumberInputDialogState extends State<NumberInputDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter a Number'),
      content: SizedBox(
        width: 200,
        height: 150,
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Enter mob name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a mob name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter a number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
              ],
            )),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(
                context); // Close the dialog without returning a value
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pop(
                context,
                [
                  _nameController.text, // Return the mob name
                  int.parse(_numberController.text), // Return the mob quantity
                ],
              ); // Return the number
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
