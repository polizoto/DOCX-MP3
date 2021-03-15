# DOCX-MP3
Create MP3 Files From DOCX

![DOCX-MP3 Usage Screenshot](https://github.com/polizoto/DOCX-MP3/blob/main/Screenshots/DOCX-MP3%20Script%20Usage.png)

## Requirements
- [Git for Windows](https://git-scm.com/download/win) - We recommend these [general installation instructions for Git for Windows](https://phoenixnap.com/kb/how-to-install-git-windows)
- [Pandoc](https://pandoc.org/installing.html)
- [Balcon](http://www.cross-plus-a.com/balcon.zip)
- [Lame - 64 bit](https://www.rarewares.org/files/mp3/lame3.100.1-x64.zip) OR [Lame - 32 bit](https://www.rarewares.org/files/mp3/lame3.100.1-win32.zip)
- [ID3](https://resource.dopus.com/uploads/default/original/3X/9/5/95a7771be4fdbbfee19729fecc456048bd14efe5.zip)
- [FFMPEG](https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z)
- [MP3 Cover](https://github.com/polizoto/DOCX-MP3/tree/main/MP3%20Cover)
- [Tasklist](https://www.computerhope.com/download/winxp.htm)

## Optional
- [Nodejs](https://nodejs.org/en/)
- [MathJax Node SRE](https://www.npmjs.com/package/mathjax-node-sre)
- [Aeneas](https://github.com/sillsdev/aeneas-installer/releases/download/v1.7.3.0_2/aeneas-windows-setup-1.7.3.0_2.exe)
- [Sentence-Boundary-original.pl](https://github.com/polizoto/DOCX-MP3/blob/main/sentence-boundary-original.pl) script and [HONORIFICS](https://github.com/polizoto/DOCX-MP3/blob/main/HONORIFICS) file
- [MP3Chaps](https://pypi.org/project/mp3chaps/)
- [Additional SAPI 5 Voices](https://support.microsoft.com/en-us/topic/download-voices-for-immersive-reader-read-mode-and-read-aloud-4c83a8d8-7486-42f7-8e46-2b0fdf753130) (For More Languages); See these instructions for [making these voices available systemwide]()
- [eSpeak](http://espeak.sf.net/download.html) (for additional voices, including Latin and Ancient Greek)

## Setup
1. 

## Features

- Microsoft Core Voices: David, Mark, Zira (English - US), Elsa (Italian), Hortense (French), Naayf, Hoda (Arabic), Ivan (Bulgarian), Herena (Catalan), Huihui, Tracy, Zhiwei (Chinese), Jakub (Czech), Helle (Danish), Frank, Bart (Dutch), James (English - Australia), Linda (English - Canada), Hazel (English - Great Britain)
- Supports multiple speeds (-10 through 10)
- Language switching (when using `-l` option). Up to nine secondary languages possible in one document. In addition to the voices listed above (see Voices), possible secondary languages include Estonian, Lithuanian, Farsi, Afrikaans, Latin, and Ancient Greek.
- Natural pauses at page numbers, paragraphs, sentences
- Splits audio file automatically in parts when file is ~30 minutes (requires page numbers to marked as Heading #6)
- Adds id3 (metadata) properties to audio file (Artist, Album, Song, Year, Track, Comments)
- Adds Cover Image
- Creates MP3 Bookmarks when DOCX has headings
- Creates a caption files (when using `-c keep` option)
- Supports processing of OMML equations into more natural sounding 'math speech' (uses MathJax SRE)
- Detects secondary text, footnotes, foonote regions, mathematical content areas and allows users the option to delete them before processing
- Lower pitch for parentheses
- batch processing

## Overview
DOCX-HTML.sh is a bash script that converts DOCX files to MP3 (audio) format. 

## Getting Started
