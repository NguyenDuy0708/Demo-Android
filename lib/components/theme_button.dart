import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    Key? key,
    required this.changeThemeMode,
  }) : super(key: key);

  final Function(bool) changeThemeMode;

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return IconButton(
      icon: isLight
          ? const Icon(Icons.dark_mode)
          : const Icon(Icons.light_mode),
      onPressed: () => changeThemeMode(!isLight),
    );
  }
}
