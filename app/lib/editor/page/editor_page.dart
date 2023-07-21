import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whizapp/editor/components/props_bar/props_bar.dart';
import 'package:whizapp/editor/cubit/editor_page_cubit.dart';

import '../components/logo/logo.dart';
import '../components/preview_screen/preview_screen.dart';
import '../components/side_bar/side_bar.dart';
import '../components/top_bar/top_bar.dart';
import '../components/widgets_list/widgets_list.dart';

class EditorPage extends StatelessWidget {
  EditorPage({super.key});

  final cubit = EditorPageCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 20,
              left: 64,
              right: 0,
              bottom: 0,
              child: PreviewScreen(),
            ),
            const Positioned(
              top: 0,
              left: 0,
              width: 64,
              height: 48,
              child: Logo(),
            ),
            const Positioned(
              top: 0,
              left: 64,
              right: 0,
              height: 48,
              child: TopBar(),
            ),
            const Positioned(
              top: 48,
              right: 0,
              bottom: 0,
              child: PropsBar(),
            ),
            Positioned(
              top: 48,
              left: 64,
              bottom: 0,
              width: 300,
              child: WidgetsList(),
            ),
            Positioned(
              top: 48,
              left: 0,
              bottom: 0,
              width: 64,
              child: SideBar(),
            ),
          ],
        ),
      ),
    );
  }
}
