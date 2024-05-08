import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {

  late String _selectedSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedSize = widget.sizes.first;
    widget.onChange(_selectedSize);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
        children: widget.sizes
            .map(
              (c) => InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              _selectedSize = c;
              widget.onChange(c);
              if(mounted){
                setState(() {

                });
              }
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey),
                    color: c == _selectedSize ? AppColors.primaryColor : null
                ),
                child: Text(c,style: TextStyle(
                    color: c == _selectedSize ? Colors.white : Colors.black45
                ),)
            ),
          ),
        )
            .toList());
  }
}