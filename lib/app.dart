// app.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_feed/core/router/app_router.dart';
import 'package:news_feed/features/home/presentation/cubit/home_cubit.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'core/di/injection_container.dart';
import 'features/onboarding/presentation/cubit/onboarding_cubit.dart';

class NewFeedsApp extends StatelessWidget {
  const NewFeedsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => sl<ThemeCubit>()),
        BlocProvider<OnboardingCubit>(
          create: (context) => sl<OnboardingCubit>(),
        ),
        BlocProvider<HomeCubit>(create: (context) => sl<HomeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                title: 'NewsFeed',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
                routerConfig: AppRouter.router,
              );
            },
          );
        },
      ),
    );
  }
}
