import 'package:flutter/material.dart';

class SearchFormField extends StatelessWidget {
  final hint;
  const SearchFormField({
    Key key,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: this.hint,
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
