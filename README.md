# winclip-sync

PowerShell scripts to read and write windows clipboard without installation.

## Overview

winclip-sync can read and write the windows clipboard and can be used immediately **with no installation required**. Supported formats are Text, Images, and FileDropList.

By using shared folders, you can synchronize the clipboard between different windows-pc.
![image](winclip-sync.png)

## Usage

### [write_clipboard.ps1](write_clipboard.ps1)

If you run, write the clipboard to the path specified by `config.xml`.

### [read_clipboard.ps1](read_clipboard.ps1)

If you run, read the contents of the path specified by `config.xml` and set it to the clipboard.

You can also assign shortcut keys by creating a shortcut for each script.

## License

The MIT License (MIT) 2021 - [tamaosa](https://github.com/tamaosa).
