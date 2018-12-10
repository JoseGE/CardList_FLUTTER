import 'package:flutter/material.dart';

class CardModel {
  List<CardResults> results; 
  CardModel({this.results});
  CardModel.fromJson(Map<String, dynamic> json) {
    if(json['cardResults']!= null ) {
      results = new List<CardResults>();
      json['cardResults'].forEach((v){
        results.add(new CardResults.fromJson(v));
      });
    }
  }
}

class CardResults {
  String cardHolderName;
  String cardNumber;
  String cardMonth;
  String cardYear;
  String cardCvv;
  Color cardColor;
  String cardType;

  CardResults({this.cardColor,this.cardCvv,this.cardHolderName,this.cardMonth,this.cardNumber,this.cardType,this.cardYear});

  CardResults.fromJson(Map<String, dynamic> json) {
    cardHolderName  = json['cardHolderName'];
    cardNumber      = json['cardNumber'];
    cardColor       = json['cardColor'];
    cardMonth       = json['cardMonth'];
    cardYear        = json['cardYear'];
    cardType        = json['cardType'];
    cardCvv         = json['cardCvv'];
  }
}

