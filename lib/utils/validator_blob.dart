// import 'package:dio/dio.dart';
// import 'package:pharmygr/core/presentation/utils/validator.dart';
// import 'package:rxdart/rxdart.dart';

// abstract class PharmyFormBloc {
//   final Validator validator;

//   final BehaviorSubject<FormResponse?> requestController = BehaviorSubject();

//   PharmyFormBloc(this.validator);

//   Stream<FormResponse?> get requestResultStream => requestController.stream;

//   Future<void> onSubmitForm() async {
//     try {
//       requestController.add(FormResponse.loading());
//       await submit();
//       requestController.add(FormResponse.successful());
//     } on DioError catch (e) {
//       requestController.add(
//         FormResponse.error(
//           // ignore: avoid_dynamic_calls
//           e.response?.data['message'] as String?,
//         ),
//       );
//     } catch (e) {
//       requestController.add(FormResponse.error(null));
//     }
//   }

//   void resetState() {
//     requestController.add(null);
//   }

//   Future<void> submit();
// }

// enum FormRequestState {
//   loading,
//   successful,
//   error,
// }

// class FormResponse {
//   final FormRequestState state;
//   final String? errorMessage;

//   FormResponse.loading()
//       : state = FormRequestState.loading,
//         errorMessage = '';

//   FormResponse.successful()
//       : state = FormRequestState.successful,
//         errorMessage = null;

//   FormResponse.error(this.errorMessage) : state = FormRequestState.error;
// }
