class AppUser{
  final String uid;
  final String email;
  final String name;
  AppUser({
    required this.uid,
    required this.email,
    required this.name,
});
  // converting app user > json
Map<String, dynamic> toJson(){
  return {
    'uid':uid,
    'email':email,
    'name':name,
  };
}
//converting json > appUser
factory AppUser.fromJson(Map<String, dynamic> jsonUser){
  return AppUser(uid: jsonUser['uid'], email: jsonUser['email'], name:jsonUser[ 'name']);
}
}