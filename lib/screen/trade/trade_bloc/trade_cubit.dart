import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/screen/trade/trade_bloc/trade_state.dart';
import 'package:test_task/utils/common.dart';

import '../../../service/api_service.dart';

class TradeBloc extends Cubit<TradeState>{
  ApiService apiService;


  TradeBloc(this.apiService): super(
     const TradeState(
          loading: false,
          isSuccess: false,
          tradeList: [],
          errorMessage: '',
          isFailed: false)){
    tradeData(Common.scaffoldKey.currentContext!);
  }

  tradeData(BuildContext context) async {
    emit(state.copyWith(loading: true));

    apiService.getTrade(context).then((value) {
      emit(state.copyWith(loading: false));
      emit(state.copyWith(tradeList: value));
      emit(state.copyWith(isFailed: false));
    }, onError: (error) {
      emit(state.copyWith(loading: false));
      emit(state.copyWith(isFailed: true));
    });
  }

}
