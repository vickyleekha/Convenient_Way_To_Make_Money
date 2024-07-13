
import 'package:convenient_thought/bloc/BlocEvent.dart';
import 'package:convenient_thought/bloc/BlocState.dart';
import 'package:convenient_thought/bloc/TransactionBloc.dart';
import 'package:convenient_thought/utils/ShareService.dart';
import 'package:convenient_thought/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:convenient_thought/utils/custom_widget.dart';

class ValueLessons extends StatefulWidget {
  const ValueLessons({Key? key}) : super(key: key);

  @override
  State<ValueLessons> createState() => _ValueLessonsState();
}

class _ValueLessonsState extends State<ValueLessons> {

  TransactionBloc transactionBloc = TransactionBloc();

  @override
  void initState() {
    super.initState();
    transactionBloc.add(GetImages( path: "/ValueLessons?pageSize=84&sortBy=%60group_no%60%20desc"));
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
              return
                gridViewImages(state.itemValue);
              //   PageView.builder(
              //   // controller: controller,
              //   // pageSnapping: false,
              //   itemBuilder: (context, index) {
              //     // if(position!=0){
              //     //   _scrollToIndex(position);
              //     // }
              //     //
              //     // position=0;
              //
              //     return
              //       Container(
              //
              //       decoration: BoxDecoration(
              //
              //         image: DecorationImage(
              //
              //             fit: BoxFit.scaleDown,
              //
              //             image:NetworkImage(state.itemValue[index].images)),),
              //
              //       child: Align(
              //
              //         alignment:
              //
              //         FractionalOffset.bottomRight,
              //
              //         child: Container(
              //
              //           padding: const EdgeInsets.only(
              //
              //             left: 8.0,
              //
              //             right: 8.0,
              //
              //           ),
              //
              //           alignment: Alignment.centerRight,
              //
              //           height: 50.0,
              //
              //           decoration: BoxDecoration(
              //
              //             // borderRadius: const BorderRadius.only(
              //
              //             // bottomLeft: Radius.circular(20.0),
              //
              //             // bottomRight: Radius.circular(20.0),
              //
              //             // ),
              //
              //             color: Colors.grey.withOpacity(0.5),
              //
              //           ),
              //
              //           child: IconButton(
              //
              //             icon:const Icon(Icons.share,color: Colors.white,size: 36,),
              //
              //             onPressed: () async {
              //
              //
              //               await onShare(state.itemValue[index].images);
              //             },
              //
              //           ),
              //
              //         ),
              //
              //       ),
              //
              //     );
              //
              //   },
              //   itemCount:state.itemValue.length, // Can be null
              // );
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
