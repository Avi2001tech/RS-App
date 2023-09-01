import 'package:e_sale_app/consts/consts.dart';

class FirestoreServices {
  static getUser(uid) {
    //get user data
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
