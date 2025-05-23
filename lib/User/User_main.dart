import 'package:course_connect/Controller/Bloc/Ai_coursefinder_block/coursefinder_block.dart';
import 'package:course_connect/Controller/Bloc/Property/Property/Property_auth_block.dart';
import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../firebase_options.dart';
import '../Controller/Bloc/Applycourse/application_bloc.dart';
import '../Controller/Bloc/Booking/Booking_authblock.dart';
import '../Controller/Bloc/Dropdown_university/dropdown_bloc.dart';
import '../Controller/Bloc/User_Authbloc/auth_bloc.dart';
import '../Controller/Bloc/selection_cubit.dart';
import 'Sreens/Authentication/LoginUser.dart';
import 'Sreens/Authentication/Spashview.dart';
import 'Sreens/BottomNavigation/Bottom_Nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("main() called");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("MyApp build");
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<ApplicationBloc>(
          create: (context) => ApplicationBloc(),
        ),
        BlocProvider<CoursefinderBlock>(
          create: (context) => CoursefinderBlock(),
        ),
        BlocProvider<UniversityBloc>(
          create: (context) => UniversityBloc(),
        ),
        BlocProvider<PropertyAuthBlock>(
          create: (context) => PropertyAuthBlock(),
        ),
        BlocProvider<BookingAuthblock>(
          create: (context) => BookingAuthblock(),
        ),
        BlocProvider(
          create: (context) => SelectionCubit(),
        ),
        BlocProvider<DropdownBloc>(
          create: (context) => DropdownBloc()..add(Fetchcatogorybydropdown()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(backgroundColor: Colors.white)),
        routes: {
          '/': (context) => Splashpagewrapper(),
          '/home': (context) => BottomNavWrapper(),
          '/login': (context) => UserLogin_auth(),
        },
      ),
    );
  }
}
