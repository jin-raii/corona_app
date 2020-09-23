import 'package:equatable/equatable.dart';

abstract class Event extends Equatable{}

class SummaryEvent extends Event{
  @override
  List<Object> get props => [];
}