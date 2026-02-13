import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practise/core/di/injection/injection.dart';
import 'package:practise/features/ocr/presentation/cubit/ocr_cubit.dart';

@RoutePage()
class OcrPage extends StatelessWidget {
  const OcrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt<OcrCubit>(), child: const OcrView());
  }
}

class OcrView extends StatelessWidget {
  const OcrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OCR Scanner'),
        actions: [
          BlocSelector<OcrCubit, OcrState, bool>(
            selector: (state) => state.canRefresh,
            builder: (context, canRefresh) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: canRefresh ? () => context.read<OcrCubit>().reset() : null,
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<OcrCubit, OcrState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          switch (state.status) {
            case OCRStatus.failure:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.status.message ?? 'Process finished'), behavior: SnackBarBehavior.fixed),
              );
              break;
            case OCRStatus.success:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.status.message ?? 'Failed to Scan'), behavior: SnackBarBehavior.floating),
              );
              break;
            default:
              break;
          }
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Show loading indicator only when scanning
                  if (state.status.isScanning) ...[const CircularProgressIndicator(), const SizedBox(height: 24)],

                  // Dynamic Icon using the new Dart Switch Expression
                  Icon(
                    switch (state.status) {
                      OCRStatus.success => Icons.check_circle_rounded,
                      OCRStatus.failure => Icons.error_outline_rounded,
                      _ => Icons.camera_enhance_rounded,
                    },
                    size: 100,
                    color: state.status.isSuccess ? Colors.green : Colors.blueGrey,
                  ),

                  const SizedBox(height: 32),

                  // Display the recognized text if it exists, otherwise show status message
                  if (state.result != null) ...[
                    const Text("Recognized Text:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: SelectableText(state.result!, style: const TextStyle(fontSize: 14, height: 1.5)),
                    ),
                  ] else ...[
                    Text(
                      state.status.message ?? "Ready to Scan",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Select an image from gallery or take a photo to extract text.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: const _ScanActionButtons(),
    );
  }
}

class _ScanActionButtons extends StatelessWidget {
  const _ScanActionButtons();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OcrCubit, OcrState, bool>(
      selector: (state) => state.status.isScanning,
      builder: (context, isScanning) {
        if (isScanning) return const SizedBox.shrink();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
              heroTag: 'gallery',
              label: const Text("Gallery"),
              icon: const Icon(Icons.photo_library),
              onPressed: () => context.read<OcrCubit>().performScan(source: ImageSource.gallery),
            ),
            const SizedBox(height: 16),
            FloatingActionButton.extended(
              heroTag: 'camera',
              label: const Text("Camera"),
              icon: const Icon(Icons.camera_alt),
              onPressed: () => context.read<OcrCubit>().performScan(source: ImageSource.camera),
            ),
          ],
        );
      },
    );
  }
}
