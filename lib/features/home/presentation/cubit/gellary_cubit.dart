import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_pro_mina/features/home/domain/entities/gellary.dart';
import 'package:task_pro_mina/features/home/domain/usecase/get_gellary_usecase.dart';

part 'gellary_state.dart';

class GellaryCubit extends Cubit<GellaryState> {
  final GetGellaryUseCase gellaryUseCase;
  GellaryCubit(this.gellaryUseCase) : super(GellaryInitial());

  Future<void> getGellaryOfUser(String token) async {
    emit(GellaryLoading());

    final result = await gellaryUseCase(GellaryParameters(token));
    result.fold(
        (l) => emit(GellaryError(l.message)), (r) => emit(GellarySuccess(r)));
  }

  //////////////////////////////////////////////////

  XFile? image;

  //get image from gellary
  Future<void> getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    image = pickedImage;
  }

  //get image from camera
  Future<void> getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    image = pickedImage;
  }
}
