import 'package:academicbuddy/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'branch_year.dart';
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
int newUser = 0;
String name;
String email;
String imageUrl;
String id;
Future<FirebaseUser> signInWithGoogle() async {
  try {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );
    AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);

    name = user.displayName.split(" ")[0];
    email = user.email;
    imageUrl = user.photoUrl;
    id=user.uid;



  }
  catch (e) {
    print(e.message);
  }
}

void signOutGoogle() async {
  await _googleSignIn.signOut();
  flag=0;
  print("User Sign Out");
}
