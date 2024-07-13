
import 'package:convenient_thought/bloc/BlocEvent.dart';
import 'package:convenient_thought/bloc/BlocState.dart';
import 'package:convenient_thought/bloc/TransactionBloc.dart';
import 'package:convenient_thought/utils/Utils.dart';
import 'package:convenient_thought/utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {

  TransactionBloc transactionBloc = TransactionBloc();

  @override
  void initState() {
    super.initState();
    transactionBloc.add(GetImages( path: "/Images?pageSize=52&where=type%3D'Books'"));
  }

  Widget data() {
    return BlocProvider(
      create: (_) => transactionBloc,
      child: BlocListener<TransactionBloc, BlocState>(
        listener: (context, state) {
          if (state is Error) {
            showToast(state.message!);
          }
        },
        child: BlocBuilder<TransactionBloc, BlocState>(
          builder: (context, state) {
            if (state is Initial) {
              return buildLoading();
            } else if (state is Loading) {
              return Container(child: buildLoading());
            } else if (state is Loaded) {
              return  gridViewImages(state.itemValue);
            } else if (state is Error) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return data();
  }
}
