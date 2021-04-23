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
- [Additional SAPI 5 Voices](https://support.microsoft.com/en-us/topic/download-voices-for-immersive-reader-read-mode-and-read-aloud-4c83a8d8-7486-42f7-8e46-2b0fdf753130) (For More Languages); See these instructions for [making these voices available systemwide](https://github.com/polizoto/DOCX-MP3/blob/main/README.md#optional-setup-for-making-microsoft-sapi-5-voices-available-systemide)
- [eSpeak](http://espeak.sf.net/download.html) (for additional voices, including Latin and Ancient Greek)
- [NLTK](http://www.nltk.org/install.html) (for checking the pronunciation of proper nouns)

## General Setup
1. Download the DOCX-MP3.sh script to your [PC](https://github.com/polizoto/DOCX-MP3/blob/main/DOCX-MP3.sh)
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

            C:\Users\YOUR-NAME\AppData\Roaming\npm\node_modules
          
            C:\Users\YOUR-NAME\AppData\Roaming\npm\node_modules\mathjax-node-cli\bin

### Optional Setup for creating MP3 bookmarks
1. Install Aeneas using the Windows installer file above (this will install multiple programs, include Python 3)
2. Open the terminal and type `pip3 install mp3chaps`. Wait for the installation to complete.
3. Place the `Sentence-Boundary-original.pl` file and the `HONORIFICS` file in your `C:\scripts\` folder

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
            [Registry Files for Voices Not Available Systemwide](https://www.dropbox.com/s/9op04duwuco6cll/Registry%20Files%20for%20Voices%20Not%20Available%20Systemwide.zip?dl=0)

6. Drag the registry file to your `C:\`  drive and double click on it.

7. Click Yes when prompted to modify the registry

8. Open a new GitBash window and type `balcon -l` to confirm that the voices are now available.

**Note:** The registry file will have the same name as the voice followed by an ‘m’.

### Optional Setup for Adding Voices from Espeak

Some voices (Latin, Lithuanian, Estonian, Farsi, and Afrikaans) must be installed by installing E-Speak and typing the name of these voices

1. Download and run the Espeak executable:

     [eSpeak](http://espeak.sourceforge.net/download.html)

2. When prompted by the installer, enter the value(s) for the voice you wish to install. For example:
                  `mb-la1` (for Latin)
                  `mb-ee1` (for Estonian)
                  `mb-af1` (for Afrikaans)
                  `mb-ir1` (for Farsi)
                  `mb-lt1` (for Lithuanian)
                  `grc`    (for Ancient Greek)

3. Press Next and proceed with the installation

4. Open a new terminal window and type `balcon -l` to confirm that the voices are now available. You should see the following:
- eSpeak-mb-la1 (Latin)
- eSpeak-mb-ee1 (Estonian)
- eSpeak-mb-af1 (Afrikaans)
- eSpeak-mb-ir1 (Farsi)
- eSpeak-mb-lt1 (Lithuanian)
- eSpeak-grc (Ancient Greek)

### Optional Setup for processing proper nouns
1. Install NLTK
      `python -i`
      `pip install --user -U nltk`
2. Download `noun_phrases.py` and `lexconvert.py` from this repository and place these in your `\c\scripts\` folder

Note: When installing NLTK, you may also need to download the 'punkt' and 'averaged_perceptron_tagger' packages. If so, type `python -i` in the Git Bash terminal and then enter `nltk.download('punkt')`. Then type `nltk.download('averaged_perceptron_tagger')`.

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
- Inspects the pronunciation of proper nouns (when using the `-i` option)
- Supports processing of OMML equations into more natural sounding 'math speech' (uses MathJax SRE)
- Checks the alternative text of math equations (when using the `-i` option)
- Detects secondary text, footnotes, foonote regions, mathematical content areas and allows users the option to delete them before processing
- Lower pitch for parentheses
- batch processing

## Overview
DOCX-MP3.sh is a bash script that converts DOCX files to MP3 (audio) format. The script optimizes the quality of audio files by inserting a variety of tags that produce natural sounding text to speech (TTS). This document will explain how to run the DOCX-MP3.sh script.

## Getting Started
Before using the DOCX-MP3.sh script, it is important to make sure that the MS Word document you are converting contains the following features:

- Heading structure
- Alternative text for images
- Page numbers  are styled as Heading 6 (for easier navigation)

In addition to these elements, there are some document features that can be programmatically deleted (secondary text and footnote regions) by the script if you use “MS Word tags” in your document.

### MS Word Tags

For a complete list of the tags that are recognized by the DOCX-MP3.sh script, see the [MS Word Tags document](https://www.dropbox.com/s/lhogh996v2itfzq/MS%20Word%20Tags-DOCX-HTML.docx?dl=0). This document explains how each of the tags should be used in your MS Word document.

We will give a few examples of the most common tags below:

#### Secondary Text

When there is text in a document that is not essential to the main content (e.g., a sidebar), this is “secondary text”. On the line above secondary text, enter the following tag: 

`Secondary Text Begin:`

And on the line below secondary text, enter:

`Secondary Text End.`

#### Footnote Text
If there are footnotes in your document, make sure that these have superscript formatting. For the footnote references (on the bottom of each page OR at the end of the document) use the following tag above the footnote text region:

`Footnote Begin:`

And on the line below footnote text region, enter:

`Footnote End.`

#### Foreign Languages
The DOCX-MP3.sh script will use the correct language voice for secondary languages when these are marked with language tags in your MS Word document.

Insert the following tag before the foreign language text:

`###1`

And enter the following tag after the foreign language text:

`%%%`

**Note:** These tags should be used in-line with text in your document. If there is more than one foreign language, use `###2` and `###3` before the second and  third foreign languages, respectively, and use the same ending tag (`%%%`) at the end of these passages. The DOCX-HTML.sh script can process up to nine foreign languages in your MS Word document.

## Simple Usage
1. From a Git Bash window, enter the path to the script (/c/scripts/DOCX-MP3.sh)
2. Press Enter and wait for the conversion to complete.

**Notes:**

- The MP3 file will be created in a folder with the same name as the DOCX file. 
- A copy of the DOCX file will be created in a folder entitled Converted-DOCX-MP3 
- A log.txt file will be created in the Converted-DOCX-MP3 folder with info about the MP3
- When you use the DOCX-MP3.sh script without options, the MP3 will have these properties:
      - Voice: David
      - Speed: 0
      - Author: Alternative Media Unit
      - Album: Name of the DOCX

## Assigning Properties to the MP3
DOCX-MP3.sh allows you to add the following properties to the MP3:
- author = the name of the author of a book (`-a` flag)
- publication (album) = the name of the book or course (e.g., Soc 101 bCourse) (`-p` flag)
- track = the number of the track (if there are MP3s for one book) (`-t` flag)

For example, if a folder contains a number of DOCX files that go with the “Tom Sawyer” text, you can follow these steps to assign the same author and same publication  to each one of them:
1. From a Git Bash window, enter the path to the script (/c/scripts/DOCX-MP3.sh)
2. In the terminal enter the `-a` flag (for the author’s name), press space, and then
3. Enter the name of the author, using quotes if there are any spaces in the name of the author.
4. In the terminal enter the `-p` flag (for the name of the publication), press space, and then enter the name of the book or Course, using quotes if there are any spaces in the name of the publication.
5. Press Enter
**Notes:**
- Do NOT use these flags when the DOCX files in your folder are for different booksbCourses

## Assigning TTS Settings to the MP3
DOCX-MP3.sh allows you to add the adjust the following TTS settings to the MP3:
- name (voice) = the name of the TTS voice (`-n` flag)
- speed = the name of the TTS speed (`-s` flag)

For example, if a DOCX file needs to be converted for a student who prefers the Mark voice at `4` speed, you can follow these steps to assign all the voice and speed to the DOCX files:
1. From a Git Bash window, enter the path to the script (/c/scripts/DOCX-MP3.sh)
2. In the terminal enter the `-n` flag (for the name of the TTS), press space, and then enter the name of the TTS voice.
3. In the terminal enter the `-s` flag (for the speed of the TTS), press space, and then enter the speed of the TTS voice (`-10` through `10`).
4. Press Enter.


**Notes:**
- Do NOT use these flags when there are DOCX files in your folder for students with different TTS preferences. Convert one DOCX at a time, instead.

## Adding Language Switches to the MP3
DOCX-MP3.sh allows you to add language switches to the MP3 so that a passage in a different (secondary) language than the base language will be pronounced by the correct TTS voice. To add multiple language switches to the MP3, the DOCX must have the following tags:

`###1`…`%%%` = first secondary language
`###2`…`%%%` = second secondary language etc.

For example, if a DOCX in your folder is in English but contains passages in Italian and in German, you can follow these steps to assign the appropriate language switches to the passages in the MP3:
1. From a Git Bash window, enter the path to the script (/c/scripts/DOCX-MP3.sh)
2. In the terminal enter the `-l` flag (for language), press space, and then enter the value of the 1st secondary language (`it` for Italian).
3. In the terminal enter the `-l` flag (for language), press space, and then enter the value of the 2nd secondary language (`de`  for German).
4. Press Enter.

**Notes:**
- `###1`....`%%%` tags cannot span paragraphs in the DOCX. You CANNOT use `@@@` tags (as is possible with the DOCX-HTML.sh script).
- Please see the instructions about installing TTS voices.

## Converting Math Equations to MathSpeak
DOCX-MP3.sh allows you to convert math equations in a DOCX to a more natural sounding “mathspeak”  in the MP3. To convert math equations in the DOCX to mathspeak in the MP3, the DOCX must have math equations as OMML (Office Math Markup Language) or MS Word equation format. 

If a DOCX in your folder contains math equations, you can use the following steps to convert these to mathspeak.
1. From a Git Bash window, enter the path to the script (/c/scripts/DOCX-MP3.sh)
2. In the terminal enter the `-m` flag (for math)
3. Press Enter.

**Notes:**
Remember to use [GrindEQ MathType to Equation](https://www.grindeq.com/index.php?p=mathtype2equation&lang=en) to convert MathType equations to OMML format before using DOCX-MP3.sh

## Reading Terminal Output 
When you run DOCX-MP3.sh, you may see that there are messages warning you about the presence of items in your document that you may wish to remove:
- Footnotes
- Tables
- Secondary text areas
- Footnote text areas

Unless otherwise noted, you should remove ALL of these items, if they are detected, when prompted..

For example, if a file that you are converting contains footnotes and footnote text areas, please follow these steps:
1. After the question “Do you wish to keep the footnotes?”, type N.
2. After the question  “Do you wish to keep footnote text areas?”, type N.

**Notes:**
If you keep the footnotes, there will be a pause before and after the footnote as well as a pitch change in the MP3.
If you keep the secondary text or footnote areas, there will be a pause before and after these areas as well as a pitch change announcing “Secondary Text” or “Footnote Text”.

## Sample Files
See the following documents for examples of DOCX files with "MS Word tags" and their MP3 versions.

### Example 1: Textbook

[Textbook.docx](https://www.dropbox.com/s/z5947ox0uynl0wd/Textbook.docx?dl=0) | [Textbook.mp3](https://www.dropbox.com/s/jm54sziwfj949lq/Textbook.mp3?dl=0)

### Example 2: Secondary Languages

[Secondary_Languages.docx](https://www.dropbox.com/s/x8w6hq6ptmk0l8m/Secondary_Languages.docx?dl=0) | [Secondary_Languages.mp3](https://www.dropbox.com/s/3ltno1dmhj8hnfk/Secondary_Languages.mp3?dl=0)

**Notes:**
If there are multiple languages in your DOCX file, you will need to use the `-l` flagand you must enter the [ISO language code](https://www.loc.gov/standards/iso639-2/php/code_list.php) for each secondary language(s). Use the -l option before each ISO language code if there are multiple secondary languages. For example, `'/c/scripts/DOCX-MP3.sh' -l it -l fr`. In this example, there are two secondary languages, Italian (it) and French (fr). These are marked with `###1` and `###2`, respectively, in the MS Word document. See the [MS WORD Tags document](https://www.dropbox.com/s/lhogh996v2itfzq/MS%20Word%20Tags-DOCX-HTML.docx?dl=0) for more information about usage.

### Example 3: Mathematical Content

[Math_Test.docx](https://www.dropbox.com/s/mmd1htycv8e1zyd/Math_test.docx?dl=0) | [Math_Test.mp3](https://www.dropbox.com/s/3cs0g800wqt2b8u/Math_Test.mp3?dl=0)

## Further Resources

[DOCX-MP3 Script Demonstration Video](https://www.dropbox.com/s/q27gtr1atgre0em/DOCX-MP3_opencaptions.mp4?dl=0)
