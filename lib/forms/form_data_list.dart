
import 'package:flutter/material.dart';
import 'package:sqflite_sample/forms/form_data_details.dart';
import 'package:sqflite_sample/sqflite/sqf_helpers.dart';
import 'package:sqflite_sample/sqflite/sqf_models.dart';

class FormDataList extends StatefulWidget {
  const FormDataList({super.key});
  static const routeName = '/NoteList';  

  @override
  State<FormDataList> createState() => _FormDataListState();
}

class _FormDataListState extends State<FormDataList> {

  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;
  late final TextTheme _textTheme = _theme.textTheme;

  Widget noteCard(NoteModel? note){
    return InkWell(
      onTap:()async{
        await Navigator.pushNamed(context, FormDetailData.routeName,arguments: note);
        setState(() {});
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note?.title??"",
                style :_textTheme.bodyLarge!.copyWith(color: _colors.onSurface)
              ),
              Text(
                note?.description??"",
                style :_textTheme.bodyMedium!.copyWith(color: _colors.onSurfaceVariant)
              )
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-----------------------------appbar
      appBar: AppBar(
        title: const Text('NoteList'),
      ),

      //-----------------------------NoteList
      body: FutureBuilder<List<NoteModel>>(
        future: DatabaseHelper().getAllNoteData(), 
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return noteCard(snapshot.data[index]);
              },
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),


      //----------------------------floatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          final result = await Navigator.pushNamed(
            context,
            FormDetailData.routeName
          );
          if(result!=null){
            //widget rebuild for getNoteList again
            setState(() {});
          }

          
        },
        tooltip: "Add Note",
        child: const Icon(Icons.add),
      ),
    );
  }
}