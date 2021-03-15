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

## General Setup
1. Download the DOCX-MP3.sh script to your [PC](https://github.com/polizoto/DOCX-HTML/blob/main/DOCX-HTML_mac.sh)
2. Place the script in an easy-to-locate folder (`C:\scripts\` for PC)
3. Create a "MP3 Cover" folder in your `C:\` drive (PC). Name your default cover image "Default_Cover.jpg"
4. Download the executables for Balcon, Lame, id3, and FFMPEG and add the path to these executables to your Environmental Variables (requires admin rights):
      - Windows Start > Edit System Variables > Environment Variables
      - In the System variables group, select the Path variable and click Edit...
      - In the Edit Environment variable window, click New
      - Paste the path to the Lame executable (C:\Program Files (x86)\Balcon)
      - Click New again
      - Paste the path to the Lame executable (C:\Program Files (x86)\Lame)
      - Click New again
      - Paste the path to the id3 executable (C:\Program Files (x86)\id3)
      - Click New again
      - Paste the path to the FFMPEG executable (C:\Program Files (x86)\FFMPEG)
      - Click OK three times
5. Place Tasklist.exe in the `C:\scripts\` folder (PC only)

### Optional Setup for processing math equations:
1. Install Node.js
2. Open the terminal and type `npm install -g mathjax-node-cli` and press Enter. Wait for installation to complete
3. Open the terminal and type  `npm install -g mathjax-node-sre` and press Enter. Wait for the installation to complete
4. Edit the environmental variables on your machine to include the path to the mathjax-node-cli\bin and node_modules folders, respectively. These should be located here:
            - C:\Users\YOUR-NAME\AppData\Roaming\npm\node_modules
            - C:\Users\YOUR-NAME\AppData\Roaming\npm\node_modules\mathjax-node-cli\bin

### Optional Setup for creating MP3 bookmarks
1. Install Aeneas using the Windows installer file above (this will install multiple programs, include Python 3)
2. Open the terminal and type `pip3 install mp3chaps`. Wait for the installation to complete.

### Optional Setup for downloading other Microsoft SAPI 5 voices (for other languages):
1.Select the Start button, then select Settings > Time & Language > Region & Language and Select Speech.
2. Click Add a Voice and select the language you need. Wait for installation to complete
3. To confirm that the voice was installed, open a new Git Bash terminal and type
`balcon -l` and press Enter. The new voice should now be listed in the terminal screen.

**Note:** All of the languages available from Microsoft are supported by the script (as of 1/5/2021). While some voices are available system wide after installation, such as German - Microsoft Hedda Desktop or French  - Microsoft Hortense Desktop, voices from some languages cannot be used by the script unless you edit your registry (see below). Some examples of voices for which you will need to edit the registry: Hebrew - Microsoft Asaf; Hungarian - Microsoft Szabolcs etc.

### Optional Setup for making Microsoft SAPI 5 voices available systemide

1. Start > Create a System Restore Point and Press Create
2. Type a name for your Restore Point (e.g., Pre - Microsoft SAPI 5 Voices) and Press Create
3. Make sure you have the Microsoft voices installed using the steps in the previous section. You can check by going to Settings > Time and Language > Speech and selecting Choose a voice (drop down menu).
4. Identify the voice that you have installed (for the language you need) but that is not available system wide. See the list below:

            - Naayf     [Arabic-Saudi Arabia]
            - Hoda      [Arabic-Egypt]
            - Ivan      [Bulgarian]
            - Herena    [Catalan]
            - Jakub     [Czech]
            - Helle     [Danish]
            - Michael   [German- Austria]
            - Karsten   [German - Switzerland]
            - Stefanos  [Greek]
            - James     [English - Australia]
            - Linda     [English - Canada]
            - Hazel     [English - Great Britain]
            - Ravi      [English - India]
            - Sean      [English - Ireland]
            - Heidi     [Finnish]
            - Claude    [French - Canada]
            - Guillaume [French - Switzerland]
            - Asaf      [Hebrew]
            - Hemant    [Hindi]
            - Matej     [Croatian]
            - Szabolcs  [Hungarian]
            - Andika    [Indonesian]
            - Heami     [Korean]
            - Rizwan    [Malaysian]
            - Frank     [Dutch - Netherlands]
            - Bart      [Dutch - Belgium]
            - Jon       [Norwegian]
            - Paulina   [Polish]
            - Helia     [Portuguese - Portugal]
            - Andrei    [Romanian]
            - Filip     [Slovak]
            - Lado      [Slovenian]
            - Bengt     [Swedish]
            - Valluvar  [Tamil]
            - Pattara   [Thai]
            - Tolga     [Turkish]
            - An        [Vietnamese]
            - Huihui    [Chinese - China]
            - Tracy     [Chinese - Hong Kong]
            - Zhiwei    [Chinese - Taiwan]

5. Locate the modified registry file for the voice(s) that you have installed here:

[Registry Files for Voices Not Available Systemwide]()

**Note:** The registry file will have the same name as the voice followed by an ‘m’.

6. Drag the registry file to your C:\  drive and double click on it.
7. Click Yes when prompted to modify the registry
8. Open a new GitBash window and type `balcon -l` to confirm that the voices are now available.



And some voices (Latin, Lithuanian, Estonian, Farsi, and Afrikaans) must be installed by installing E-Speak. (see below)



## Features

- Microsoft Core Voices: David, Mark, Zira (English - US), Naayf, Hoda (Arabic), Ivan (Bulgarian), Herena (Catalan), Huihui, Tracy, Zhiwei (Chinese), Jakub (Czech), Helle (Danish), Frank, Bart (Dutch), James (English - Australia), Linda (English - Canada), Hazel (English - Great Britain), Ravi (English - India), Sean (English - Ireland), Heidi (Finnish), Hortense, Claude, Guillaume (French), Hedda, Michael, Karsten (German), Stefanos (Greek), AncientGr (Ancient Greek), Asaf (Hebrew), Heman (Hindi), Matej (Croatian), Szabolcs (Hungarian), Andika (Indonesian), Elsa (Italian), Haruka (Japanese), Heami (Korean), Rizwan (Malaysian), Jon (Norwegian), Paulina (Polish), Helia, Maria (Portuguese), Andrei (Romanian), Irina (Russian), Filip (Slovak), Lado (Slovenian), Helena, Sabina (Spanish), Bengt (Swedish), Valluvar (Tamil), Pattara (Thai), Tolga (Turkish), An (Vietnamese).
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
