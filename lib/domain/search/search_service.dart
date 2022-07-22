import 'package:dartz/dartz.dart';

import '../core/failures/main_failure.dart';
import 'model/search_response/search_response.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResponse>> searchMovies({
    required String movieQuery,
  });
}
