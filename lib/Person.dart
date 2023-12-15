class Person {
  double weight;
  double height;

  Person({required this.weight, required this.height});

  calculerImc() {
    return weight * 1000 / (height * height);
  }

  getMessage(double imc) {
    switch (imc) {
      case (< 18.6):
        return "Very low weight.";
      case (< 24.9):
        return "Ideal weight.";
      case (< 29.9):
        return "Superweight.";
      case (< 34.9):
        return "Obesity grade A";
      case (< 39.9):
        return "Obesity grade B";
      case (>= 40):
        return "Obesity grade C";
    }
  }
}
