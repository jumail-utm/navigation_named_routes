import 'package:flutter/material.dart';
import 'package:navigation_simple/models/assessment.dart';
import 'package:navigation_simple/models/group_member.dart';

import '../constants.dart';

class SummaryScreen extends StatelessWidget {
  final GroupMember _evaluator;
  final List _data;

  SummaryScreen(this._evaluator, this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            const Text(
              'Peer and Self Assessement by',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              _evaluator.fullName,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) => _ListTile(
          index: index,
          assessements: _data,
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _ListTile extends StatefulWidget {
  final int index;
  final List<Assessment> assessements;
  _ListTile({this.index, this.assessements});

  @override
  __ListTileState createState() => __ListTileState();
}

class __ListTileState extends State<_ListTile> {
  void _navigate() async {
    final result = await Navigator.pushNamed(context, detailsRoute,
        arguments: Assessment.copy(widget.assessements[widget.index]));

    if (result != null) {
      setState(() => widget.assessements[widget.index] = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.assessements[widget.index].member.shortName),
      subtitle: Text(widget.assessements[widget.index].member.fullName),
      trailing: CircleAvatar(
        child: Text(
          widget.assessements[widget.index].percent.round().toString(),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: widget.assessements[widget.index].percent < 50
            ? Colors.red
            : Colors.green,
      ),
      onTap: () => _navigate(),
    );
  }
}
