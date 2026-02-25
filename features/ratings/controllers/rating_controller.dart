import 'package:get/get.dart';

class RatingController extends GetxController {
  // Observable list to store ratings
  var ratings = <double>[].obs;

  // Method to add a rating
  void addRating(double rating) {
    ratings.add(rating);
  }

  // Method to update a rating
  void updateRating(int index, double newRating) {
    if (index >= 0 && index < ratings.length) {
      ratings[index] = newRating;
    }
  }

  // Method to delete a rating
  void deleteRating(int index) {
    if (index >= 0 && index < ratings.length) {
      ratings.removeAt(index);
    }
  }

  // Method to calculate average rating
  double get averageRating {
    if (ratings.isEmpty) return 0.0;
    return ratings.reduce((a, b) => a + b) / ratings.length;
  }
}