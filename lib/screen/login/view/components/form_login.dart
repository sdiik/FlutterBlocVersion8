part of 'body.dart';

class FormLogin extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const FormLogin({
    Key? key,
    required this.formKey
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.35,
          ),
          SizedBox(height: size.height * 0.03),
          RoundedFormInputField(
            hintText: "Digite seu E-mail",
            icon: Icons.person,
            isPassword: false,
            onValidator: (value) {
              if (value!.isEmpty) {
                return 'email is required';
              }
              return null;
            },
            onChanged: (value) {
              BlocProvider.of<LoginBloc>(context).add(
                LoginUsernameChanged(value),
              );
            },
          ),
          RoundedFormInputField(
            hintText: "Password",
            icon: Icons.key,
            isPassword: true,
            onValidator: (value) {
              if (value!.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            onChanged: (value) {
              BlocProvider.of<LoginBloc>(context)
                  .add(LoginPasswordChanged(value));
            },
          ),
          RoundedButton(
              text: "LOGIN",
              press: () {
                _loginTapped(context);
              }),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAccountCheck(
              login: true,
              press: () {
                _navigateToRegisterPage(context);
              })
        ],
      ),
    );
  }
  void _navigateToRegisterPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return RegisterScreen();
    }));
  }

  void _loginTapped(BuildContext context) {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<LoginBloc>(context).add(LoginSubmitted());
    }
  }

}