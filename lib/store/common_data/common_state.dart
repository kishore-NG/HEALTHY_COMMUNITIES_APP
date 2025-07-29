import 'package:equatable/equatable.dart';

class CommonDataState extends Equatable {
   final String? token;

  const CommonDataState({
    this.token,

  });

  factory CommonDataState.initial() {
    return const CommonDataState(
      token: '',
      // Initialize other fields with default values if necessary

    );
  }

  @override
  List<Object?> get props => [
    token,

      ];

  CommonDataState copyWith({
    String? token,
   
  }) {
    return CommonDataState(
      token: token ?? this.token,
    
    );
  }
}
