import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:atomberg_fan_controller/presentation/screens/device_list_screen.dart';
import 'package:atomberg_fan_controller/presentation/providers/device_provider.dart';
import 'package:atomberg_fan_controller/domain/entities/device_entity.dart';

void main() {
  testWidgets('should display empty state when no devices', (tester) async {
    // Arrange
    final provider = DeviceProvider(
      fetchDevicesUseCase: MockFetchDevicesUseCase(),
      fetchDeviceUseCase: MockFetchDeviceUseCase(),
      controlDeviceUseCase: MockControlDeviceUseCase(),
    );
    
    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: provider,
          child: const DeviceListScreen(),
        ),
      ),
    );
    
    await tester.pump();
    
    // Assert
    expect(find.text('No Devices Found'), findsOneWidget);
  });
}