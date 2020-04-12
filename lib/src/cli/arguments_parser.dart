import 'dart:io';

import 'package:args/args.dart';
import 'package:dart_code_metrics/src/models/config.dart';

const usageHeader = 'Usage: metrics [options...] <directories>';
const helpFlagName = 'help';
const reporterOptionName = 'reporter';
const cyclomaticComplexityThreshold = 'cyclomatic-complexity';
const executableLinesOfCodeThreshold = 'executable-lines-of-code';
const numberOfArgumentsThreshold = 'number-of-arguments';
const verboseName = 'verbose';
const ignoredFilesName = 'ignore-files';
const rootFolderName = 'root-folder';

ArgParser argumentsParser() => ArgParser()
  ..addFlag(helpFlagName,
      abbr: 'h', help: 'Print this usage information.', negatable: false)
  ..addOption(reporterOptionName,
      abbr: 'r',
      help: 'The format of the output of the analysis',
      valueHelp: 'console',
      allowed: ['console', 'json', 'html', 'codeclimate'],
      defaultsTo: 'console')
  ..addOption(cyclomaticComplexityThreshold,
      help: 'Cyclomatic complexity threshold',
      valueHelp: '$cyclomaticComplexityDefaultWarningLevel',
      defaultsTo: '$cyclomaticComplexityDefaultWarningLevel',
      callback: (String i) {
    if (int.tryParse(i) == null) print('$cyclomaticComplexityThreshold:');
  })
  ..addOption(executableLinesOfCodeThreshold,
      help: 'Executable lines of code threshold',
      valueHelp: '$executableLinesOfCodeDefaultWarningLevel',
      defaultsTo: '$executableLinesOfCodeDefaultWarningLevel',
      callback: (String i) {
    if (int.tryParse(i) == null) print('$executableLinesOfCodeThreshold:');
  })
  ..addOption(numberOfArgumentsThreshold,
      help: 'Number of arguments threshold',
      valueHelp: '$numberOfArgumentsDefaultWarningLevel',
      defaultsTo: '$numberOfArgumentsDefaultWarningLevel',
      callback: (String i) {
    if (int.tryParse(i) == null) print('$numberOfArgumentsThreshold:');
  })
  ..addOption(rootFolderName,
      help: 'Root folder', valueHelp: './', defaultsTo: Directory.current.path)
  ..addOption(ignoredFilesName,
      help: 'Filepaths in Glob syntax to be ignored',
      valueHelp: '{/**.g.dart,/**.template.dart}',
      defaultsTo: '{/**.g.dart,/**.template.dart}')
  ..addFlag(verboseName, negatable: false);
