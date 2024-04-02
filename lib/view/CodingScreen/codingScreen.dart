import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:myapp/controller/authController.dart';
import 'package:myapp/view-models/localStorage.dart';
import 'package:get/get.dart';

class CodingScreen extends StatefulWidget {
  final String questionId;
  const CodingScreen({Key? key, required this.questionId}) : super(key: key);

  @override
  _CodingScreenState createState() => _CodingScreenState();
}

class _CodingScreenState extends State<CodingScreen> {
  final _controller = TextEditingController();
  UserPreferences _userPreferences = UserPreferences();
  AuthController _authController = Get.find<AuthController>();
  RxBool flag = false.obs;
  String currentText = '';
  String currentLanguage = '';
  late EditorModel model;

  @override
  void initState() {
    super.initState();
    _authController.cpp.value.text =
        "#include<iostream>\n\nint main() {\n\tstd::cout << \"Hello, World!\";\n\treturn 0;\n}";

    _authController.c.value.text =
        "#include<stdio.h>\n\nint main() {\n\tprintf(\"Hello, World!\\n\");\n\treturn 0;\n}";

    List<FileEditor> files = [
      FileEditor(
        name: "main.cpp",
        language: "cpp",
        code: _authController.cpp.value.text,
      ),
      FileEditor(
        name: "main.c",
        language: "c",
        code:
            "#include<stdio.h>\n\nint main() {\n\tprintf(\"Hello, World!\\n\");\n\treturn 0;\n}",
      ),
      FileEditor(
        name: "Main.java",
        language: "java",
        code:
            "public class Main {\n\tpublic static void main(String[] args) {\n\t\tSystem.out.println(\"Hello, World!\");\n\t}\n}",
      ),
      FileEditor(
        name: "main.py",
        language: "python",
        code: "print('Hello, World!')",
      ),
    ];

    _userPreferences.getSubmit(widget.questionId).then((value) {
      flag.value = value!;
    });

    model = EditorModel(
      files: files,
    );
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = "Diwefewfqef efqeiofqf wjdqidhq";
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Your Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CodeEditor(
                onSubmit: (code, hello) {
                  print("hfeweoifw");
                  print(code);
                  print(hello);
                },
                model: model,
                textModifier: (language, content) {
                  currentText = content;
                  currentLanguage = language;
                  print(content);
                  print(language);
                  return content;
                },
                formatters: ["html", "C++", "C", "JAVA"],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              Obx(
                () => flag.value == true
                    ? Center(
                        child: InkWell(
                          onTap: () {
                            // Get.to(CodingScreen());
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(0.5),
                              //     spreadRadius: 5,
                              //     blurRadius: 7,
                              //     offset: Offset(0, 3),
                              //   ),
                              // ],
                            ),
                            child: Text(
                              'Submitted',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: InkWell(
                          onTap: () async {
                            await _userPreferences.saveSubmit(
                                widget.questionId, true);
                            flag.value = true;
                            // Get.to(CodingScreen());
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(0.5),
                              //     spreadRadius: 5,
                              //     blurRadius: 7,
                              //     offset: Offset(0, 3),
                              //   ),
                              // ],
                            ),
                            child: Text(
                              'Click To Submit',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
