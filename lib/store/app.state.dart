
import 'package:equatable/equatable.dart';
import 'package:healthy_communities_flutter_app/store/common_data/common_state.dart';

class AppState extends Equatable {
  final CommonDataState commonDataState;
 


  const AppState({required this.commonDataState,});

  // add initialstate
  factory AppState.initial() {
    print("Initializing AppState with initial values");
    return AppState(
      commonDataState: CommonDataState.initial(),
 
    );
  }

  @override
  List<Object?> get props => [
        commonDataState,
       
      ];

  AppState copyWith({CommonDataState? commonDataState, }) {
    return AppState(
      commonDataState: commonDataState ?? this.commonDataState, 
   
      );
  }
  
}