import 'package:calc/models/calc_model.dart';
import 'package:calc/shared/global_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CalcButton extends StatelessWidget {
  final CalcModel model;
  final Function function;

  CalcButton({@required this.model, @required this.function});

  Widget _build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(6),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            onPressed: () => function(model: model),
            child: Center(
                child: getView(context)),
          ),
        ));
  }

  Widget getView(BuildContext context)
  {
    if(model.command == Command.edit)
      {
        return SvgPicture.asset(backspaceImage);
      }
    else
      return FittedBox(
        child: Text(model.value, style: Theme.of(context).primaryTextTheme.headline5),
      );
  }

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }
}
