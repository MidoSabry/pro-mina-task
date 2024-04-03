import 'package:get_it/get_it.dart';
import 'package:task_pro_mina/features/auth/data/datasource/login_user_remote_data_source.dart';
import 'package:task_pro_mina/features/auth/data/repository/user_repository.dart';
import 'package:task_pro_mina/features/auth/domain/repository/base_user_repository.dart';
import 'package:task_pro_mina/features/auth/domain/usecase/get_user_login.dart';
import 'package:task_pro_mina/features/auth/presentation/cubit/login_cubit.dart';
import 'package:task_pro_mina/features/home/data/datasource/gellary_remote_data_source.dart';
import 'package:task_pro_mina/features/home/data/repository/gellary_repository.dart';
import 'package:task_pro_mina/features/home/domain/repository/base_gellary_repository.dart';
import 'package:task_pro_mina/features/home/domain/usecase/get_gellary_usecase.dart';
import 'package:task_pro_mina/features/home/presentation/cubit/gellary_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /////////Login////////////////////////////////
    ///Bloc Login
    sl.registerFactory(() => LoginCubit(sl()));

    ///Login Use Cases
    sl.registerFactory(() => GetUserLogin(sl()));

    ///Login Repository
    sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(sl()));

    ///Login DATA SOURCE
    sl.registerLazySingleton<BaseLoginUserRemoteDataSource>(
        () => LoginUserRemoteDataSource());

    //////////////Gellary (Home)//////////////////
    ///Bloc gellary
    sl.registerFactory(() => GellaryCubit(sl()));

    ///gellary Use Cases
    sl.registerFactory(() => GetGellaryUseCase(sl()));

    ///gellary Repository
    sl.registerLazySingleton<BaseGellaryRepository>(
        () => GellaryRepository(sl()));

    ///Login DATA SOURCE
    sl.registerLazySingleton<BaseGellaryRemoteDataSource>(
        () => GellaryRemoteDataSource());
  }
}
