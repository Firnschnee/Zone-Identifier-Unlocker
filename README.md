# Zone-Identifier-Unlocker

A minimal PowerShell script to remove the `Zone.Identifier` alternate data stream (ADS) from files downloaded from the internet.

## The Problem

Windows tags files downloaded from the internet with a hidden `Zone.Identifier` alternate data stream (NTFS ADS). This marks the file as originating from the internet (Zone 3) and causes issues like:

- Files not showing in the **Explorer preview pane**
- Applications refusing to open files or showing security warnings
- General "untrusted" behavior for otherwise harmless local files

The typical workarounds are cumbersome:
- **Sysinternals Streams** – requires a separate download and command-line usage
- **Copy to FAT32 and back** – works but feels like a 1990s hack (FAT32 doesn't support ADS, so the stream is lost on copy)
- **Right-click → Properties → Unblock** – works only file by file

## The Solution

PowerShell ships with `Unblock-File`, which removes the `Zone.Identifier` stream natively. This script runs it recursively on an entire folder.

## Usage

```powershell
# Unblock all files in the current directory
.\Zone-Identifier-Unlocker.ps1

# Unblock all files in a specific directory
.\Zone-Identifier-Unlocker.ps1 -Path "C:\path\to\your\folder"
```
Just put the file in the folder and run it. 

## Notes

- Requires PowerShell 3.0 or later (ships with Windows 8.1+)
- Run as the user who owns the files (no admin required in most cases)
- Only affects NTFS volumes — FAT32/exFAT don't support ADS anyway

## License
MIT License – See [LICENSE](LICENSE) file
