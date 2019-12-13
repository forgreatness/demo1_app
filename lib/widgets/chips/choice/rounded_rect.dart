import 'package:flutter/material.dart';

class RoundedRectChoiceChip extends StatelessWidget {
  final String choiceLabel;
  final bool isSelected; 
  final int id;
  final ValueChanged<int> onSelectChip;

  RoundedRectChoiceChip(this.choiceLabel, this.isSelected, this.id, this.onSelectChip);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(choiceLabel.toUpperCase()),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.blue,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: Colors.white,
      selectedColor: Colors.blue,
      selected: isSelected,
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        side: BorderSide(
          color: Colors.blue,
          width: 1,
          style: BorderStyle.solid
        )
      ),
      onSelected: (selected) => onSelectChip (
        id
      )     
    );
  }
}