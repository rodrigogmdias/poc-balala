import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'editor_page_state.dart';

class EditorPageCubit extends Cubit<EditorPageState> {
  EditorPageCubit() : super(EditorPageInitial());
}
