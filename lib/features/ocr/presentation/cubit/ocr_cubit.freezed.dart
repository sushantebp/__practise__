// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ocr_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OcrState {

 OCRStatus get status; String? get result;
/// Create a copy of OcrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OcrStateCopyWith<OcrState> get copyWith => _$OcrStateCopyWithImpl<OcrState>(this as OcrState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OcrState&&(identical(other.status, status) || other.status == status)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,status,result);

@override
String toString() {
  return 'OcrState(status: $status, result: $result)';
}


}

/// @nodoc
abstract mixin class $OcrStateCopyWith<$Res>  {
  factory $OcrStateCopyWith(OcrState value, $Res Function(OcrState) _then) = _$OcrStateCopyWithImpl;
@useResult
$Res call({
 OCRStatus status, String? result
});




}
/// @nodoc
class _$OcrStateCopyWithImpl<$Res>
    implements $OcrStateCopyWith<$Res> {
  _$OcrStateCopyWithImpl(this._self, this._then);

  final OcrState _self;
  final $Res Function(OcrState) _then;

/// Create a copy of OcrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? result = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OCRStatus,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OcrState].
extension OcrStatePatterns on OcrState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OcrState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OcrState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OcrState value)  $default,){
final _that = this;
switch (_that) {
case _OcrState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OcrState value)?  $default,){
final _that = this;
switch (_that) {
case _OcrState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OCRStatus status,  String? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OcrState() when $default != null:
return $default(_that.status,_that.result);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OCRStatus status,  String? result)  $default,) {final _that = this;
switch (_that) {
case _OcrState():
return $default(_that.status,_that.result);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OCRStatus status,  String? result)?  $default,) {final _that = this;
switch (_that) {
case _OcrState() when $default != null:
return $default(_that.status,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _OcrState extends OcrState {
  const _OcrState({this.status = OCRStatus.initial, this.result}): super._();
  

@override@JsonKey() final  OCRStatus status;
@override final  String? result;

/// Create a copy of OcrState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OcrStateCopyWith<_OcrState> get copyWith => __$OcrStateCopyWithImpl<_OcrState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OcrState&&(identical(other.status, status) || other.status == status)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,status,result);

@override
String toString() {
  return 'OcrState(status: $status, result: $result)';
}


}

/// @nodoc
abstract mixin class _$OcrStateCopyWith<$Res> implements $OcrStateCopyWith<$Res> {
  factory _$OcrStateCopyWith(_OcrState value, $Res Function(_OcrState) _then) = __$OcrStateCopyWithImpl;
@override @useResult
$Res call({
 OCRStatus status, String? result
});




}
/// @nodoc
class __$OcrStateCopyWithImpl<$Res>
    implements _$OcrStateCopyWith<$Res> {
  __$OcrStateCopyWithImpl(this._self, this._then);

  final _OcrState _self;
  final $Res Function(_OcrState) _then;

/// Create a copy of OcrState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? result = freezed,}) {
  return _then(_OcrState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OCRStatus,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
