import 'package:equatable/equatable.dart';
import 'package:test_task/model/trade_model.dart';

class TradeState extends Equatable{

  final bool loading;
  final bool isSuccess;
  final bool isFailed;
  final List<TradeModel> tradeList;
  final String errorMessage;

  const TradeState(
      {required this.loading,
        required this.isSuccess,
        required this.tradeList,
        required this.errorMessage,
        required this.isFailed});

  TradeState copyWith({
    bool? loading,
    bool? isSuccess,
    bool? isFailed,
    List<TradeModel>? tradeList,
    String? errorMessage,
  }) {
    return TradeState(
      loading: loading ?? this.loading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      tradeList: tradeList ?? this.tradeList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [loading, isSuccess, isFailed, errorMessage,tradeList];
}