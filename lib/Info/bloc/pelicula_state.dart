abstract class MovieState{}

class MovieLoading extends MovieState {
  MovieLoading();
}

class MovieFailed extends MovieState {
  MovieFailed();
}


class MovieNew extends MovieState {
  String data;
  MovieNew({required this.data});

  @override
  List<Object> get props => [data];
}
