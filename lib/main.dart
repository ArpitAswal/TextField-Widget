import 'package:flutter/material.dart';

//A TextField or TextBox is an input element which holds the alphanumeric data, such as name, password, address, etc. It is a GUI control element that enables the user to enter text information using a programmable code. It can be of a single-line text field (when only one line of information is required) or multiple-line text field (when more than one line of information is required).
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TextScreen(),
    );
  }
}

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  final TextEditingController textE1 = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final UndoHistoryController textU1 = UndoHistoryController();
  final FocusNode textF1 = FocusNode();
  final FocusNode fN1 = FocusNode();
  final FocusNode fN2 = FocusNode();
  final FocusNode fN3 = FocusNode();

  String input = '';
  final ScrollController sc = ScrollController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    textE1.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    textE1.dispose();
    textF1.dispose();
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    fN1.dispose();
    fN2.dispose();
    fN3.dispose();
    textU1.dispose();
    super.dispose();
  }

  TextStyle? get enabledStyle => Theme.of(context).textTheme.bodyMedium;
  TextStyle? get disabledStyle =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey);
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Types of Border TextFields
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'All Border as InputBorder',
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'All Border as OutlineInputBorder',
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      focusedErrorBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder()),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'All Border as UnderlineInputBorder',
                      border: UnderlineInputBorder(),
                      errorBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                      focusedErrorBorder: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(),
                      disabledBorder: UnderlineInputBorder()),
                ),
              ),
            ),
          ],
        ),
        //TextField without decoration and only with decoration
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: TextField(
                  //Here we discussed the common and necessary requirements attributes of TextField
                  decoration: const InputDecoration(
                      hintText:
                          'TextField with its attributes without decoration'),
                  undoController: textU1,
                  controller: textE1,
                  focusNode: textF1,
                  keyboardType: TextInputType
                      .name, //emailAddress,none,number,url,password,streetAddress etc
                  textInputAction: TextInputAction
                      .done, //whenever this textField action done it can perform the various options
                  textCapitalization: TextCapitalization
                      .words, //first action perform in this field. it will get first character as Capital or we can also get word,sentences etc.
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                      wordSpacing: 0.5,
                      letterSpacing: 1.2),
                  textAlign: TextAlign
                      .start, // it align the text that at which position text will start. It can be start,center and end
                  textAlignVertical: TextAlignVertical
                      .center, // it align the text at given position in given text field size. It can be top,center,bottom
                  textDirection: TextDirection
                      .ltr, // ift is rtl, it will starting texting from right or end side to the left or start side
                  readOnly:
                      false, //If it is true then we can only read or seen this field we can't perform any thing on this
                  showCursor:
                      true, //it will show the cursor to text something on the the text field
                  autofocus:
                      true, // it will focus on the text field. If true, the keyboard will open as soon as this text field obtain focus
                  //If we have more than one textFiled then we separately define focusNode then define which one focus should work- FocusScope.of(context).requestFocus(textF1);
                  obscureText:
                      false, // this property is used when we want our text is not shown(true) like password
                  obscuringCharacter:
                      '*', // by default obscure character is '.' but we can define something else
                  autocorrect:
                      true, // it will give you option to correct your context if given text spell wrong
                  enabled:
                      true, //if false the text-field will be disabled. It will ignored taps on field and decoration is rendered in grey
                  enableSuggestions:
                      true, //whether to show the input suggestions as the user types
                  maxLines:
                      1, //we need a TextField that expands when one line is finished. In Flutter it is slightly odd (yet easy) to do. To do this, we set maxLines to null, which is 1 by default. or we can specific line describe
                  maxLength:
                      null, //TextField widget also allows us to restrict the maximum number of characters inside the text field. We can do this by adding the maxLength attributes
                  scrollController: sc,
                  scrollPhysics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  // By above two attributes we applied scrolling in our textFiled in horizontal direction by Default. because textField has 1 maxLine, iF we declare more than 1 then it scroll in vertical direction
                  cursorColor: Colors.green, //cursor color
                  cursorWidth: 2.5, //cursor width
                  cursorHeight: 32, //cursor height
                  cursorRadius:
                      const Radius.circular(21), //cursor corner rounder
                  cursorOpacityAnimates:
                      true, //whether the cursor will animate from fully transparent to fully opaque during each cursor blink
                  //mouseCursor: MouseCursor.defer,
                  clipBehavior: Clip.hardEdge, //The content will be clipped
                  autofillHints: const [
                    //It provide an autofill list. AutofillHints is a list of strings that help the autofill service identify the type of this text input.
                    AutofillHints.name,
                    AutofillHints.username,
                    "ArpitAswal"
                  ],
                  canRequestFocus:
                      true, //if it is false the textFiled will not request focus when tapped.
                  //There are two ways to retrieve the textFiled input which user type
                  /*1.
                       onChanged: (value){//It is the easiest way to retrieve the text field value. This method store the current value in a simple variable and then use it in the TextField widget
                      input=value;
                    },*/
                  /*2. It is a popular method to retrieve text field value using TextEditingController. It will be attached to the TextField widget and then listen to change and control the widget's text value.
                       we already assigned controller on textField now when we pressed the button we can send this value somewhere else or we can store and even we can print the value
                       onPressed:((){
                       debugPrint(textE1.text.toString()); It will print the input of textFiled
                       });
                       or we can als set the value
                       textE1.text="  ";
                       */
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    //Basic decoration which works by gestures and some pre-define
                    icon: Icon(Icons.email),
                    iconColor: Colors.purple,
                    labelText:
                        'TextField only with Decoration', //label:  Text('E-mail'),  //Either label or labelText exist but difference is label receive widget while labelText is receive Text
                    labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue),
                    floatingLabelStyle: TextStyle(
                        color: Colors
                            .red), // this style is work when the label moves up
                    floatingLabelAlignment: FloatingLabelAlignment
                        .start, //It align the floating label at center or star
                    floatingLabelBehavior: FloatingLabelBehavior
                        .auto, // if it is never then label text not floating, and if it is always then it always floating above and if it is auto then it floats when we tap on field
                    helperText:
                        'xxxxx@gmail.com', //the text that provides the context about decoration.child value, such as how value will be used
                    helperStyle: TextStyle(color: Colors.green),
                    //helperMaxLines: 1,
                    hintText: 'Enter your e-mail Id',
                    hintStyle: TextStyle(color: Colors.blue),
                    hintMaxLines: 1,
                    hintTextDirection: TextDirection.ltr,
                    //errorText: 'error',//if it is non-null then helper text is not shown
                    //errorStyle: TextStyle(color: Colors.black),
                    //errorMaxLines: 1,
                    isCollapsed:
                        false, //if it is true, it collapsed the label text and hint text
                    isDense:
                        true, //whether the InputDecorator.child is part of a dense form(i.e, uses less vertical spaces). Default value is false
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    //prefix: Icon(Icons.add_call),// it is the first widget in textField
                    //prefixIcon: Icon(Icons.add_alert),//this icon is shown first then label text and hint text
                    //prefixIconColor: Colors.tealAccent,
                    //prefixText: '@',// it is the first text of textField
                    //prefixStyle: TextStyle(color:Colors.pink),
                    // all the above prefix operation is also for suffix
                    counterText:
                        '*', //It is shown at the bottomRight of textFiled
                    counterStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                    filled:
                        false, //if it is true and its color is provided then it work as background color in textField
                    fillColor: Colors.yellowAccent,
                    hoverColor: Colors.deepOrange,
                    enabled:
                        true, // if false helper text, error-text and counter text are not displayed also we can't tap on textField
                    //semanticCounterText: 'Close',
                    //alignLabelWithHint: true,//it will align the labelText with hint text when textFiled maxLines>1 to override the default behaviour of align
                  ),
                ),
              ),
            )
          ],
        ),
        //undo redo operation when we use undo controller
        Row(
          children: [
            //Undo and Redo Operation
            ValueListenableBuilder<UndoHistoryValue>(
              valueListenable: textU1,
              builder: (BuildContext context, UndoHistoryValue value,
                  Widget? child) {
                return Row(
                  children: <Widget>[
                    TextButton(
                      child: Text('Undo',
                          style: value.canUndo ? enabledStyle : disabledStyle),
                      onPressed: () {
                        textU1.undo();
                      },
                    ),
                    TextButton(
                      child: Text('Redo',
                          style: value.canRedo ? enabledStyle : disabledStyle),
                      onPressed: () {
                        textU1.redo();
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),

        //User Info TextFields
        Row(
          children: [
            //E-mail TextField
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  showCursor: true,
                  autofocus: true,
                  autocorrect: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black45, width: 2),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    prefixIcon: const Icon(Icons.mail),
                    labelText: 'E-mail',
                    hintText: 'Enter your e-mail Id',
                    labelStyle: const TextStyle(color: Colors.blue),
                  ),
                  cursorColor: Colors.blue,
                  onSubmitted: (value) {
                    emailController.text = value;
                  },
                ),
              ),
            ),
            //Name TextField
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: nameController,
                  focusNode: fN3,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  showCursor: true,
                  autofocus: true,
                  autocorrect: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black45, width: 2),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    prefixIcon: const Icon(Icons.account_circle),
                    labelText: 'Name',
                    hintText: 'Enter your Name',
                    labelStyle: const TextStyle(color: Colors.blue),
                  ),
                  cursorColor: Colors.blue,
                  onSubmitted: (value) {
                    nameController.text = value;
                  },
                ),
              ),
            ),
            //Password TextField
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: passController,
                  focusNode: fN2,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  showCursor: true,
                  obscureText: (toggle == false) ? true : false,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black45, width: 2),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      prefixIcon: const Icon(Icons.password),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      labelStyle: const TextStyle(color: Colors.blue),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              toggle = !toggle;
                            });
                          },
                          icon: (toggle == false)
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off))),
                  cursorColor: Colors.blue,
                  onSubmitted: (value) {
                    passController.text = value;
                  },
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }

  void _printLatestValue() {
    debugPrint(textE1.text.toString());
    debugPrint(input);
  }
}
