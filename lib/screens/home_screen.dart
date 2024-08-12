
import 'package:al_planner/screens/pathing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _uploadIndex = 0;
  final List<File> _fileOptions = <File>[];
  Directory directory = Directory("/");
  String currentJson = "";

  Color buttonColor = const Color(0xffff9700);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDirectory();
  }

  Future<void> _loadDirectory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _openDirectory(prefs.getString('directory') ?? "/");
    });
  }

  Future<void> _saveDirectory() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('directory', directory.absolute.path);
  }

  void _openDirectory(String? selectedDirectory) {
    if (selectedDirectory == null) {
      return;
    }
    setState(() {
      _fileOptions.clear();
    });

    directory = Directory(selectedDirectory);

    _saveDirectory();

    directory.list().listen((event) {
      if (extension(event.path) == '.json') {
        setState(() {
          _fileOptions.add(File(event.path));
        });
      }
    }).onDone(() {
      setState(() {
        _fileOptions
            .sort((a, b) => absolute(a.path).compareTo(absolute(b.path)));
      });
    });
  }

  void save() {
    if (_fileOptions.isNotEmpty) {
      File file = _fileOptions[_selectedIndex];
      file.writeAsStringSync(currentJson, flush: true);
    }

    setState(() {
      buttonColor = const Color(0xFFFF9700);
    });
  }

  void saveAs() {
    FilePicker.platform
        .saveFile(
      dialogTitle: 'Please select an output file:',
      fileName: 'output-file.json',
    )
        .then((outputFile) {
      File file = File(outputFile!);
      file.writeAsStringSync(currentJson);
      _openDirectory(directory.path);
    });
  }

  void open() {
    FilePicker.platform.getDirectoryPath().then((selectedDirectory) {
      _openDirectory(selectedDirectory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Row(
            children: [
              Expanded(
                flex: 3,
                child: SelectableText(
                    _fileOptions.isEmpty
                        ? "Open path!"
                        : basename(_fileOptions[_selectedIndex].path),
                    onTap: () async {
                  await Clipboard.setData(ClipboardData(
                      text: _fileOptions.isEmpty
                          ? "Open path!"
                          : basename(_fileOptions[_selectedIndex].path)));
                  // copied successfully
                }),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: TextEditingController(text: _uploadIndex.toString()),
                  onSubmitted: (newUploadIndex) {
                    setState(() {
                      _uploadIndex = int.parse(newUploadIndex);
                    });
                  },
                  decoration: const InputDecoration(labelText: "Enter auton number"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
              ),
            ],
          )),
      body: PlatformMenuBar(
        menus: <PlatformMenuItem>[
          PlatformMenu(label: "AL Planner", menus: <PlatformMenuItem>[
            if (PlatformProvidedMenuItem.hasMenu(
                PlatformProvidedMenuItemType.about))
              const PlatformProvidedMenuItem(
                  type: PlatformProvidedMenuItemType.about),
            if (PlatformProvidedMenuItem.hasMenu(
                PlatformProvidedMenuItemType.quit))
              const PlatformProvidedMenuItem(
                  type: PlatformProvidedMenuItemType.quit),
          ]),
          PlatformMenu(label: "File", menus: [
            PlatformMenuItem(
                label: "Open Project",
                onSelected: () {
                  open();
                },
                shortcut:
                    const SingleActivator(LogicalKeyboardKey.keyO, meta: true)),
            PlatformMenuItem(
                label: "Save file",
                onSelected: () {
                  save();
                },
                shortcut:
                    const SingleActivator(LogicalKeyboardKey.keyS, meta: true)),
            PlatformMenuItem(
                label: "Save as",
                onSelected: () {
                  saveAs();
                },
                shortcut: const SingleActivator(LogicalKeyboardKey.keyS,
                    meta: true, shift: true)),
            PlatformMenuItem(
                label: "Next file",
                onSelected: () {
                  setState(() {
                    _selectedIndex++;
                    _selectedIndex%=_fileOptions.length;
                  });
                },
                shortcut:
                const SingleActivator(LogicalKeyboardKey.keyK, meta: true)),
            PlatformMenuItem(
                label: "Last file",
                onSelected: () {
                  setState(() {
                    _selectedIndex--;
                    _selectedIndex%=_fileOptions.length;
                  });
                },
                shortcut:
                const SingleActivator(LogicalKeyboardKey.keyI, meta: true)),
            PlatformMenuItem(
                label: "Open Project",
                onSelected: () {
                  open();
                },
                shortcut:
                const SingleActivator(LogicalKeyboardKey.keyO, meta: true)),
          ]),
        ],
        child: _fileOptions.isEmpty
            ? const Text("Choose File!", style: TextStyle(fontSize: 80))
            : PathingScreen(_fileOptions[_selectedIndex], (String value) {
                currentJson = value;
              }, false),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xfff5e6cf),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                basename(_fileOptions[index].path),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              selected: _selectedIndex == index,
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
            );
          },
          itemCount: _fileOptions.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: buttonColor,
        onPressed: () {
          setState(() {
            buttonColor = const Color(0xFFFF9700);
          });

          if (_fileOptions.isNotEmpty) {
            File file = _fileOptions[_selectedIndex];
            file.writeAsStringSync(currentJson, flush: true);
          }

          var uploadScriptDirectory = split(directory.absolute.path)
              .sublist(0, split(directory.absolute.path).length - 1);
          uploadScriptDirectory.add("uploadAllAutons.py");

          // print(joinAll(uploadScriptDirectory));

          Process.run('python3', [
            joinAll(uploadScriptDirectory),
            _uploadIndex.toInt().toString(),
          ], environment: {
            "PATH":
                "/Users/alex/.gem/bin:/opt/homebrew/opt/ruby/bin:/Users/alex/.pyenv/shims:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/Users/alex/development/flutter/bin"
          }).asStream().listen((event) {
            if (event.exitCode == 0) {
              setState(() {
                buttonColor = Colors.green;
              });
              // return;
            }

            setState(() {
              buttonColor = Colors.red;
            });

            showAlertDialog(context, event.stdout + event.stderr);
          });
        },
        child: Text(_uploadIndex.toString()),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String stdout) {
  AlertDialog alert = AlertDialog(
    title: const Text("Error"),
    content: Text(stdout),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
