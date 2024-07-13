import 'package:bloc/bloc.dart';
import 'package:convenient_thought/Images.dart';

import 'ApiRepository.dart';
import 'BlocEvent.dart';
import 'BlocState.dart';
import 'ServerError.dart';

class TransactionBloc extends Bloc<BlocEvent, BlocState> {
  TransactionBloc() : super(Initial()) {
    final ApiRepository apiRepository = ApiRepository();
    //
    // on<GetLogin>((event, emit) async {
    //   try {
    //     emit(Loading());
    //     final mList =
    //         await apiRepository.fetchLogin(event.code, event.password);
    //
    //     if (mList.data == null) {
    //       ServerError error = mList.getException;
    //       emit(Error(error.getErrorMessage()));
    //     } else {
    //       emit(Loaded(mList.data!));
    //     }
    //   } on NetworkError {
    //     emit(const Error("Failed to fetch data. is your device online?"));
    //   }
    // });

    on<GetImages>((event, emit) async {
      try {
        emit(Loading());
        final mList = await apiRepository.fetchSalesReport(event.path);

        if (mList.data == null) {
          ServerError error = mList.getException;
          emit(Error(error.getErrorMessage()));
        } else {
          List<Images> data=mList.data!;
          emit(Loaded(itemValue: data));
        }
      } on NetworkError {
        emit(const Error("Failed to fetch data. is your device online?"));
      }
    });
    //
    // on<GetItemList>((event, emit) async {
    //   try {
    //     emit(Loading());
    //     final mList = await apiRepository.fetchItemList(event.query);
    //
    //     if (mList.data == null) {
    //       ServerError error = mList.getException;
    //       emit(Error(error.getErrorMessage()));
    //     } else {
    //       var pdList = mList.data!.getretailitemszipEasyChemResult;
    //
    //       var decoded = base64.decode(pdList.itemData);
    //       var inflated = zlib.decode(decoded);
    //
    //       var data = utf8.decode(inflated);
    //
    //       List<ItemValue> list1 = ItemValueFromJson(data);
    //       emit(Loaded(list1));
    //     }
    //   } on NetworkError {
    //     emit(const Error("Failed to fetch data. is your device online?"));
    //   }
    // });
  }
}
