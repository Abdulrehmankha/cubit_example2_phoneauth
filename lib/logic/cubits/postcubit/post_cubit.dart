import 'package:bloc_cubit_app2/data/repositories/post_repository.dart';
import 'package:bloc_cubit_app2/logic/cubits/postcubit/post_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/post_model.dart';

class PostCubit extends Cubit<PostState>{
  PostCubit() : super(PostLoadingState()){
    fetchPosts();
  }

  PostRepository postRepository = PostRepository();

  void fetchPosts()async{
    try{
      List<PostModel> posts =  await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    }on DioError catch(ex){
      if(ex.type == DioErrorType.connectionError){
        emit(PostErrorState("Please! check your internet Connection"));
      }else{
        emit(PostErrorState(ex.type.toString()));
      }
    }
  }

}