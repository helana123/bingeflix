import 'package:flutter/material.dart';
import 'package:binge/homepage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


void main() => runApp(MyApp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingeflix',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Account'),
      ),
    body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [Colors.black, Colors.deepPurple],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    ),
    ),
    child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person,
              color: Colors.white,),
            title: Text('Profile',
              style: TextStyle(
                  color: Colors.white
              ),),
            onTap: () {
              // Navigate to the profile page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,
              color: Colors.white,),
            title: Text('Settings',
              style: TextStyle(
                  color: Colors.white
              ),),
            onTap: () {
              // Navigate to the settings page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          // Add more list items for additional options
        ],
      ),
    ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _imageFile;

  Future<void> _getImageFromGallery() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.black, Colors.deepPurple],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    ),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          GestureDetector(
            onTap: _getImageFromGallery,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: _imageFile != null ? FileImage(File(_imageFile!.path)) : null,
              child: _imageFile == null
                  ? Icon(
                Icons.person,
                size: 80,
              )
                  : null,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Name',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'name@gmail.com',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'ph no:+91 2345678901',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
              // Handle edit profile action
            },
          ),
        ],
      ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with existing user information
    _nameController = TextEditingController(text: '');
    _emailController = TextEditingController(text: '');
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose the controllers when the page is disposed
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // Save the changes made to the user profile
    String newName = _nameController.text;
    String newEmail = _emailController.text;
    String newPassword = _passwordController.text;

    // Perform the necessary actions to update the user profile
    // ...

    // Show a confirmation dialog or navigate back to the profile page
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Changes Saved'),
        content: Text('Your profile has been updated.'),
        actions: [
          TextButton(
            onPressed: () {
              // Navigate back to the profile page
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Container(
      decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: [Colors.black, Colors.deepPurple],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    ),
    child: Column(
          children: [
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Name',

                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Email',

                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Phone number',

                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Old Password',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),SizedBox(height: 16.0),
            TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}



class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.black, Colors.deepPurple],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    ),
    child:Column(
            children: [
              ListTile(
                leading: Icon(Icons.lock,
                    color: Colors.white),
                title: Text('Change Password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                  );

                  // Handle change password action
                },
              ),
              ListTile(
                leading: Icon(Icons.logout,
                    color: Colors.white),
                title: Text('Logout',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  // Handle logout action
                  _showLogoutConfirmationDialog(context);
                },

              ),
            ],
          )



      ),
    );
  }
}
void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Logout'),
      content: Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () {
            // Close the dialog and perform logout
            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Logout Successful'),
              ),
            );


          },
          child: Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            // Close the dialog
            Navigator.pop(context);
          },
          child: Text('No'),
        ),
      ],
    ),
  );
}

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    String oldPassword = _oldPasswordController.text;
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // TODO: Implement password change logic

    // Reset the input fields
    _oldPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();

    // Show a success message or navigate to a different page
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Password Changed'),
        content: Text('Your password has been successfully changed.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Old Password',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: _changePassword,
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}

