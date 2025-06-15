// lib/user_session.dart
class UserSession {
  static String? userEmail;
  static String? name;
  static String? bloodGroup;
  static String? affiliationCode;
  static String? location;
  static String? organ;
  static String? userAge;
  static String? disease;

  static void setOrgan(String org){
    organ = org;
  }

  static String? getOrgan(){
    return organ;
  }

  static void setAge(String age){
    userAge = age;
  }

  static String? getAge(){
    return userAge;
  }

  static void setDisease(String dis){
    disease = dis;
  }

  static String? getDisease(){
    return disease;
  }

  static void setEmail(String email) {
    userEmail = email;
  }

  static String? getEmail() {
    return userEmail;
  }

  static void setName(String userName) {
    name = userName;
  }

  static String? getName() {
    return name;
  }

  static void setBloodGroup(String bg) {
    bloodGroup = bg;
  }

  static String? getBloodGroup() {
    return bloodGroup;
  }

  static void setAffiliationCode(String code) {
    affiliationCode = code;
  }

  static String? getAffiliationCode() {
    return affiliationCode;
  }

  static void setLocation(String loc) {
    location = loc;
  }

  static String? getLocation() {
    return location;
  }

  static void clear() {
    userEmail = null;
    name = null;
    bloodGroup = null;
    affiliationCode = null;
    location = null;
    organ = null;
    disease = null;
    userAge = null;
  }
}