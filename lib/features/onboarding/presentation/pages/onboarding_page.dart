// features/onboarding/presentation/pages/onboarding_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart'; // 💡 Geri qayıtmaq üçün pop funksiyasına görə əlavə edildi
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../widgets/continue_button.dart';
import '../widgets/interests_grid.dart';

class OnboardingPage extends StatelessWidget {
  final bool isFromSettings; // 💡 Ayarlardan gəlib-gəlmədiyini tutan parametr

  const OnboardingPage({
    super.key, 
    this.isFromSettings = false, // Default olaraq false (ilk açılış onboarding)
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        // 💡 Əgər ayarlardan gəlibsə, sol tərəfdə GERİ Ox işarəsini göstəririk, yoxsa boş qalır
        leading: isFromSettings
            ? IconButton(
                icon: Icon(Icons.arrow_back, color: colors.textPrimary, size: 24.sp),
                onPressed: () => context.pop(),
              )
            : null,
        title: Text(
          AppStrings.appName,
          style: AppTextStyles.headlineMedium.copyWith(color: colors.primary),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Maraqlarını seç',
                style: AppTextStyles.headlineLarge.copyWith(
                  color: colors.textPrimary,
                  fontSize: 28.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                'Sənə uyğun xəbərləri göstərək',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: const InterestsGrid(), // Ehtiyac olarsa bura da parametr ötürülə bilər
                ),
              ),
              // 💡 Düymənin daxilində "Davam et" yoxsa "Yadda saxla" yazılacağını idarə etmək üçün ötürürük
              ContinueButton(isFromSettings: isFromSettings),
            ],
          ),
        ),
      ),
    );
  }
}