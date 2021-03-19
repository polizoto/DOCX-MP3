#!/bin/bash

# Joseph Polizzotto
# UC Berkeley
# 510-642-0329
# Version 0.1.7
# Instructions: 
# 1. Create a folder where you will convert DOCX files to MP3s (C:\MP3 Projects)
# 2. Place DOCX files in the folder
# 3. Open a Git Bash terminal or Command Prompt and enter the path to the script (/c/scripts/DOCX-MP3.sh)
# 4. Enter options (voice, speed, etc.)
# The MP3 will be created in the current working directory
# The DOCX file will be moved to a folder called "Converted-MP3-DOCX"

###### PC SCRIPT #######

function usage (){
    printf "\nUsage: $(baseName "$0") [options [parameters]]\n"
    printf "\n"
    printf "Options:\n"
	printf "\n"
	printf "  %-5s %-3s\n" "-a" "Author's name"
	printf "  %-5s %-3s\n" "" "Parameters:"
	printf "  %-10s %-6s\n" "" "Name of the Author / Researcher"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "UC Berkeley - Alt Media Department"
	printf "\n"
	printf "  %-5s %-3s\n" "-c" "Create Caption file (.vtt) and MP3 bookmarks"
	printf "  %-5s %-3s\n" "" "Parameters:"
	printf "  %-10s %-6s\n" "" "Keep"
	printf "  %-10s %-6s\n" "" "Off"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "On"
	printf "\n"
	printf "  %-5s %-3s\n" "-e" "Check for Errors with speech synthesis"
	printf "  %-5s %-3s\n" "" "Parameters:"
	printf "  %-10s %-6s\n" "" "None"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "Off"
	printf "\n"
	printf "  %-5s %-3s\n" "-h" "Print help"
	printf "\n"
	printf "  %-5s %-3s\n" "-i" "Insert a phonetic transcription"
	printf "  %-5s %-3s\n" "" "Parameters:"
	printf "  %-10s %-6s\n" "" "None"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "Off"
	printf "\n"
	printf "  %-5s %-3s\n" "-l" "Designate secondary languages"
	printf "  %-5s %-3s\n" "" "Use -l flag before every secondary language"
	printf "  %-5s %-3s\n" "" "Parameters:"
	printf "  %-10s %-6s %-3s\n" "" "af" "[Afrikaans]"
	printf "  %-10s %-6s %-3s\n" "" "ar-sa" "[Arabic - Saudi Arabia]"
	printf "  %-10s %-6s %-3s\n" "" "ar-eg" "[Arabic - Egypt]"
	printf "  %-10s %-6s %-3s\n" "" "bg" "[Bulgarian]"
	printf "  %-10s %-6s %-3s\n" "" "ca" "[Catalan]"
	printf "  %-10s %-6s %-3s\n" "" "cs" "[Czech]"
	printf "  %-10s %-6s %-3s\n" "" "da" "[Danish]"
	printf "  %-10s %-6s %-3s\n" "" "de" "[German - Germany]"
	printf "  %-10s %-6s %-3s\n" "" "de-at" "[German - Austria]"
	printf "  %-10s %-6s %-3s\n" "" "de-ch" "[German - Switzerland]"
	printf "  %-10s %-6s %-3s\n" "" "el" "[Greek]"
	printf "  %-10s %-6s %-3s\n" "" "en-au" "[English - Australia]"
	printf "  %-10s %-6s %-3s\n" "" "en-ca" "[English - Canada]"
	printf "  %-10s %-6s %-3s\n" "" "en-gb" "[English - Great Britain]"
	printf "  %-10s %-6s %-3s\n" "" "en-in" "[English - India]"
	printf "  %-10s %-6s %-3s\n" "" "en-ie" "[English - Ireland]"
	printf "  %-10s %-6s %-3s\n" "" "en-us" "[English - United States]"
	printf "  %-10s %-6s %-3s\n" "" "es" "[Spanish - Spain]"
	printf "  %-10s %-6s %-3s\n" "" "es-mx" "[Spanish - Mexico]"
	printf "  %-10s %-6s %-3s\n" "" "et" "[Estonian]"
	printf "  %-10s %-6s %-3s\n" "" "fa" "[Farsi]"
	printf "  %-10s %-6s %-3s\n" "" "fi" "[Finnish]"
	printf "  %-10s %-6s %-3s\n" "" "fr" "[French - France]"
	printf "  %-10s %-6s %-3s\n" "" "fr-ca" "[French - Canada]"
	printf "  %-10s %-6s %-3s\n" "" "fr-ch" "[French - Switzerland]"
	printf "  %-10s %-6s %-3s\n" "" "he" "[Hebrew]"
	printf "  %-10s %-6s %-3s\n" "" "hi" "[Hindi]"
	printf "  %-10s %-6s %-3s\n" "" "hr" "[Croatian]"
	printf "  %-10s %-6s %-3s\n" "" "hu" "[Hungarian]"
	printf "  %-10s %-6s %-3s\n" "" "id" "[Indonesian]"
	printf "  %-10s %-6s %-3s\n" "" "it" "[Italian]"
	printf "  %-10s %-6s %-3s\n" "" "ja" "[Japanese]"
	printf "  %-10s %-6s %-3s\n" "" "ko" "[Korean]"
	printf "  %-10s %-6s %-3s\n" "" "la" "[Latin]"
	printf "  %-10s %-6s %-3s\n" "" "lt" "[Lithuanian]"
	printf "  %-10s %-6s %-3s\n" "" "ms" "[Malaysian]"
	printf "  %-10s %-6s %-3s\n" "" "nl" "[Dutch - Netherlands]"
	printf "  %-10s %-6s %-3s\n" "" "nl-be" "[Dutch - Belgium]"
	printf "  %-10s %-6s %-3s\n" "" "no" "[Norwegian]"
	printf "  %-10s %-6s %-3s\n" "" "pl" "[Polish]"
	printf "  %-10s %-6s %-3s\n" "" "pt" "[Portuguese - Portugal]"
	printf "  %-10s %-6s %-3s\n" "" "pt-br" "[Portuguese - Brazil]"
	printf "  %-10s %-6s %-3s\n" "" "ro" "[Romanian]"
	printf "  %-10s %-6s %-3s\n" "" "ru" "[Russian]"
	printf "  %-10s %-6s %-3s\n" "" "sk" "[Slovak]"
	printf "  %-10s %-6s %-3s\n" "" "sl" "[Slovenian]"
	printf "  %-10s %-6s %-3s\n" "" "sv" "[Swedish]"
	printf "  %-10s %-6s %-3s\n" "" "ta" "[Tamil]"
	printf "  %-10s %-6s %-3s\n" "" "th" "[Thai]"
	printf "  %-10s %-6s %-3s\n" "" "tr" "[Turkish]"
	printf "  %-10s %-6s %-3s\n" "" "vi" "[Vietnamese]"
	printf "  %-10s %-6s %-3s\n" "" "zh-cn" "[Chinese - China]"
	printf "  %-10s %-6s %-3s\n" "" "zh-hk" "[Chinese - Hong Kong]"
	printf "  %-10s %-6s %-3s\n" "" "zh-tw" "[Chinese - Taiwan]"
	printf "\n"
	printf "  %-5s %-3s\n" "-m" "Convert math to mathspeak"
	printf "  %-5s %-3s\n" "" "Parameters:"
	printf "  %-10s %-6s\n" "" "None"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "Off"
	printf "\n"
	printf "  %-5s %-3s\n" "-n" "Name (speech synthesizer voice)"
	printf "  %-5s %-3s\n" "" "Parameters:"
	printf "  %-10s %-9s %-3s\n" "" "Naayf" "[Arabic-Saudi Arabia]"
	printf "  %-10s %-9s %-3s\n" "" "Hoda" "[Arabic-Egypt]"
	printf "  %-10s %-9s %-3s\n" "" "Ivan" "[Bulgarian]"
	printf "  %-10s %-9s %-3s\n" "" "Herena" "[Catalan]"
	printf "  %-10s %-9s %-3s\n" "" "Jakub" "[Czech]"
	printf "  %-10s %-9s %-3s\n" "" "Helle" "[Danish]"
	printf "  %-10s %-9s %-3s\n" "" "Hedda" "[German - Germany]"
	printf "  %-10s %-9s %-3s\n" "" "Michael" "[German- Austria]"
	printf "  %-10s %-9s %-3s\n" "" "Karsten" "[German - Switzerland]"
	printf "  %-10s %-9s %-3s\n" "" "Stefanos" "[Greek]"
	printf "  %-10s %-9s %-3s\n" "" "James" "[English - Australia]"
	printf "  %-10s %-9s %-3s\n" "" "Linda" "[English - Canada]"
	printf "  %-10s %-9s %-3s\n" "" "Hazel" "[English - Great Britain]"
	printf "  %-10s %-9s %-3s\n" "" "Ravi" "[English - India]"
	printf "  %-10s %-9s %-3s\n" "" "Sean" "[English - Ireland]"
	printf "  %-10s %-9s %-3s\n" "" "Allison" "[English - United States]"
	printf "  %-10s %-9s %-3s\n" "" "Ava" "[English - United States]"
	printf "  %-10s %-9s %-3s\n" "" "Mark" "[English - United States]"
	printf "  %-10s %-9s %-3s\n" "" "Samantha" "[English - United States]"
	printf "  %-10s %-9s %-3s\n" "" "Susan" "[English - United States]"
	printf "  %-10s %-9s %-3s\n" "" "Tom" "[English - United States]"
	printf "  %-10s %-9s %-3s\n" "" "Helena" "[Spanish - Spain]"
	printf "  %-10s %-9s %-3s\n" "" "Sabina" "[Spanish - Mexico]"
	printf "  %-10s %-9s %-3s\n" "" "Heidi" "[Finnish]"
	printf "  %-10s %-9s %-3s\n" "" "Hortense" "[French - France]"
	printf "  %-10s %-9s %-3s\n" "" "Claude" "[French - Canada]"
	printf "  %-10s %-9s %-3s\n" "" "Guillaume" "[French - Switzerland]"
	printf "  %-10s %-9s %-3s\n" "" "Asaf" "[Hebrew]"
	printf "  %-10s %-9s %-3s\n" "" "Hemant" "[Hindi]"
	printf "  %-10s %-9s %-3s\n" "" "Matej" "[Croatian]"
	printf "  %-10s %-9s %-3s\n" "" "Szabolcs" "[Hungarian]"
	printf "  %-10s %-9s %-3s\n" "" "Andika" "[Indonesian]"
	printf "  %-10s %-9s %-3s\n" "" "Elsa" "[Italian]"
	printf "  %-10s %-9s %-3s\n" "" "Haruka" "[Japanese]"
	printf "  %-10s %-9s %-3s\n" "" "Heami" "[Korean]"
	printf "  %-10s %-9s %-3s\n" "" "Rizwan" "[Malaysian]"
	printf "  %-10s %-9s %-3s\n" "" "Frank" "[Dutch - Netherlands]"
	printf "  %-10s %-9s %-3s\n" "" "Bart" "[Dutch - Belgium]"
	printf "  %-10s %-9s %-3s\n" "" "Jon" "[Norwegian]"
	printf "  %-10s %-9s %-3s\n" "" "Paulina" "[Polish]"
	printf "  %-10s %-9s %-3s\n" "" "Helia" "[Portuguese - Portugal]"
	printf "  %-10s %-9s %-3s\n" "" "Maria" "[Portuguese - Brazil]"
	printf "  %-10s %-9s %-3s\n" "" "Andrei" "[Romanian]"
	printf "  %-10s %-9s %-3s\n" "" "Irina" "[Russian]"
	printf "  %-10s %-9s %-3s\n" "" "Filip" "[Slovak]"
	printf "  %-10s %-9s %-3s\n" "" "Lado" "[Slovenian]"
	printf "  %-10s %-9s %-3s\n" "" "Bengt" "[Swedish]"
	printf "  %-10s %-9s %-3s\n" "" "Valluvar" "[Tamil]"
	printf "  %-10s %-9s %-3s\n" "" "Pattara" "[Thai]"
	printf "  %-10s %-9s %-3s\n" "" "Tolga" "[Turkish]"
	printf "  %-10s %-9s %-3s\n" "" "An" "[Vietnamese]"
	printf "  %-10s %-9s %-3s\n" "" "Huihui" "[Chinese - China]"
	printf "  %-10s %-9s %-3s\n" "" "Tracy" "[Chinese - Hong Kong]"
	printf "  %-10s %-9s %-3s\n" "" "Zhiwei" "[Chinese - Taiwan]"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "Ava"
	printf "\n"
	printf "  %-5s %-3s\n" "-p" "Publication (audio album)"
	printf "  %-5s %-3s\n" "" "Parameters:"
	printf "  %-10s %-8s\n" "" "Name of Book / Publication"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "DOCX Filename"
	printf "\n"
	printf "  %-5s %-3s\n" "-r" "Rearrange or remove line numbers (poetry)"
	printf "  %-5s %-3s\n" "" "Parameters:"
	printf "  %-10s %-8s\n" "" "remove"
	printf "  %-10s %-8s\n" "" "label"
	printf "  %-10s %-8s\n" "" "no-label"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "Off"
	printf "\n"
	printf "  %-5s %-3s\n" "-s" "Speed"
	printf "  %-5s %-3s\n" "" "Parameters:"
	printf "  %-10s %-6s\n" "" "50-200"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "100"
	printf "\n"
	printf "  %-5s %-3s\n" "-t" "Track"
	printf "  %-5s %-3s\n" "" "Parameters:"
	printf "  %-10s %-6s\n" "" "1-100"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "1"
	printf "\n"
	printf "  %-5s %-3s\n" "-w" "Check if Word is running"
	printf "  %-5s %-3s\n" "" "Parameters:"
	printf "  %-10s %-6s\n" "" "Off"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "On"
	printf "\n"
	printf "  %-5s %-3s\n" "-v" "Print script version"

return 0
}

function version (){
    printf "\nVersion 0.1.7\n"

return 0
}

while getopts :n:s:a:p:l:mc:et:hr:w:iv flag

do
    case "${flag}" in
		: ) echo -e "\nOption -"$OPTARG" requires an argument." >&2
            exit 1;;
        a) author=${OPTARG};;
		c) caption=${OPTARG};
		if [[ ! "$caption" == keep && ! "$caption" == off ]]; then 
        echo -e "\n\033[1;31mInvalid value entered for -c option (You must enter either keep or off. Exiting...\033[0m"
        exit 2
		fi
		;;
		e) error="${flag}";;
		i) insert="${flag}";;
		l) language+=("$OPTARG");;
        n) name=${OPTARG};
		if [[ ! "$name" == Allison && ! "$name" == An && ! "$name" == Andika && ! "$name" == Andrei && ! "$name" == Asaf && ! "$name" == Ava && ! "$name" == Bart && ! "$name" == Bengt && ! "$name" == Claude && ! "$name" == Elsa && ! "$name" == Filip && ! "$name" == Frank && ! "$name" == Guillaume && ! "$name" == Haruka && ! "$name" == Hazel && ! "$name" == Heami && ! "$name" == Hedda && ! "$name" == Heidi && ! "$name" == Helena && ! "$name" == Helia && ! "$name" == Helle && ! "$name" == Hemant && ! "$name" == Herena && ! "$name" == Hoda && ! "$name" == Hortense && ! "$name" == Huihui && ! "$name" == Irina && ! "$name" == Ivan && ! "$name" == Jakub && ! "$name" == James && ! "$name" == Jon && ! "$name" == Karsten && ! "$name" == Lado && ! "$name" == Linda && ! "$name" == Maria && ! "$name" == Mark && ! "$name" == Matej && ! "$name" == Michael && ! "$name" == Naayf && ! "$name" == Pattara && ! "$name" == Paulina && ! "$name" == Ravi && ! "$name" == Rizwan && ! "$name" == Sabina && ! "$name" == Samantha && ! "$name" == Sean && ! "$name" == Stefanos && ! "$name" == Susan && ! "$name" == Szabolcs && ! "$name" == Tolga && ! "$name" == Tom && ! "$name" == Tracy && ! "$name" == Valluvar && ! "$name" == Zhiwei && ! "$name" == Joey ]]; then 
        echo -e "\n\033[1;31mInvalid name entered for -n option (You must enter one of the following: Allison, An, Andika, Andrei, Asaf, Ava, Bart, Bengt, Claude, Elsa, Filip, Frank, Guillaume, Haruka, Hazel, Heami, Hedda, Heidi, Helena, Helia, Helle, Hemant, Herena, Hoda, Hortense, Huihui, Irina, Ivan, Jakub, James, Jon, Karsten, Lado, Linda, Maria, Mark, Matej, Michael, Naayf, Pattara, Paulina, Ravi, Rizwan, Sabina, Samantha, Sean, Stefanos, Susan, Szabolcs, Tolga, Tom, Tracy, Valluvar, or Zhiwei). Exiting...\033[0m"
        exit 2
        fi
        ;;
		p) publication=${OPTARG};;
        s) speed=${OPTARG};
		if ! [[ "$speed" =~ ^[0-9]+$ && "$speed" -gt 49 && "$speed" -lt 201 ]] ; then 
        echo -e "\n\033[1;31mInvalid value entered for -s option (You must enter a digit from 50-200). Exiting...\033[0m"
		exit 2
        fi
        ;;
        m) math="${flag}";;
        --) shift
            break;;
		r) remove=${OPTARG};
		if [[ ! "$remove" == remove && ! "$remove" == label && ! "$remove" == no-label ]]; then 
        echo -e "\n\033[1;31mInvalid value entered for -r option (You must enter either remove, label, or no-label. Exiting...\033[0m"
        exit 2
        fi
		;;
		t) track=${OPTARG};
		if ! [[ "$track" =~ ^[0-9]+$ && "$track" -ge 1 && "$track" -lt 100 ]] ; then 
        echo -e "\n\033[1;31mInvalid value entered for -t option (You must enter a digit from 1-100). Exiting...\033[0m"
		exit 2
        fi
		;;
		w) word=${OPTARG};
		if [[ ! "$word" == off ]]; then
        echo -e "\n\033[1;31mInvalid value entered for -w option (You must enter off). Exiting...\033[0m"
        exit 2
        fi
		;;
        v) version; exit 2;;
        h) usage; exit 2;;
        \?) echo -e "Invalid option\n";usage; exit 2;;
    esac

  done
  
  shift $[ $OPTIND - 1 ]
  
  echo
  
  count=1
  
  for param in "$@"
  
  do
  if  [ $count -ge 1 ]; then
  
  echo -e "\033[1;31mInvalid value:\033[0m $@.\033[1;31m Use a single word after the option or else use double quotes. E.g., After the -a option (for an author), use double quotes around the author's name (-a \"Mark Twain\"). Exiting...\033[0m"
  
  exit 2
  
  count=$[ $count + 1]  
  
  fi
  
  done
  
# Check if Balabolka is installed

if [ -n "$language" ]; then

if [ ! -f  "C:\balcon\balcon.exe" ]; then

echo -e "\n\033[1;31mError: balcon (MP3 program used for other languages) was not found. Download balcon.exe (http://www.cross-plus-a.com/bconsole.htm) and place it in the \033[1;35mC:\balcon\\033[0m directory. Exiting....\033[0m\n" >&2

exit 1

fi 

fi

# Check if language voices are installed

if [[ "$language" == "it" ]]; then 

if ! "C:\balcon\balcon.exe" -l 2> /dev/null | grep -q -w 'Elsa' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Elsa not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "fr" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q  -w 'Hortense' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Hortense not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "de" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Hedda' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Hedda not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "es" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Helena' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Helena not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "ja" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Haruka' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Haruka not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "en-us" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Mark' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Mark not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "en-gb" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Hazel' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Hazel not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "zh-cn" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Huihui' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Huihui not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "ru" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Irina' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Irina not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "pt-br" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Maria' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Maria not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "pl" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Paulina' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Paulina not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "es-mx" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Sabina' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Sabina not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "zh-hk" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Tracy' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Tracy not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "la" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'mb-la1' 2> /dev/null ; then

echo -e "\n\033[1;31mError: mbrola Latin voice not installed. Download mbrola voices on your PC (https://github.com/numediart/MBROLA-voices) and place them in the espeak data folder (C:\Program Files (x86)\eSpeak\espeak-data\mbrola). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "fa" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'mb-ir1' 2> /dev/null ; then

echo -e "\n\033[1;31mError: mbrola Farsi voice not installed. Download mbrola voices on your PC (https://github.com/numediart/MBROLA-voices) and place them in the espeak data folder (C:\Program Files (x86)\eSpeak\espeak-data\mbrola). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "af" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'mb-af1' 2> /dev/null ; then

echo -e "\n\033[1;31mError: mbrola Afrikaans voice not installed. Download mbrola voices on your PC (https://github.com/numediart/MBROLA-voices) and place them in the espeak data folder (C:\Program Files (x86)\eSpeak\espeak-data\mbrola). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "ar-sa" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Naayf' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Naayf not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "ar-eg" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Hoda' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Hoda not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "bg" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Ivan' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Ivan not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "ca" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Herena' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Herena not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "cs" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Jakub' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Jakub not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "da" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Helle' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Helle not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "de-at" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Michael' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Michael not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "de-ch" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Karsten' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Karsten not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "el" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Stefanos' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Stefanos not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "en-au" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'James' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft James not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "en-ca" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Linda' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Linda not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "en-in" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Ravi' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Ravi not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "en-ie" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Sean' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Sean not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "et" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'mb-ee1' 2> /dev/null ; then

echo -e "\n\033[1;31mError: mbrola Estonian voice not installed. Download mbrola voices on your PC (https://github.com/numediart/MBROLA-voices) and place them in the espeak data folder (C:\Program Files (x86)\eSpeak\espeak-data\mbrola). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "fi" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Heidi' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Heidi not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "fr-ca" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Claude' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Claude not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "fr-ch" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Guillaume' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Guillaume not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "he" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Asaf' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Asaf not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "hi" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Hemant' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Hemant not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "hr" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Matej' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Matej not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "id" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Andika' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Andika not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "hu" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Szabolcs' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Szabolcs not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "ko" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Heami' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Heami not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "la" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'mb-la1' 2> /dev/null ; then

echo -e "\n\033[1;31mError: mbrola Latin voice not installed. Download mbrola voices on your PC (https://github.com/numediart/MBROLA-voices) and place them in the espeak data folder (C:\Program Files (x86)\eSpeak\espeak-data\mbrola). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "lt" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'mb-lt1' 2> /dev/null ; then

echo -e "\n\033[1;31mError: mbrola Lithuanian voice not installed. Download mbrola voices on your PC (https://github.com/numediart/MBROLA-voices) and place them in the espeak data folder (C:\Program Files (x86)\eSpeak\espeak-data\mbrola). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "ms" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Rizwan' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Rizwan not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "nl" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Frank' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Frank not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "nl-be" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Bart' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Bart not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "no" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Jon' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Jon not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "pt" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Helia' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Helia not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "ro" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Andrei' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Andrei not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "sk" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Filip' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Filip not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "sl" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Lado' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Lado not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "sv" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Bengt' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Bengt not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "ta" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Valluvar' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Valluvar not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "th" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Pattara' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Pattara not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "tr" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Tolga' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Tolga not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "vi" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'An' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Valluvar not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi

if [[ "$language" == "zh-tw" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Zhiwei' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Zhiwei not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

exit 1

fi

fi
  
  # Sort multiple parameters for secondary languages

shift $((OPTIND -1))

count=1
for val in "${language[@]}"; do

			if [[ ! $val == af && ! $val == ar-sa && ! $val == ar-eg && ! $val == bg && ! $val == ca && ! $val == cs && ! $val == da && ! $val == de && ! $val == de-at && ! $val == de-ch && ! $val == el && ! $val == en-au && ! $val == en-ca && ! $val == en-gb && ! $val == en-in && ! $val == en-ie && ! $val == en-us && ! $val == es && ! $val == es-mx && ! $val == et && ! $val == fa && ! $val == fi && ! $val == fr && ! $val == fr-ca && ! $val == fr-ch && ! $val == he && ! $val == hi && ! $val == hr && ! $val == hu && ! $val == id && ! $val == it && ! $val == ja && ! $val == ko && ! $val == la && ! $val == lt && ! $val == ms && ! $val == nl && ! $val == nl-be && ! $val == no && ! $val == pl && ! $val == pt && ! $val == pt-br && ! $val == ro && ! $val == ru && ! $val == sk && ! $val == sl && ! $val == sv && ! $val == ta && ! $val == th && ! $val == tr && ! $val == vi && ! $val == zh-cn && ! $val == zh-hk && ! $val == zh-tw ]]; then
            echo -e "\033[1;31mInvalid ISO value entered with -l option:\033[0m "$val" \033[1;31m(Value must be one of the following: af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw ). Exiting...\033[0m"
            exit 2
            else
            eval language$count=$val
            shift
            fi
            count=$[ $count +1 ]
done

shift $((OPTIND -1))

count=1
for val in "${language[@]}"; do

if [ "$val" == "la" ] ; then

eval secondlanguage$count="Latin"

shift

fi

if [ "$val" == "grc" ] ; then

eval secondlanguage$count="Ancient-Greek"

shift

fi

if [ "$val" == "el" ] ; then

eval secondlanguage$count="Greek"

shift

fi

if [ "$val" == "it" ] ; then

eval secondlanguage$count="Italian"

shift

fi

if [ "$val" == "af" ] ; then

eval secondlanguage$count="Afrikaans"

shift

fi

if [ "$val" == "ar-sa" ] ; then

eval secondlanguage$count="Arabic\ -\ Saudi\ Arabia"

shift

fi

if [ "$val" == "ar-eg" ] ; then

eval secondlanguage$count="Arabic\ -\ Egypt"

shift

fi

if [ "$val" == "ms" ] ; then

eval secondlanguage$count="Malaysian"

shift

fi

if [ "$val" == "bg" ] ; then

eval secondlanguage$count="Bulgarian"

shift

fi

if [ "$val" == "ca" ] ; then

eval secondlanguage$count="Catalan"

shift

fi

if [ "$val" == "cs" ] ; then

eval secondlanguage$count="Czech"

shift

fi

if [ "$val" == "da" ] ; then

eval secondlanguage$count="Danish"

shift

fi

if [ "$val" == "de" ] ; then

eval secondlanguage$count="German\ -\ Germany"

shift

fi

if [ "$val" == "de-at" ] ; then

eval secondlanguage$count="German\ -\ Austria"

shift

fi

if [ "$val" == "de-ch" ] ; then

eval secondlanguage$count="German\ -\ Switzerland"

shift

fi

if [ "$val" == "en-au" ] ; then

eval secondlanguage$count="English\ -\ Australia"

shift

fi

if [ "$val" == "en-ca" ] ; then

eval secondlanguage$count="English\ -\ Canada"

shift

fi

if [ "$val" == "en-gb" ] ; then

eval secondlanguage$count="English\ -\ Great Britain"

shift

fi

if [ "$val" == "en-in" ] ; then

eval secondlanguage$count="English\ -\ India"

shift

fi

if [ "$val" == "en-ie" ] ; then

eval secondlanguage$count="English\ -\ Ireland"

shift

fi

if [ "$val" == "en-us" ] ; then

eval secondlanguage$count="English\ -\ United States"

shift

fi

if [ "$val" == "es" ] ; then

eval secondlanguage$count="Spanish\ -\ Spain"

shift

fi

if [ "$val" == "es-mx" ] ; then

eval secondlanguage$count="Spanish\ -\ Mexico"

shift

fi

if [ "$val" == "et" ] ; then

eval secondlanguage$count="Estonian"

shift

fi

if [ "$val" == "fa" ] ; then

eval secondlanguage$count="Farsi"

shift

fi

if [ "$val" == "fi" ] ; then

eval secondlanguage$count="Finnish"

shift

fi

if [ "$val" == "fr" ] ; then

eval secondlanguage$count="French\ -\ France"

shift

fi

if [ "$val" == "fr-ca" ] ; then

eval secondlanguage$count="French\ -\ Canada"

shift

fi

if [ "$val" == "fr-ch" ] ; then

eval secondlanguage$count="French\ -\ Switzerland"

shift

fi

if [ "$val" == "he" ] ; then

eval secondlanguage$count="Hebrew"

shift

fi

if [ "$val" == "hi" ] ; then

eval secondlanguage$count="Hindi"

shift

fi

if [ "$val" == "hr" ] ; then

eval secondlanguage$count="Croatian"

shift

fi

if [ "$val" == "hu" ] ; then

eval secondlanguage$count="Hungarian"

shift

fi

if [ "$val" == "id" ] ; then

eval secondlanguage$count="Indonesian"

shift

fi

if [ "$val" == "ja" ] ; then

eval secondlanguage$count="Japanese"

shift

fi

if [ "$val" == "ko" ] ; then

eval secondlanguage$count="Korean"

shift

fi

if [ "$val" == "lt" ] ; then

eval secondlanguage$count="Lithuanian"

shift

fi

if [ "$val" == "nl" ] ; then

eval secondlanguage$count="Dutch\ -\ Netherlands"

shift

fi

if [ "$val" == "nl-be" ] ; then

eval secondlanguage$count="Dutch\ -\ Beligum"

shift

fi

if [ "$val" == "no" ] ; then

eval secondlanguage$count="Norwegian"

shift

fi

if [ "$val" == "pl" ] ; then

eval secondlanguage$count="Polish"

shift

fi

if [ "$val" == "pt" ] ; then

eval secondlanguage$count="Portuguese\ -\ Portugal"

shift

fi

if [ "$val" == "pt-br" ] ; then

eval secondlanguage$count="Portuguese\ -\ Brazil"

shift

fi

if [ "$val" == "ro" ] ; then

eval secondlanguage$count="Romanian"

shift

fi

if [ "$val" == "ru" ] ; then

eval secondlanguage$count="Russian"

shift

fi

if [ "$val" == "sk" ] ; then

eval secondlanguage$count="Slovak"

shift

fi

if [ "$val" == "sl" ] ; then

eval secondlanguage$count="Slovenian"

shift

fi

if [ "$val" == "sv" ] ; then

eval secondlanguage$count="Swedish"

shift

fi

if [ "$val" == "ta" ] ; then

eval secondlanguage$count="Tamil"

shift

fi

if [ "$val" == "th" ] ; then

eval secondlanguage$count="Thai"

shift

fi

if [ "$val" == "tr" ] ; then

eval secondlanguage$count="Turkish"

shift

fi

if [ "$val" == "vi" ] ; then

eval secondlanguage$count="Vietnamese"

shift

fi

if [ "$val" == "zh-cn" ] ; then

eval secondlanguage$count="Chinese\ -\ China"

shift

fi

if [ "$val" == "zh-hk" ] ; then

eval secondlanguage$count="Chinese\ -\ Hong\ Kong"

shift

fi

if [ "$val" == "zh-tw" ] ; then

eval secondlanguage$count="Chinese\ -\ Taiwan"

shift

fi

if [ "$val" == "grc" ] ; then

eval secondlanguage$count="Ancient\ Greek"

shift

fi

count=$[ $count +1 ]

done

  # Make Ava the default voice variable when the -n option is not used

        if [[ "$name" == "" ]]; then 
		
		if [ ! -f  "C:\Program Files (x86)\Linguatec\VoiceReaderStudio15\vrs15cmd.exe" ]; then
		
		name="Microsoft David Desktop"
		
		else
		
        name=Ava  
		 
		fi

        fi
		
    if [[ "$speed" == "" ]]; then
	
	speed="100"
	bspeed="-0"
	
	fi
	
	if [[ "$speed" -ge 50 && "$speed" -le 56 ]] ; then 
	
	bspeed="-6"
	
	fi	
	
	if [[ "$speed" -ge 57 && "$speed" -le 63 ]] ; then 
	
	bspeed="-5"
	
	fi	
	
	if [[ "$speed" -ge 64 && "$speed" -le 70 ]] ; then 
	
	bspeed="-4"

	fi	
	
	if [[ "$speed" -ge 71 && "$speed" -le 78 ]] ; then 
	
	bspeed="-3"
	
	fi	
	
	if [[ "$speed" -ge 79 && "$speed" -le 85 ]] ; then 
	
	bspeed="-2"

	fi	
	
	if [[ "$speed" -ge 86 && "$speed" -lt 92 ]] ; then 
	
	bspeed="-1"
	
	fi
	
	if [[ "$speed" -ge 93 && "$speed" -le 110 ]] ; then 
	
	bspeed="-0"
	
	fi	
	
	if [[ "$speed" -ge 111 && "$speed" -le 128 ]] ; then 
	
	bspeed="1"
	
	fi
	
	if [[ "$speed" -ge 129 && "$speed" -le 146 ]] ; then 
	
	bspeed="2"
	
	fi
	
	if [[ "$speed" -ge 147 && "$speed" -le 164 ]] ; then 
	
	bspeed="3"
	
	fi

	if [[ "$speed" -ge 165 && "$speed" -le 182 ]] ; then 
	
	bspeed="4"
	
	fi
	
	if [[ "$speed" -ge 183 && "$speed" -le 200 ]] ; then 
	
	bspeed="5"
	
	fi
	
	if [[ "$name" == "Microsoft David Desktop" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q  -w 'David' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Balcon.exe not installed. Exiting...\033[0m" >&2

	exit 1

	fi
	
	fullname="David (English - American)"

	fi
		
	if [[ "$name" == "Elsa" ]]; then 

	if ! "C:\balcon\balcon.exe" -l 2> /dev/null | grep -q -w 'Elsa' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Elsa not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Elsa Desktop"
	fullname="Elsa (Italian)"

	fi

	if [[ "$name" == "Hortense" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q  -w 'Hortense' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Hortense not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Hortense Desktop"
	fullname="Hortense (French - France)"

	fi

	if [[ "$name" == "Hedda" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Hedda' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Hedda not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Hedda Desktop"
	fullname="Hedda (German - Germany)"

	fi

	if [[ "$name" == "Helena" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Helena' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Helena not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Helena Desktop"
	fullname="Helena (Spanish - Spain)"

	fi

	if [[ "$name" == "Haruka" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Haruka' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Haruka not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Haruka Desktop"
	fullname="Haruka (Japanese)"

	fi

	if [[ "$name" == "Mark" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Mark' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Mark not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Mark"
	
	fullname="Mark (English - American)"

	fi

	if [[ "$name" == "Hazel" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Hazel' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Hazel not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Hazel Desktop"
	
	fullname="Hazel (English - British)"

	fi

	if [[ "$name" == "Huihui" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Huihui' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Huihui not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Huihui Desktop"
	
	fullname="Huihui (Chinese - China)"
	
	fi

	if [[ "$name" == "Irina" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Irina' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Irina not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Irina Desktop"
	fullname="Irina (Russian)"

	fi

	if [[ "$name" == "Maria" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Maria' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Maria not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Maria Desktop"
	fullname="Maria (Portuguese - Brazil)"

	fi

	if [[ "$name" == "pl" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Paulina' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Paulina not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Paulina Desktop"
	fullname="Paulina (Polish)"

	fi

	if [[ "$name" == "Sabina" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Sabina' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Sabina not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Sabina Desktop"
	fullname="Sabina (Spanish - Mexico)"

	fi

	if [[ "$name" == "Tracy" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Tracy' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Tracy not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Tracy Desktop"
	fullname="Tracy (Chinese - Hong Kong)"

	fi

	if [[ "$name" == "Naayf" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Naayf' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Naayf not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Naayf"
	fullname="Naayf (Arabic - Saudi Arabia)"

	fi

	if [[ "$name" == "Hoda" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Hoda' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Hoda not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Hoda"
	fullname="Hoda (Arabic - Egypt)"

	fi

	if [[ "$name" == "Ivan" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Ivan' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Ivan not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Ivan"
	fullname="Ivan (Bulgarian)"

	fi

	if [[ "$name" == "Herena" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Herena' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Herena not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Herena"
	fullname="Herena (Catalan)"

	fi

	if [[ "$name" == "Jakub" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Jakub' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Jakub not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Jakub"
	fullname="Jakub (Czech)"

	fi

	if [[ "$name" == "Helle" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Helle' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Helle not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Helle"
	fullname="Helle (Danish)"

	fi

	if [[ "$name" == "Michael" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Michael' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Michael not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Michael"
	fullname="Michael (German - Austria)"

	fi

	if [[ "$name" == "Karsten" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Karsten' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Karsten not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Karsten"
	fullname="Karsten (German - Switzerland)"

	fi

	if [[ "$name" == "Stefanos" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Stefanos' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Stefanos not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Stefanos"
	fullname="Stefanos (Greek)"

	fi

	if [[ "$name" == "James" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'James' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft James not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft James"
	fullname="James (English - Australia)"

	fi

	if [[ "$name" == "Linda" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Linda' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Linda not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Linda"
	fullname="Linda (English - Canada)"

	fi

	if [[ "$name" == "Ravi" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Ravi' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Ravi not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Ravi"
	fullname="Ravi (English - India)"

	fi

	if [[ "$name" == "Sean" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Sean' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Sean not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Sean"
	fullname="Sean (English - Ireland)"

	fi

	if [[ "$name" == "Heidi" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Heidi' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Heidi not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Heidi"
	fullname="Heidi (Finnish)"

	fi

	if [[ "$name" == "Claude" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Claude' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Claude not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Claude"
	fullname="Claude (French - Canada)"

	fi

	if [[ "$name" == "Guillaume" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Guillaume' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Guillaume not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Guillaume"
	fullname="Guillaume (French - Switzerland)"

	fi

	if [[ "$name" == "Asaf" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Asaf' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Asaf not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Asaf"
	fullname="Asaf (Hebrew)"

	fi

	if [[ "$name" == "Hemant" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Hemant' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Hemant not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Hemant"
	fullname="Hemant (Hindi)"

	fi

	if [[ "$name" == "Matej" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Matej' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Matej not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Matej"
	fullname="Matej (Croatian)"

	fi

	if [[ "$name" == "Andika" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Andika' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Andika not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Andika"
	fullname="Andika (Indonesian)"

	fi

	if [[ "$name" == "Szabolcs" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Szabolcs' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Szabolcs not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Szabolcs"
	fullname="Szabolcs (Hungarian)"

	fi

	if [[ "$name" == "Heami" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Heami' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Heami not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Heami"
	fullname="Heami (Korean)"

	fi

	if [[ "$name" == "Rizwan" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Rizwan' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Rizwan not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Rizwan"
	fullname="Rizwan (Malaysian)"

	fi

	if [[ "$name" == "Frank" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Frank' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Frank not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Frank"
	fullname="Frank (Dutch - Netherlands)"

	fi

	if [[ "$name" == "Bart" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Bart' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Bart not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Bart"
	fullname="Bart (Dutch - Belgium)"

	fi

	if [[ "$name" == "Jon" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Jon' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Jon not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Jon"
	fullname="Jon (Norwegian)"

	fi

	if [[ "$name" == "Helia" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Helia' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Helia not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Helia"
	fullname="Helia (Portuguese - Portugal)"

	fi

	if [[ "$name" == "Andrei" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Andrei' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Andrei not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Andrei"
	fullname="Andrei (Romanian)"

	fi

	if [[ "$name" == "Filip" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Filip' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Filip not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Filip"
	fullname="Filip (Slovak)"

	fi

	if [[ "$name" == "Lado" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Lado' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Lado not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Lado"
	fullname="Lado (Slovenian)"

	fi

	if [[ "$name" == "Bengt" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Bengt' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Bengt not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Bengt"
	fullname="Bengt (Swedish)"

	fi

	if [[ "$name" == "Valluvar" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Valluvar' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Valluvar not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Valluvar"
	fullname="Valluvar (Tamil)"

	fi

	if [[ "$name" == "Pattara" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Pattara' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Pattara not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Pattara"
	fullname="Pattara (Thai)"

	fi

	if [[ "$name" == "Tolga" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Tolga' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Tolga not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Tolga"
	fullname="Tolga (Turkish)"

	fi

	if [[ "$name" == "An" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'An' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Valluvar not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft An"
	fullname="An (Vietnamese)"

	fi

	if [[ "$name" == "Zhiwei" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Zhiwei' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Zhiwei not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Zhiwei"
	fullname="Zhiwei (Chinese - Taiwan)"

	fi
		
# Make Ivona 2 Joey  the voice variable when Joey is selected for the -n option

        if [[ "$name" == "Joey" ]]; then 
		
		if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Joey' 2> /dev/null ; then

		echo -e "\033[1;31mError: Joey not installed. Go to the HARPO website to install additional SAPI 5 voices on your PC (https://harposoftware.com/en/). Exiting...\033[0m" >&2

		exit 1

		fi
		
        name="IVONA 2 Joey"
		fullname="Joey (English - American)"
        
		fi
		
# Turn on Language Switch if language dependencies are met

	if [ -n "$language" ]; then
	language=on
	fi
		
# Make UCB Alternative Media Department the default author variable when the -a option is not used

        if [[ "$author" == "" ]]; then 
         author="UC Berkeley Alternative Media Department"        
        fi
		
# Make 100 the default speed variable when the -s option is not used

        if [[ "$speed" == "" ]]; then 
         speed=100        
        fi

# Make 1 the default track variable when the -t option is not used

        if [[ "$track" == "" ]]; then 
         track=1        
        fi			
		
# Check if Pandoc is installed; if not, exit the script.

if ! [ -x "$(command -v pandoc)" ]; then

echo -e "\n\033[1;31mError: Pandoc (https://pandoc.org/installing.html)is not installed. Exiting...\033[0m" >&2

exit 1

fi

# Check if Voice Reader Studio is installed; if not, exit the script.

if [[ "$name" == @(Ava|Tom|Allison|Samantha|Susan) ]]; then

if [ ! -f  "C:\Program Files (x86)\Linguatec\VoiceReaderStudio15\vrs15cmd.exe" ]; then

echo -e "\n\033[1;31mError: Voice Reader Studio 15 was not found. Install Install Voice Reader (https://www.linguatec.de/en/shop-tts/) and make sure it is in your \033[1;35mC:\Program Files (x86)\\033[0m directory. Exiting....\033[0m\n" >&2

exit 1

fi

fi

if [ "$name" == Ava ]; then

fullname="Ava (English - American)"

fi

if [ "$name" == Tom ]; then

fullname="Tom (English - American)"

fi

if [ "$name" == Allison ]; then

fullname="Allison (English - American)"

fi

if [ "$name" == Samantha ]; then

fullname="Samantha (English - American)"

fi

if [ "$name" == Susan ]; then

fullname="Susan (English - American)"

fi

if [ "$caption" == "" ]; then

caption="on"

fi

if [ "$caption" == "keep" ]; then

caption="on"
keep=on

fi

# Check if Python is installed

if [ "$caption" == "on" ];

then
if  ! command -v python >/dev/null  2>&1; then 
echo -e "\n\033[1;31mError: Python was not found, which is required for running Aeneas, the syncmap aligner for creating the caption file. Use the Aeneas installer (https://github.com/sillsdev/aeneas-installer/releases) to install Python. Will not create MP3 bookmarks or a caption file....\033[0m" >&2
caption="off"
fi
fi

# Check if Aeneas is installed (within Python scripts folder 3.7.4)

if [ "$caption" == "on" ];

then
if [ ! -f  "C:\Python37-32\Scripts\aeneas_execute_task.py" ]; then 
echo -e "\n\033[1;31mError: Aeneas module was not found in Python (37-32) folder. Make sure Aeneas is installed (https://github.com/sillsdev/aeneas-installer/releases) and the Python scripts folder is in your path. Will not create MP3 bookmarks or a caption file....\033[0m" >&2
caption="off"
fi
fi

if [ "$caption" == "on" ];

then
if [ ! -f  "/c/scripts/sentence-boundary-original.pl" ]; then 
echo -e "\n\033[1;31mCould not locate \033[1;35msentence-boundary-original.pl.\033[0m\033[1;31m Place \033[1;35msentence-boundary-original.pl\033[0m\033[1;31m in \033[0m\033[1;44m~/scripts/\033[0m\033[1;31m and run the script again. Will not create MP3 bookmarks or a caption file....\033[0m" >&2
caption="off"
fi
fi

if [ "$caption" == "on" ];

then
if [ ! -f  "/c/scripts/HONORIFICS" ]; then 
echo -e "\n\033[1;31mCould not locate \033[1;35mHONORIFICS.\033[0m\033[1;31m Place \033[1;35mHONORIFICS\033[0m\033[1;31m in \033[0m\033[1;44m~/scripts/\033[0m\033[1;31m and run the script again. Will not create MP3 bookmarks or a caption file....\033[0m" >&2
caption="off"
fi
fi

if [ "$caption" == "on" ];

then
if ! [ -x "$(command -v mp3chaps)" ]; then
echo -e "\n\033[1;31mCould not locate \033[1;35mMP3chaps.\033[0m\033[1;31m Install \033[1;35mMP3chaps\033[0m\033[1;31m (https://github.com/dskrad/mp3chaps) and run the script again. Will not create MP3 bookmarks or a caption file....\033[0m" >&2
caption="off"
fi
fi

if [ "$caption" == "on" ];

then
if ! [ -x "$(command -v espeak)" ]; then
echo -e "\n\033[1;31mCould not locate \033[1;35mEspeak.\033[0m\033[1;31m Install \033[1;35mEspeak\033[0m\033[1;31m (M:\Alt Media\03 Tools\Espeak\) and run the script again. Will not create MP3 bookmarks or a caption file....\033[0m" >&2
caption="off"
fi
fi

if [ "$caption" == "on" ];

then
mp3_bookmarks="MP3 Bookmarks"
fi


# Check if Node is installed

if [ -n "$math" ]; then
if  ! command -v node >/dev/null  2>&1; then 
echo -e "\n\033[1;31mError: Node was not found, which is required for converting math equations to math speech. Install node (https://nodejs.org/en/download/). Exiting....\033[0m" >&2
exit 1
fi
fi

# Check if Tex2SVG is installed

if [ -n "$math" ]; then
if  ! command -v tex2svg >/dev/null  2>&1; then 
echo -e "\n\033[1;31mError: tex2svg was not found, which is required for converting math equations to math speech. Install tex2svg at the MathJax Github site (https://github.com/mathjax/mathjax-node-cli) and make sure that tex2svg is available from your path. Exiting....\033[0m" >&2
exit 1
fi
fi

# Turn on Math Switch if math dependencies are met

if [ -n "$math" ]; then
math=on
fi

# Check if Lame is installed

if  ! command -v lame >/dev/null  2>&1; then 
echo -e "\n\033[1;31mError: Lame was not found, which is required for adding the cover image to the MP3. Install Lame (https://manual.audacityteam.org/man/glossary.html#lame) and make sure that it is available in your path. Exiting....\033[0m" >&2
exit 1
fi

# Check if id3 is installed

if  ! command -v id3 >/dev/null  2>&1; then 
echo -e "\n\033[1;31mError: id3 was not found, which is required for adding properties to the MP3. Install id3 (https://squell.github.io/id3/#getting-it ; Pre-built binaries under Windows) and make sure that it is available in your path. Exiting....\033[0m" >&2
exit 1
fi

# Check if Ffmpeg is installed

if  ! command -v ffmpeg >/dev/null  2>&1; then 
echo -e "\n\033[1;31mError: Ffmpeg was not found, which is required for identifying the length of the MP3. Install FFMPEG (https://ffmpeg.org/download.html#build-windows ; Windows builds) and make sure that it is available in your path. Exiting....\033[0m" >&2
exit 1
fi

 # Remove _MP3 from the name of the DOCX files in current working directory if MS Word is closed (requires tasklist)	

if [[ "$word" == "" ]]; then

if [ -f /c/scripts/tasklist.exe ]; then 
			
word="on"

else 

echo -e "\n\033[1;33mATTENTION:\033[0mTasklist.exe not found. Please make sure the DOCX file(s) you are converting is closed before proceeding.\n" >&2

find . -type f -name "~*.docx" -exec rm -f {} \;

read -n1 -s -r -p $'Press space to continue...\r' key

if [ ! "$key" = ' ' ]; then

echo -e "Press space to continue.\n"

fi

fi

fi
 
if [[  "$word" == "on" ]]; then

if /c/scripts/tasklist.exe //FI "IMAGENAME eq WINWORD.EXE" 2> /dev/null | grep -q "WINWORD.EXE" 2> /dev/null ; then

echo -e "\033[1;33mATTENTION:\033[0m MS Word is running. Please make sure the DOCX file(s) you are converting is closed before proceeding.\n"

find . -type f -name "~*.docx" -exec rm -f {} \;

read -n1 -s -r -p $'Press space to continue...\r' key

if [ ! "$key" = ' ' ]; then

    echo -e "Press space to continue.\n"

fi

fi
 
if ! /c/scripts/tasklist.exe //FI "IMAGENAME eq WINWORD.EXE" 2> /dev/null | grep -q "WINWORD.EXE" 2> /dev/null ; then

for z in ./*.docx; do

if [ -n "$(find . -maxdepth 1 -name '*.docx' -type f -print -quit)" ]; then

mv "$z" "`echo $z | sed 's/_MP3//'`"

fi

done

fi 
 
fi

if [ -f ./tmp ] ; then

rm ./tmp

fi

if [ -f ./~ ] ; then

rm ./~

fi

if [ ! -n "$(find . -maxdepth 1 -name '*.docx' -type f -print -quit)" ]; then

echo -e "\033[1;31mDOCX files are not located in this directory. Exiting...\033[0m"

exit

fi

for x in ./*.docx; do

        basePath=${x%.*}
        baseName=${basePath##*/}
        export baseName
        TIMESTAMP=`date "+%m-%d-%Y %H:%M"`
        IFS_OLD=$IFS

# Make the name of the document the default publication variable when the -p option is not used

        if [[ "$publication" == "" ]]; then 
         publication="$baseName"        
        fi

		### 1.4.4
		features=""
		math_equations=""
		secondary_text=""
		extended_descriptions=""
		footnotes=""
		footnote_text_regions="" 
		math_text=""
		footnote="" 
		figcaption=""
		description=""
		secondary=""
		footnote_text=""
		table=""
		textbook=""
		novel=""
		split=""
		###
		
# Create Directories

if [ ! -d ./"${x%.*}" ]; then

mkdir "${x%.*}"

else

find "${x%.*}" -type f -name "*.txt" -exec rm -f {} \;

find "${x%.*}" -type f -name "*.vtt" -exec rm -f {} \;

find "${x%.*}" -type f -name "*.mp3" -exec rm -f {} \;

find "${x%.*}" -type f -name "*.wav" -exec rm -f {} \;

fi
  
if [ ! -d ./Converted-DOCX-MP3 ]; then

mkdir Converted-DOCX-MP3

fi

rm ./~*.docx 2> /dev/null 

# Convert DOCX to TXT file and perform 

	pandoc "$x" -o ./"$baseName"/"$baseName".txt 2> /dev/null
	
# Add the Byte Order Mark (BOM) to support languages with unrepresented characters
	
	sed -i '1s/^\(\xef\xbb\xbf\)\?/\xef\xbb\xbf/' ./"$baseName"/"$baseName".txt

# Save a copy of the original
	
if [ -n "$error" ];
		
then
		
cp ./"$baseName"/"$baseName".txt ./"$baseName"/"$baseName"_original.txt
		
fi

# Remove markdown syntax (non-plain) from TXT
# Headings

perl -0777 -pi -e 's/\n(===.*)(\n)/<\/heading1>\n/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/\n(----.*)(\n)/<\/heading2>\n/g' ./"$baseName"/"$baseName".txt

sed -i 's/\(.*\)\(<\/heading1>\)/<heading1>\1\2/g' ./"$baseName"/"$baseName".txt

sed -i 's/\(.*\)\(<\/heading2>\)/<heading2>\1\2/g' ./"$baseName"/"$baseName".txt

# remove first unordered list items

perl -0777 -pi -e 's/(\n)(-   )(.*\n)/$3\n/g' ./"$baseName"/"$baseName".txt

# remove subsequent unordered list items

perl -0777 -pi -e 's/(\n)(.*)(-   )(.*\n)/$4\n/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/###### //g' ./"$baseName"/"$baseName".txt

# perl -0777 -pi -e 's/(\n)(##### )/$1/g' ./"$baseName"/"$baseName".txt
perl -0777 -pi -e 's/(\n)(#### )/$1<heading5>/g' ./"$baseName"/"$baseName".txt
sed -i 's/\(<heading5>\)\(.*\)/\1\2<\/heading5>/g' ./"$baseName"/"$baseName".txt

# perl -0777 -pi -e 's/(\n)(#### )/$1/g' ./"$baseName"/"$baseName".txt
perl -0777 -pi -e 's/(\n)(#### )/$1<heading4>/g' ./"$baseName"/"$baseName".txt
sed -i 's/\(<heading4>\)\(.*\)/\1\2<\/heading4>/g' ./"$baseName"/"$baseName".txt

# perl -0777 -pi -e 's/(\n)(### )/$1/g' ./"$baseName"/"$baseName".txt
perl -0777 -pi -e 's/(\n)(### )/$1<heading3>/g' ./"$baseName"/"$baseName".txt
sed -i 's/\(<heading3>\)\(.*\)/\1\2<\/heading3>/g' ./"$baseName"/"$baseName".txt

if [[ "$caption" == "on" ]]; 

# Extract headings
		
then

	grep -e 'heading' ./"$baseName"/"$baseName".txt > ./"$baseName"/headings.txt

	sed -i 's/<heading[1-5]>/@@ /g' ./"$baseName"/headings.txt

	sed -i 's/<\/heading[1-5]>//g' ./"$baseName"/headings.txt

	perl -pi -e 's/\^\d+\^//g' ./"$baseName"/headings.txt
	perl -pi -e 's/(\[\^)(\d+)(\])(:)/$2$4/g' ./"$baseName"/headings.txt
	perl -pi -e 's/(\[\^)(\d+)(\])//g' ./"$baseName"/headings.txt
	sed -i -E 's|\^([^\^]?*)\^||g' ./"$baseName"/headings.txt
	
	# New
	
	sed -i ':a;$!{N;/\n@@/!{s/\n/ /;ba}};P;D' ./"$baseName"/headings.txt
	
	#

fi

perl -0777 -pi -e 's/(\n)(## )/$1/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(\n)(# )/$1/g' ./"$baseName"/"$baseName".txt

sed -i 's/```{=html}//g' ./"$baseName"/"$baseName".txt

sed -i 's/<!-- -->//g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(\n)(```)(\n)/$1/g' ./"$baseName"/"$baseName".txt	

perl -0777 -pi -e 's/(\n)(> )/$1/g' ./"$baseName"/"$baseName".txt

# Remove ~ symbol (for underscores)

sed -i -E 's|~([^~]*)~| \1 |g' ./"$baseName"/"$baseName".txt

# Replace abbreviations with whole words

# Correct c. for circa	
	sed -i 's/(ca\. /(circa /g' ./"$baseName"/"$baseName".txt
	
	# Correct i.e. for circa	
	sed -i 's/(i\.e\. /(That is /g' ./"$baseName"/"$baseName".txt
	
		# Correct i.e. for circa	
	sed -i 's/(i\. e\. /(That is /g' ./"$baseName"/"$baseName".txt

		# Correct i.e. for circa	
	sed -i 's/(e\.g\. /(For example /g' ./"$baseName"/"$baseName".txt
	
			# Correct i.e. for circa	
	sed -i 's/(e\. g\. /(For example /g' ./"$baseName"/"$baseName".txt
	
	# Correct cf. for confer
	sed -i 's/(cf\. /(confer /g' ./"$baseName"/"$baseName".txt
	
		sed -i 's/(vv\. /(verses /g' ./"$baseName"/"$baseName".txt
		
# Add XML tags for secondary text regions if present

sed -i 's/Secondary Text Begin:/<secondary>/g' ./"$baseName"/"$baseName".txt

sed -i 's/Secondary Text End./<\/secondary>/g' ./"$baseName"/"$baseName".txt

# Add XML tags for footnote text regions if present

sed -i 's/Footnote Begin:/<footnote>/g' ./"$baseName"/"$baseName".txt

sed -i 's/Footnote End./<\/footnote>/g' ./"$baseName"/"$baseName".txt

# Add XML tags for figcaption text regions if present

sed -i 's/Figcaption Begin:/<figcaption>/g' ./"$baseName"/"$baseName".txt

sed -i 's/Figcaption End./<\/figcaption>/g' ./"$baseName"/"$baseName".txt

# Add XML tags for Description text regions if present

sed -i 's/Description Begin:/<description>/g' ./"$baseName"/"$baseName".txt

sed -i 's/Description End./<\/description>/g' ./"$baseName"/"$baseName".txt

# Add XML tags for Description text regions if present

sed -i 's/Caption Begin:/<table>/g' ./"$baseName"/"$baseName".txt

sed -i 's/Caption End./<\/table>/g' ./"$baseName"/"$baseName".txt

# Ask to remove Footnote Regions (but retain the numbers if the regions are retained)

if grep -q '<footnote>' ./"$baseName"/"$baseName".txt ; then

while true; do

echo -e "\033[1;33mATTENTION:\033[0m It looks like there are footnote text areas in \033[1;35m"$baseName".docx\033[0m.\n"

read -n1 -p "Do you wish to keep the footnote areas [Y/N]?" answer
case $answer in
Y | y) 
       echo -e "\n"
	   echo -e "Footnote text areas retained in \033[1;35m"$baseName".docx\033[0m.\n"
	   footnote_text="yes"
	   footnote_text_regions="Footnote Text Regions"
	   perl -0777 -pi -e 's/(\n)(\^)(\d+)(\^)/\n$3. /g' ./"$baseName"/"$baseName".txt
	   sed -i 's/<footnote>/<footnote>Footnote Region/g' ./"$baseName"/"$baseName".txt
	   break
	   ;;
N | n) 
		echo -e "\n"
		perl -0777 -pi -e 's/\h*<footnote>[^<]*<\/footnote>//g' ./"$baseName"/"$baseName".txt
		footnote_text="no"
		footnote_text_regions="Footnote Text Regions - removed"
		echo -e "Footnote text areas removed from \033[1;35m"$baseName".docx\033[0m.\n" 
		break
		;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n ].\033[0m\n"
	   break
       ;;
	   
     
esac

done

fi

	if [[ "$footnote_text" == "" ]]; then 
         footnote_text="no"        
    fi


# Remove foonotes (^)

if grep -E -o -q '\^[0-9]{1,16}\^|[\^[0-9]{1,16}]' ./"$baseName"/"$baseName".txt ; then

while true; do

echo -e "\033[1;33mATTENTION:\033[0m It looks like there are footnotes in \033[1;35m"$baseName".docx\033[0m.\n"

read -n1 -p "Do you wish to keep the foonotes [Y/N]?" answer
case $answer in
Y | y) 
       echo -e "\n"
	   perl -pi -e 's/(\^)(\d+)(\^)/<footnote_ref>$2<\/footnote_ref>/g' ./"$baseName"/"$baseName".txt
	   perl -pi -e 's/(\[\^)(\d+)(\])/<footnote_ref>$2<\/footnote_ref>/g' ./"$baseName"/"$baseName".txt
	   sed -i -E 's|\^([^\^]?*)\^| <footnote_ref>\1<\/footnote_ref>|g' ./"$baseName"/"$baseName".txt
	   footnote="yes"
	   footnotes="Footnotes"
	   echo -e "Footnotes retained in \033[1;35m"$baseName".docx\033[0m.\n"
	   break
	   ;;
N | n) 
		echo -e "\n"
		perl -pi -e 's/\^\d+\^//g' ./"$baseName"/"$baseName".txt
		perl -pi -e 's/(\[\^)(\d+)(\])(:)/$2$4/g' ./"$baseName"/"$baseName".txt
		perl -pi -e 's/(\[\^)(\d+)(\])//g' ./"$baseName"/"$baseName".txt
		sed -i -E 's|\^([^\^]?*)\^||g' ./"$baseName"/"$baseName".txt 
		footnote="no"
		footnotes="Footnotes - removed"
		echo -e "Footnotes removed from \033[1;35m"$baseName".docx\033[0m.\n" 
		break
		;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n ].\033[0m\n"
	   break
       ;;
	    
esac

done

fi

	if [[ "$footnote" == "" ]]; then 
         footnote="no"        
    fi

if grep -q '<table>' ./"$baseName"/"$baseName".txt ; then

while true; do

echo -e "\033[1;33mATTENTION:\033[0m It looks like there are tables in \033[1;35m"$baseName".docx\033[0m.\n"

read -n1 -p "Do you wish to keep the table captions [Y/N]?" answer
case $answer in
Y | y) 
       echo -e "\n"
	   table="yes"
	   sed -i 's/<table>/<table>Table Caption/g' ./"$baseName"/"$baseName".txt
	   echo -e "Tables captions retained in \033[1;35m"$baseName".docx\033[0m.\n"
	   break
	   ;;
N | n) 
		echo -e "\n"
		table="no"
		perl -0777 -pi -e 's/\h*<table>[^<]*<\/table>//g' ./"$baseName"/"$baseName".txt
		echo -e "Tables captions removed from \033[1;35m"$baseName".docx\033[0m.\n" 
		break
		;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n ].\033[0m\n"
	   break
       ;;
	   
     
esac

done

fi

	if [[ "$table" == "" ]]; then 
         table="no"        
    fi


if grep -q '<secondary>' ./"$baseName"/"$baseName".txt ; then

while true; do

echo -e "\033[1;33mATTENTION:\033[0m It looks like there are secondary text areas in \033[1;35m"$baseName".docx\033[0m.\n"

read -n1 -p "Do you wish to keep the secondary text areas [Y/N]?" answer
case $answer in
Y | y) 
       echo -e "\n"
	   echo -e "Secondary text areas retained in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondary="yes"
	   secondary_text="Secondary Text"
	   sed -i 's/<secondary>/<secondary>Secondary Text Region/g' ./"$baseName"/"$baseName".txt
	   break
	   ;;
N | n) 
		echo -e "\n"
		perl -0777 -pi -e 's/\h*<secondary>[^<]*<\/secondary>//g' ./"$baseName"/"$baseName".txt
		secondary="no"
		secondary_text="Secondary Text - removed"
		echo -e "Secondary text areas removed from \033[1;35m"$baseName".docx\033[0m.\n" 
		break
		;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n ].\033[0m\n"
	   break
       ;;
	   
     
esac

done

fi

	if [[ "$secondary" == "" ]]; then 
         secondary="no"        
    fi
	
if grep -q '<figcaption>' ./"$baseName"/"$baseName".txt ; then

while true; do

echo -e "\033[1;33mATTENTION:\033[0m It looks like there are figures in \033[1;35m"$baseName".docx\033[0m.\n"

read -n1 -p "Do you wish to keep the figure captions [Y/N]?" answer
case $answer in
Y | y) 
       echo -e "\n"
	   echo -e "Figure captions retained in \033[1;35m"$baseName".docx\033[0m.\n"
	   figcaption="yes"
	   sed -i 's/<figcaption>/<figcaption>Figure Caption/g' ./"$baseName"/"$baseName".txt
	   break
	   ;;
N | n) 
		echo -e "\n"
		perl -0777 -pi -e 's/\h*<figcaption>[^<]*<\/figcaption>//g' ./"$baseName"/"$baseName".txt
		figcaption="no"
		echo -e "Figure captions removed from \033[1;35m"$baseName".docx\033[0m.\n" 
		break
		;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n ].\033[0m\n"
	   break
       ;;
	   
     
esac

done

fi

	if [[ "$figcaption" == "" ]]; then 
         figcaption="no"        
    fi
	
if grep -q '<description>' ./"$baseName"/"$baseName".txt ; then

while true; do

echo -e "\033[1;33mATTENTION:\033[0m It looks like there are extended descriptions in \033[1;35m"$baseName".docx\033[0m.\n"

read -n1 -p "Do you wish to keep the extended descriptions [Y/N]?" answer
case $answer in
Y | y) 
       echo -e "\n"
	   echo -e "Extended descriptions retained in \033[1;35m"$baseName".docx\033[0m.\n"
	   description="yes"
	   extended_descriptions="Extended Descriptions"
	   sed -i 's/<description>/<description>Extended Description/g' ./"$baseName"/"$baseName".txt
	   break
	   ;;
N | n) 
		echo -e "\n"
		perl -0777 -pi -e 's/\h*<description>[^<]*<\/description>//g' ./"$baseName"/"$baseName".txt
		description="no"
		extended_descriptions="Extended Descriptions - removed"
		echo -e "Extended descriptions removed from \033[1;35m"$baseName".docx\033[0m.\n" 
		break
		;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n ].\033[0m\n"
	   break
       ;;
	   
     
esac

done

fi

	if [[ "$description" == "" ]]; then 
         description="no"        
    fi

# Check if there are math equations and prompt user to turn on math switch

if [[ "$math" == "" ]]; then 

if grep -q '$$' ./"$baseName"/"$baseName".txt ; then

while true; do

echo -e "\033[1;33mATTENTION:\033[0m It looks like there are math equations in \033[1;35m"$baseName".docx\033[0m.\n"

read -n1 -p "Do you wish to process equations as mathspeak [Y/N]?" answer
case $answer in
Y | y) 
       echo -e "\n"
	   math=on
       echo -e "Mathspeak flag turned on.\n"
	   break
	   ;;
N | n) 
		echo -e "\n"
		echo -e "\033[1;33mATTENTION:\033[0m Math equations removed from \033[1;35m"$baseName".docx\033[0m. Check for the incorrect deletion of math equations.\n"
		math=off
		break
		;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n ].\033[0m\n"
	   break
       ;;
	   
     
esac

done

fi

fi

if [[ "$math" == "on" ]]; then 

	if  ! command -v node >/dev/null  2>&1; then 
	echo -e "\n\033[1;31mError: Node was not found, which is required for converting math equations to math speech. Install node (https://nodejs.org/en/download/). Will remove math equations...\033[0m" >&2
	   math=off
	   
	fi
	if  ! command -v tex2svg >/dev/null  2>&1; then 
	echo -e "\033[1;31mError: tex2svg was not found, which is required for converting math equations to math speech. Install tex2svg at the MathJax Github site (https://github.com/mathjax/mathjax-node-cli) and make sure that tex2svg is available from your path. Will remove math equations...\033[0m" >&2
	math=off
	
	fi
	
	fi

if [[ "$math" == "off" ]]; then 

math_equations="Math - removed"

# Remove line breaks within equations ( \\)

perl -0777 -pi -e 's/ \\\\(\n)//g' ./"$baseName"/"$baseName".txt

# add <equation> to opening $$

perl -0777 -pi -e 's/(\n)(\$\$)/$1<equation>\n/g' ./"$baseName"/"$baseName".txt

# add </equation> to closing $$

perl -0777 -pi -e 's/\$\$.*\n/\n<\/equation>\n/g' ./"$baseName"/"$baseName".txt

# join lines in between  $$

awk '/^<equation>/{a=1;b="$$";next}/^<\/equation>/{a=0;print"$$";next}a{printf b$0;b="";next}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt

# sed -i -E 's|\\\$|LITDOL|g;s|\$([^$]*)\$|<equation>\1</equation>|g;s|LITDOL|\\\$|g' ./"$baseName"/"$baseName".txt

sed -i -E 's|\\\\\\\$|LITDOL|g;s|\$([^$]*)\$|<equation>\1</equation>|g;s|LITDOL|\\\\\\\$|g' ./"$baseName"/"$baseName".txt

# sed -i -E 's|\$([^$]*)\$|<equation>\1</equation>|g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(<equation>)/\n$1\n/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(<\/equation>)/\n$1\n/g' ./"$baseName"/"$baseName".txt

awk '/^<equation>/{a=1;b="$$";next}/^<\/equation>/{a=0;print"$$";next}a{printf b$0;b="";next}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(\n\n)(\$\$\$\$\n)(.*)/$1\$\$$3/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(.*)(\n\$\$\$\$)(\n\n)/$1\$\$\n\n/g' ./"$baseName"/"$baseName".txt

if [ -n "$error" ];
		
then

cp ./"$baseName"/"$baseName".txt ./"$baseName"/"$baseName"_equation.txt
		
fi

fi

if [[ "$math" == "on" ]]; then 

math_text="yes"

math_equations="Math"

else

math_text="no"

fi	
	
# Add Math Equations	
	
if [[ "$math" == "on" ]]; then 

# Remove line breaks within equations ( \\)

perl -0777 -pi -e 's/ \\\\(\n)//g' ./"$baseName"/"$baseName".txt

# add <equation> to opening $$

perl -0777 -pi -e 's/(\n)(\$\$)/$1<equation>\n/g' ./"$baseName"/"$baseName".txt

# add </equation> to closing $$

perl -0777 -pi -e 's/\$\$.*\n/\n<\/equation>\n/g' ./"$baseName"/"$baseName".txt

#### New in 0.1.7

sed -i 's/\\%/%/g' ./"$baseName"/"$baseName".txt

####



# join lines in between  $$

awk '/^<equation>/{a=1;b="$$";next}/^<\/equation>/{a=0;print"$$";next}a{printf b$0;b="";next}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt

# sed -i -E 's|\\\$|LITDOL|g;s|\$([^$]*)\$|<equation>\1</equation>|g;s|LITDOL|\\\$|g' ./"$baseName"/"$baseName".txt

sed -i -E 's|\\\\\\\$|LITDOL|g;s|\$([^$]*)\$|<equation>\1</equation>|g;s|LITDOL|\\\\\\\$|g' ./"$baseName"/"$baseName".txt

# sed -i -E 's|\$([^$]*)\$|<equation>\1</equation>|g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(<equation>)/\n$1\n/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(<\/equation>)/\n$1\n/g' ./"$baseName"/"$baseName".txt

#### New in 0.1.7

perl -pi -e 's/<equation>\n/<equation>/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/\n<\/equation>/<\/equation>/g' ./"$baseName"/"$baseName".txt

sed -i 's/<equation>/\$\$/g' ./"$baseName"/"$baseName".txt

sed -i 's/<\/equation>/\$\$/g' ./"$baseName"/"$baseName".txt

# awk '/^<equation>/{a=1;b="$$";next}/^<\/equation>/{a=0;print"$$";next}a{printf b$0;b="";next}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(\n\n)(\$\$\$\$\n)(.*)/$1\$\$$3/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(.*)(\n\$\$\$\$)(\n\n)/$1\$\$\n\n/g' ./"$baseName"/"$baseName".txt

if [ -n "$error" ];
		
then

cp ./"$baseName"/"$baseName".txt ./"$baseName"/"$baseName"_equation.txt
		
fi

###

# Extract display equations
sed -n 's/\(\$\$\)\(.*\)\(\$\$\)/\2/p' ./"$baseName"/"$baseName".txt > ./"$baseName"/display-log.txt

# Place spacein front of minus sign if it begins the LaTeX equation (causes a LaTeX parsing error)

sed -i 's/^-/ -/g' ./"$baseName"/display-log.txt

## New in 0.1.7

sed -i 's/~/ /g' ./"$baseName"/display-log.txt

sed -i '/\\text/ s/^/"/' ./"$baseName"/display-log.txt

sed -i '/^"/ s/$/"/' ./"$baseName"/display-log.txt

cp ./"$baseName"/display-log.txt ./pre_math_tts.txt

##

# Insert place marker for display equations

sed -i 's/\(\$\$\)\(.*\)\(\$\$\)/@@ \2/g' ./"$baseName"/"$baseName".txt

# Delete Empty lines

sed -i '/^\s*$/d' ./"$baseName"/display-log.txt 

# New in 0.1.7


#sed -i 's/\\%/%/g' ./"$baseName"/display-log.txt

#sed -i 's/\\\%/%/g' ./"$baseName"/display-log.txt

sed -i 's/~/ /g' ./"$baseName"/display-log.txt

#



touch ./"$baseName"/display-log2.txt

count=1
while IFS="" read -r p || [ -n "$p" ] ; do echo -ne "Processing equations... \033[1;33m'$count'\033[0m\r" ; tex2svg "$p" | sed -n 's/.*1-Title">//p' >> ./"$baseName"/display-log2.txt  ; count=$[ $count + 1 ] ; done <./"$baseName"/display-log.txt 

IFS=$IFS_OLD

echo -ne 'Processing equations... \033[1;32mDone.\033[0m\r'
echo -ne '\n\n'

# Remove txt files

rm ./"$baseName"/display-log.txt 

# Delete Empty lines

sed -i '/^\s*$/d' ./"$baseName"/display-log2.txt 

# Remove <\/title>

sed -i 's/<\/title>//g' ./"$baseName"/display-log2.txt 

# Correct speech markup

# Remove "reverse solidus" text within equations that have text style

sed -i -e 's/ reverse-solidus//g' ./"$baseName"/display-log2.txt 

# Add String to beginning of each line

sed -i -e 's/^/@@ /' ./"$baseName"/display-log2.txt 

# Insert equations into txt file

# Replace display equations with lines from display-log2.txt

mv ./"$baseName"/display-log2.txt ./

awk '
    /^@@/{                   
        getline <"./display-log2.txt" 
    }
    1                      
    ' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt

#### New in 0.1.7
	
sed -i '/@@/s/\ quotation-mark//g' ./"$baseName"/"$baseName".txt	

sed -i '/@@/s/\ slash/\ divided by/g' ./"$baseName"/"$baseName".txt

sed -i '/@@/s/ percent-sign/ percent/g' ./"$baseName"/"$baseName".txt

sed -i '/@@/s/ StartFraction/ /g' ./"$baseName"/"$baseName".txt

sed -i '/@@/s/ EndFraction/ /g' ./"$baseName"/"$baseName".txt

sed -i '/@@/s/ upper/ /g' ./"$baseName"/"$baseName".txt

sed -i '/@@/s/ left-parenthesis/ /g' ./"$baseName"/"$baseName".txt

sed -i '/@@/s/ right-parenthesis/ /g' ./"$baseName"/"$baseName".txt

sed -i '/@@/s/ right-parenthesis/ /g' ./"$baseName"/"$baseName".txt

sed -i '/@@/s/ comma //g' ./"$baseName"/"$baseName".txt

####

cp ./"$baseName"/"$baseName".txt ./math_tts.txt
	
# Replace placeholder text

sed -i -e 's/@@ //g' ./"$baseName"/"$baseName".txt
    
# Remove txt files

rm ./display-log2.txt

fi

# Reformat document for better processing

# Correct line breaks within paragraphs
	perl -i -pe 's/\n/~~~/' ./"$baseName"/"$baseName".txt
	
	sed -i 's/~~~~~~/\n/g' ./"$baseName"/"$baseName".txt
	
	sed -i 's/~~~/ /g' ./"$baseName"/"$baseName".txt
	
# Replace six spaces with one space		
	sed -i 's/      / /g' ./"$baseName"/"$baseName".txt
	
# Replace five spaces with one space	
	sed -i 's/     / /g' ./"$baseName"/"$baseName".txt

# Replace four spaces with one space	
	sed -i 's/    / /g' ./"$baseName"/"$baseName".txt

# Replace three spaces with one space		
	sed -i 's/   / /g' ./"$baseName"/"$baseName".txt	

# Replace two spaces with one space	
	sed -i 's/  / /g' ./"$baseName"/"$baseName".txt

# Remove backslash if it comes before a single quotation markdown

	sed -i 's/\\'/'/g' ./"$baseName"/"$baseName".txt
	
# Remove backslash if it comes before a double quotation markdown

	sed -i 's/\\"/"/g' ./"$baseName"/"$baseName".txt

# Remove extra hyphen for em dashes

	sed -i 's/--/-/g' ./"$baseName"/"$baseName".txt
	
# Remove a space if it is at the start of a new line	
	
perl -0777 -pi -e 's/(\n)( )/$1/g' ./"$baseName"/"$baseName".txt

# Remove empty lines

perl -0777 -pi -e 's/(\n)(\n)/$1/g' ./"$baseName"/"$baseName".txt

# Add Page <xml> Markup

perl -pi -e 's/(Page [0-9]+)/<page>$1<\/page>/g' ./"$baseName"/"$baseName".txt

# Remove asterisk symbol (for bold and italics)

perl -0777 -pi -e 's/\*//g' ./"$baseName"/"$baseName".txt

# remove small caps

sed -i -E 's|\[([^]]*)\]\{.smallcaps\}|\1|g' ./"$baseName"/"$baseName".txt

sed -i -E 's|\[\\\[([^]]*)\\\]\]\{.smallcaps\}|\1|g' ./"$baseName"/"$baseName".txt

sed -i 's/\[\[//g' ./"$baseName"/"$baseName".txt

sed -i 's/\]\]{.smallcaps\}//g' ./"$baseName"/"$baseName".txt

# Remove underline

perl -0777 -pi -e 's/(\[)(.*)(\])({.ul})/$2/g' ./"$baseName"/"$baseName".txt

# Remove path to images

sed -i 's/^!\[.*//g' ./"$baseName"/"$baseName".txt

# Remove Math equations if math =off

if [[ "$math" == "off" ]]; then 

sed -i 's/^\$\$.*\$\$//g' ./"$baseName"/"$baseName".txt

fi

# Remove tables

if [ -n "$error" ];
		
then

cp ./"$baseName"/"$baseName".txt ./"$baseName"/"$baseName"_tables1.txt
		
fi

sed -i '/\-\-\-\ \-\-\-/d' ./"$baseName"/"$baseName".txt

sed -i 's/^+---.*//g' ./"$baseName"/"$baseName".txt

if [ -n "$error" ];
		
then

cp ./"$baseName"/"$baseName".txt ./"$baseName"/"$baseName"_tables2.txt
		
fi

# Rearrange/ remove Line Numbers (Poetry)

if [ -n "$remove" ]; then

if [[ "$remove" == "remove" ]]; then

# When using -r flag (remove argument)
# Remove line numbers at the beginning of the line

perl -0777 -pi -e 's/\n[0-9]+ /\n/g' ./"$baseName"/"$baseName".txt

# Remove line numbers at the end of the line 

perl -0777 -pi -e 's/ [0-9]+\n/\n/g' ./"$baseName"/"$baseName".txt

echo -e "\nPoetry line numbers removed from \033[1;35m"$baseName".docx\033[0m.\n"

fi

# Move Line Numbers before line and add Line # text ("Label", "No label",)

if [[ "$remove" == "label" ]]; then

# Put the line numbers from the beginning of the line to their own lines.

perl -0777 -pi -e 's/\n([0-9]+ )/\n<line>Line $1<\/line>/g' ./"$baseName"/"$baseName".txt

# Put the line numbers at the end of the line on their lines

perl -0777 -pi -e 's/ ([0-9]+)\n/<line>Line $1<\/line>\n/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(.*)(<line>)(.*)(<\/line>)/$2$3$4\n$1/g' ./"$baseName"/"$baseName".txt

fi

# Move Line Numbers before line and add no text ("no-label")

if [[ "$remove" == "no-label" ]]; then

# Put the line numbers from the beginning of the line to their own lines.

perl -0777 -pi -e 's/\n([0-9]+ )/\n<line>$1<\/line>/g' ./"$baseName"/"$baseName".txt

# Put the line numbers at the end of the line on their lines

perl -0777 -pi -e 's/ ([0-9]+)\n/<line>$1<\/line>\n/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(.*)(<line>)(.*)(<\/line>)/$2$3$4\n$1/g' ./"$baseName"/"$baseName".txt

fi

fi

### Count the number characters and decide whether to split

word_count="$(wc -l ./"$baseName"/"$baseName".txt | sed -r  's/^[^0-9]*([0-9]+).*/\1/')"

if (( $word_count > 70 )); 

then 

if grep -q '<page>' ./"$baseName"/"$baseName".txt ;

then

# echo -e "Higher"; 

echo -e "\033[1;33mATTENTION:\033[0m \033[1;35m"$baseName".docx\033[0m will be split into smaller MP3 units for easier review.\n"

split="on"

else

echo -e "\033[1;33mATTENTION:\033[0m \033[1;35m"$baseName".docx\033[0m needs to be split into smaller units but does not have page number markup (heading #6). Apply heading 6 to page numbers in \033[1;35m"$baseName".docx\033[0m and run the script again.\n"

split="off"

if [[ "$caption" == "on" ]]; then

echo -e "\033[1;33mATTENTION:\033[0m \033[1;35m"$baseName".docx\033[0m cannot be split into smaller chunks for alignment purposes. MP3 bookmarks will not be added. \n"

caption="off"

fi

fi

else 

# echo -e "lower"; 

split="off"

fi

###

if [[ "$split" == "on" ]]; then 

while true; do

read -n1 -p "Is $(echo -e "\033[1;35m"$baseName".docx\033[0m") a novel[Y/N]?" answer
case $answer in
Y | y) 
       echo -e "\n"
	   novel=on
	   break
	   ;;
N | n) 
		echo -e "\n"
		textbook=on
		# secondlanguage1="Language(s) Removed"
		break
		;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n ].\033[0m\n"
       ;;
	   
esac

done

if [[ "$textbook" == "on" ]]; then
if [[ "$secondary" == "yes" ]] || [[ "$footnote_text" == "yes" ]]; then

textbook=long

else

textbook=short

fi

fi

fi

####

###

if [[ "$caption" == "on" ]]; 

then 

# Preserve original copy for syncmap purposes

cp ./"$baseName"/"$baseName".txt ./"$baseName"/"$baseName"_formatted.txt 2> /dev/null

# sed -i 's/\\#\\#\\#[1-9]//g' ./"$baseName"/"$baseName"_formatted.txt

# sed -i 's/###[1-9]//g' ./"$baseName"/"$baseName"_formatted.txt

# sed -i 's/%%%//g' ./"$baseName"/"$baseName"_formatted.txt

if [[ "$split" == "on" ]]; then 

# Add a split tag before every pages

perl -0777 -pi -e 's/<page>/<page>\n/g' ./"$baseName"/"$baseName"_formatted.txt

####

if [[ "$textbook" == "long" ]]; then

	if [[ "$speed" -ge 50 && "$speed" -le 69 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%2==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 70 && "$speed" -le 89 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%4==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 90 && "$speed" -le 109 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%6==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 110 && "$speed" -le 129 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%7==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 130 && "$speed" -le 159 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%8==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 160 && "$speed" -le 200 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%9==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt

	fi

	fi

if [[ "$textbook" == "short" ]]; then

	if [[ "$speed" -ge 50 && "$speed" -le 69 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%3==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 70 && "$speed" -le 89 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%5==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 90 && "$speed" -le 109 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%7==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 110 && "$speed" -le 129 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%8==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 130 && "$speed" -le 159 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%9==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 160 && "$speed" -le 200 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%10==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi

	fi

if [[ "$novel" == "on" ]]; then

	if [[ "$speed" -ge 50 && "$speed" -le 69 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%5==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 70 && "$speed" -le 89 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%7==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 90 && "$speed" -le 109 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%11==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 110 && "$speed" -le 129 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%13==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 130 && "$speed" -le 159 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%15==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 160 && "$speed" -le 200 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%17==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi

	fi

####

perl -0777 -pi -e 's/<split>\n/\n<split>\n<page>/g' ./"$baseName"/"$baseName"_formatted.txt
	
perl -0777 -pi -e 's/<page>\n/<page>/g' ./"$baseName"/"$baseName"_formatted.txt
		
# Append marker to the top of the TXT file
sed -i '1s/^/\n<split>\n/' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<page>//g' ./"$baseName"/"$baseName"_formatted.txt

else

sed -i 's/<page>//g' ./"$baseName"/"$baseName"_formatted.txt

fi

sed -i 's/<\/page>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<line>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/line>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<heading1>/YzW\n/g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/heading1>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<heading2>/YzW\n/g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/heading2>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<heading3>/YzW\n/g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/heading3>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<heading4>/YzW\n/g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/heading4>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<heading5>/YzW\n/g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/heading5>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<secondary>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/secondary>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<footnote>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/footnote>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<footnote_ref>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/footnote_ref>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<figcaption>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/figcaption>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<description>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/description>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<table>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/table>//g' ./"$baseName"/"$baseName"_formatted.txt

fi

# Check if there are language equations and prompt user to turn on language switch

if [[ "$language" == "" ]]; then 

if grep -q '###1' ./"$baseName"/"$baseName".txt ; then

while true; do

echo -e "\033[1;33mATTENTION:\033[0m It looks like there is a secondary language in \033[1;35m"$baseName".docx\033[0m.\n"

read -n1 -p "Do you wish to process secondary languages [Y/N]?" answer
case $answer in
Y | y) 
       echo -e "\n"
	   language=on
       echo -e "Language flag turned on.\n"
	   break
	   ;;
N | n) 
		echo -e "\n"
		language=off
		echo -e "\033[1;33mATTENTION:\033[0m Secondary languages will be removed from \033[1;32m"$baseName".mp3\033[0m.\n"
		# secondlanguage1="Language(s) Removed"
		break
		;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n ].\033[0m\n"
       ;;
	   
esac

done

fi

fi

if [ ! -f  "C:\balcon\balcon.exe" ]; then

	echo -e "\033[1;31mError: balcon (MP3 program used for other languages) was not found. Download balcon.exe (http://www.cross-plus-a.com/bconsole.htm) and place it in the \033[1;35mC:\balcon\\033[0m directory. Will not process secondary languages....\033[0m\n" >&2
	language=off

fi

if [[ "$language" == "off" ]]; then 

		sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
		sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
		sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
		sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
		sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
		sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
		sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
		sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
		sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
		
if [[ "$caption" == "on" ]]; then 		
		
		sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt
		sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt
		sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt
		sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt
		sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt
		sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt
		sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt
		sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt
		sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language" == "on" ]]; then 

if 	grep -q '###1' ./"$baseName"/"$baseName".txt ; then

if [[ "$language1" == "" ]]; then 
    
echo -e "\033[1;33mATTENTION:\033[0m The 1st secondary language tag \033[1;45m\033[1;39m(###1)\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m hasn't been assigned a value.\n"

while true; do

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
case "$answer" in
IT | it) 
	   language1=it	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"it"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage1="Italian"
       break
	   ;;
DE | de) 
	   language1=de	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="German - Germany"
	   break
	   ;;
ES | es) 
	   language1=es	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Spanish - Spain"
	   break
	   ;;
FR | fr) 
	   language1=fr	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="French - France"
	   break
	   ;;
JA | ja) 
	   language1=ja	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ja"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage1="Japanese"
	   break
	   ;;
EN-US | en-us) 
	   language1=en-us	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-us"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="English - American"
	   break
	   ;;
EN-GB | en-gb) 
	   language1=en-gb	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-gb"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="English - British"
	   break
	   ;;
ZH-CN | zh-cn) 
	   language1=zh-cn
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-cn"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Chinese - China"
	   break
	   ;;
RU | ru) 
	   language1=ru
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ru"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Russian"
	   break
	   ;;
PT | pt) 
	   language1=pt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Portuguese - Portugal"
	   break
	   ;;
PL | pl) 
	   language1=pl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Polish"
	   break
	   ;;
ES-MX | es-mx) 
	   language1=es-mx
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es-mx"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Spanish - Mexico"
	   break
	   ;;
ZH-HK | zh-hk) 
	   language1=zh-hk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-hk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Chinese - Hong Kong"
	   break
	   ;;
LA | la) 
	   language1=la
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"la"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Latin"
	   break
	   ;;
AF | af) 
	   language1=af
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"af"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Afrikaans"
	   break
	   ;;
AR-SA | ar-sa) 
	   language1=ar-sa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-sa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Arabic - Saudi Arabia"
	   break
	   ;;
AR-EG | ar-eg) 
	   language1=ar-eg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-eg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Arabic - Egypt"
	   break
	   ;;
BG | bg) 
	   language1=bg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"bg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Bulgarian"
	   break
	   ;;
CA | ca) 
	   language1=ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Catalan"
	   break
	   ;;
CS | cs) 
	   language1=cs
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"cs"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Czech"
	   break
	   ;;
DA | da) 
	   language1=da
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"da"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Danish"
	   break
	   ;;
DE-AT | de-at) 
	   language1=de-at
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-at"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="German - Austria"
	   break
	   ;;
DE-CH | de-ch) 
	   language1=de-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="German - Switzerland"
	   break
	   ;;
EL | el) 
	   language1=el
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"el"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Greek"
	   break
	   ;;
EN-AU | en-au) 
	   language1=en-au
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-au"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="English - Australia"
	   break
	   ;;
EN-CA | en-ca) 
	   language1=en-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="English - Canada"
	   break
	   ;;
EN-IN | en-in) 
	   language1=en-in
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-in"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="English - India"
	   break
	   ;;
EN-IE | en-ie) 
	   language1=en-ie
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ie"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="English - Ireland"
	   break
	   ;;
ET | et) 
	   language1=et
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"et"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Estonian"
	   break
	   ;;
FA | fa) 
	   language1=fa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Farsi"
	   break
	   ;;
FI | fi) 
	   language1=fi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Finnish"
	   break
	   ;;
FR-CA | fr-ca) 
	   language1=fr-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="French - Canada"
	   break
	   ;;
FR-CH | fr-ch) 
	   language1=fr-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="French - Switzerland"
	   break
	   ;;
HE | he) 
	   language1=he
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"he"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Hebrew"
	   break
	   ;;
HI | hi) 
	   language1=hi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Hindi"
	   break
	   ;;
HR | hr) 
	   language1=hr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Croatian"
	   break
	   ;;
HU | hu) 
	   language1=hu
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hu"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Hungarian"
	   break
	   ;;
ID | id) 
	   language1=id
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"id"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Indonesian"
	   break
	   ;;
KO | ko) 
	   language1=ko
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ko"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Korean"
	   break
	   ;;
LT | lt) 
	   language1=lt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"lt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Lithuanian"
	   break
	   ;;
MS | ms) 
	   language1=ms
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ms"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Malaysian"
	   break
	   ;;
NL | nl) 
	   language1=nl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Dutch - Netherlands"
	   break
	   ;;
NL-BE | nl-be) 
	   language1=nl-be
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl-be"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Dutch - Netherlands"
	   break
	   ;;
NO | no) 
	   language1=no
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"no"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Norwegian"
	   break
	   ;;
PT-BR | pt-br) 
	   language1=pt-br
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt-br"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Portuguese - Brazil"
	   break
	   ;;
RO | ro) 
	   language1=ro
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ro"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Romanian"
	   break
	   ;;
SK | sk) 
	   language1=sk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Slovak"
	   break
	   ;;
SL | sl) 
	   language1=sl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Slovenian"
	   break
	   ;;
SV | sv) 
	   language1=sv
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sv"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Swedish"
	   break
	   ;;
TA | ta) 
	   language1=ta
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ta"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Tamil"
	   break
	   ;;
TH | th) 
	   language1=th
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"th"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Thai"
	   break
	   ;;
TR | tr) 
	   language1=tr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"tr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Turkish"
	   break
	   ;;
VI | vi) 
	   language1=vi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"vi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Vietnamese"
	   break
	   ;;
ZH-TW | zh-tw) 
	   language1=zh-tw
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-tw"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Chinese - Taiwan"
	   break
	   ;;
 RM | rm) 
       echo -e "\n"
       echo -e "The secondary language tagged with \033[1;45m\033[1;39m###1\033[0m\033[0m tags in \033[1;35m"$baseName".docx\033[0m was removed.\n"
	   sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
	   secondlanguage1="Second Language 1 - removed"
       break
	   ;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
       ;;
esac

done

fi

fi

if [[ "$caption" == "on" ]]; then

if [[ "$secondlanguage1" == " Second Language 1 - removed " ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if 	grep -q '###2' ./"$baseName"/"$baseName".txt ; then

if [[ "$language2" == "" ]]; then 
    
echo -e "\033[1;33mATTENTION:\033[0m The 2nd secondary language tag \033[1;45m\033[1;39m(###2)\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m hasn't been assigned a value.\n"

while true; do

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
case $answer in
IT | it) 
	   language2=it	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"it"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage2="Italian"
       break
	   ;;
DE | de) 
	   language2=de	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="German - Germany"
	   break
	   ;;
ES | es) 
	   language2=es	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Spanish - Spain"
	   break
	   ;;
FR | fr) 
	   language2=fr	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="French - France"
	   break
	   ;;
JA | ja) 
	   language2=ja	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ja"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage2="Japanese"
	   break
	   ;;
EN-US | en-us) 
	   language2=en-us	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-us"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="English - American"
	   break
	   ;;
EN-GB | en-gb) 
	   language2=en-gb	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-gb"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="English - British"
	   break
	   ;;
ZH-CN | zh-cn) 
	   language2=zh-cn
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-cn"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Chinese - China"
	   break
	   ;;
RU | ru) 
	   language2=ru
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ru"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Russian"
	   break
	   ;;
PT | pt) 
	   language2=pt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Portuguese - Portugal"
	   break
	   ;;
PL | pl) 
	   language2=pl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Polish"
	   break
	   ;;
ES-MX | es-mx) 
	   language2=es-mx
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es-mx"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Spanish - Mexico"
	   break
	   ;;
ZH-HK | zh-hk) 
	   language2=zh-hk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-hk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Chinese - Hong Kong"
	   break
	   ;;
LA | la) 
	   language2=la
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"la"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Latin"
	   break
	   ;;
AF | af) 
	   language2=af
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"af"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Afrikaans"
	   break
	   ;;
AR-SA | ar-sa) 
	   language2=ar-sa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-sa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Arabic - Saudi Arabia"
	   break
	   ;;
AR-EG | ar-eg) 
	   language2=ar-eg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-eg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Arabic - Egypt"
	   break
	   ;;
BG | bg) 
	   language2=bg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"bg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Bulgarian"
	   break
	   ;;
CA | ca) 
	   language2=ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Catalan"
	   break
	   ;;
CS | cs) 
	   language2=cs
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"cs"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Czech"
	   break
	   ;;
DA | da) 
	   language2=da
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"da"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Danish"
	   break
	   ;;
DE-AT | de-at) 
	   language2=de-at
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-at"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="German - Austria"
	   break
	   ;;
DE-CH | de-ch) 
	   language2=de-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="German - Switzerland"
	   break
	   ;;
EL | el) 
	   language2=el
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"el"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Greek"
	   break
	   ;;
EN-AU | en-au) 
	   language2=en-au
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-au"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="English - Australia"
	   break
	   ;;
EN-CA | en-ca) 
	   language2=en-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="English - Canada"
	   break
	   ;;
EN-IN | en-in) 
	   language2=en-in
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-in"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="English - India"
	   break
	   ;;
EN-IE | en-ie) 
	   language2=en-ie
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ie"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="English - Ireland"
	   break
	   ;;
ET | et) 
	   language2=et
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"et"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Estonian"
	   break
	   ;;
FA | fa) 
	   language2=fa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Farsi"
	   break
	   ;;
FI | fi) 
	   language2=fi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Finnish"
	   break
	   ;;
FR-CA | fr-ca) 
	   language2=fr-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="French - Canada"
	   break
	   ;;
FR-CH | fr-ch) 
	   language2=fr-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="French - Switzerland"
	   break
	   ;;
HE | he) 
	   language2=he
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"he"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Hebrew"
	   break
	   ;;
HI | hi) 
	   language2=hi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Hindi"
	   break
	   ;;
HR | hr) 
	   language2=hr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Croatian"
	   break
	   ;;
HU | hu) 
	   language2=hu
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hu"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Hungarian"
	   break
	   ;;
ID | id) 
	   language2=id
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"id"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Indonesian"
	   break
	   ;;
KO | ko) 
	   language2=ko
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ko"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Korean"
	   break
	   ;;
LT | lt) 
	   language2=lt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"lt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Lithuanian"
	   break
	   ;;
MS | ms) 
	   language2=ms
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ms"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Malaysian"
	   break
	   ;;
NL | nl) 
	   language2=nl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Dutch - Netherlands"
	   break
	   ;;
NL-BE | nl-be) 
	   language2=nl-be
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl-be"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Dutch - Netherlands"
	   break
	   ;;
NO | no) 
	   language2=no
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"no"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Norwegian"
	   break
	   ;;
PT-BR | pt-br) 
	   language2=pt-br
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt-br"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Portuguese - Brazil"
	   break
	   ;;
RO | ro) 
	   language2=ro
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ro"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Romanian"
	   break
	   ;;
SK | sk) 
	   language2=sk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Slovak"
	   break
	   ;;
SL | sl) 
	   language2=sl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Slovenian"
	   break
	   ;;
SV | sv) 
	   language2=sv
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sv"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Swedish"
	   break
	   ;;
TA | ta) 
	   language2=ta
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ta"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Tamil"
	   break
	   ;;
TH | th) 
	   language2=th
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"th"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Thai"
	   break
	   ;;
TR | tr) 
	   language2=tr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"tr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Turkish"
	   break
	   ;;
VI | vi) 
	   language2=vi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"vi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Vietnamese"
	   break
	   ;;
ZH-TW | zh-tw) 
	   language2=zh-tw
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-tw"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Chinese - Taiwan"
	   break
	   ;;
 RM | rm) 
       echo -e "\n"
       echo -e "The secondary language tagged with \033[1;45m\033[1;39m###2\033[0m\033[0m tags in \033[1;35m"$baseName".docx\033[0m was removed.\n"
	   sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
	   secondlanguage2="Second Language 2 - removed"
       break
	   ;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
       ;;
esac

done

fi

fi

if [[ "$caption" == "on" ]]; then

if [[ "$secondlanguage2" == "Second Language 2 - removed" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if 	grep -q '###3' ./"$baseName"/"$baseName".txt ; then

if [[ "$language3" == "" ]]; then 
    
echo -e "\033[1;33mATTENTION:\033[0m The 3rd secondary language tag \033[1;45m\033[1;39m(###3)\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m hasn't been assigned a value.\n"

while true; do

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
case $answer in
IT | it) 
	   language3=it	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"it"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage3="Italian"
       break
	   ;;
DE | de) 
	   language3=de	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="German - Germany"
	   break
	   ;;
ES | es) 
	   language3=es	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Spanish - Spain"
	   break
	   ;;
FR | fr) 
	   language3=fr	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="French - France"
	   break
	   ;;
JA | ja) 
	   language3=ja	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ja"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage3="Japanese"
	   break
	   ;;
EN-US | en-us) 
	   language3=en-us	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-us"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="English - American"
	   break
	   ;;
EN-GB | en-gb) 
	   language3=en-gb	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-gb"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="English - British"
	   break
	   ;;
ZH-CN | zh-cn) 
	   language3=zh-cn
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-cn"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Chinese - China"
	   break
	   ;;
RU | ru) 
	   language3=ru
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ru"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Russian"
	   break
	   ;;
PT | pt) 
	   language3=pt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Portuguese - Portugal"
	   break
	   ;;
PL | pl) 
	   language3=pl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Polish"
	   break
	   ;;
ES-MX | es-mx) 
	   language3=es-mx
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es-mx"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Spanish - Mexico"
	   break
	   ;;
ZH-HK | zh-hk) 
	   language3=zh-hk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-hk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Chinese - Hong Kong"
	   break
	   ;;
LA | la) 
	   language3=la
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"la"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Latin"
	   break
	   ;;
AF | af) 
	   language3=af
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"af"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Afrikaans"
	   break
	   ;;
AR-SA | ar-sa) 
	   language3=ar-sa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-sa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Arabic - Saudi Arabia"
	   break
	   ;;
AR-EG | ar-eg) 
	   language3=ar-eg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-eg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Arabic - Egypt"
	   break
	   ;;
BG | bg) 
	   language3=bg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"bg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Bulgarian"
	   break
	   ;;
CA | ca) 
	   language3=ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Catalan"
	   break
	   ;;
CS | cs) 
	   language3=cs
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"cs"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Czech"
	   break
	   ;;
DA | da) 
	   language3=da
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"da"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Danish"
	   break
	   ;;
DE-AT | de-at) 
	   language3=de-at
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-at"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="German - Austria"
	   break
	   ;;
DE-CH | de-ch) 
	   language3=de-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="German - Switzerland"
	   break
	   ;;
EL | el) 
	   language3=el
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"el"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Greek"
	   break
	   ;;
EN-AU | en-au) 
	   language3=en-au
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-au"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="English - Australia"
	   break
	   ;;
EN-CA | en-ca) 
	   language3=en-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="English - Canada"
	   break
	   ;;
EN-IN | en-in) 
	   language3=en-in
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-in"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="English - India"
	   break
	   ;;
EN-IE | en-ie) 
	   language3=en-ie
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ie"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="English - Ireland"
	   break
	   ;;
ET | et) 
	   language3=et
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"et"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Estonian"
	   break
	   ;;
FA | fa) 
	   language3=fa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Farsi"
	   break
	   ;;
FI | fi) 
	   language3=fi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Finnish"
	   break
	   ;;
FR-CA | fr-ca) 
	   language3=fr-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="French - Canada"
	   break
	   ;;
FR-CH | fr-ch) 
	   language3=fr-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="French - Switzerland"
	   break
	   ;;
HE | he) 
	   language3=he
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"he"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Hebrew"
	   break
	   ;;
HI | hi) 
	   language3=hi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Hindi"
	   break
	   ;;
HR | hr) 
	   language3=hr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Croatian"
	   break
	   ;;
HU | hu) 
	   language3=hu
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hu"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Hungarian"
	   break
	   ;;
ID | id) 
	   language3=id
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"id"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Indonesian"
	   break
	   ;;
KO | ko) 
	   language3=ko
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ko"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Korean"
	   break
	   ;;
LT | lt) 
	   language3=lt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"lt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Lithuanian"
	   break
	   ;;
MS | ms) 
	   language3=ms
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ms"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Malaysian"
	   break
	   ;;
NL | nl) 
	   language3=nl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Dutch - Netherlands"
	   break
	   ;;
NL-BE | nl-be) 
	   language3=nl-be
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl-be"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Dutch - Netherlands"
	   break
	   ;;
NO | no) 
	   language3=no
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"no"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Norwegian"
	   break
	   ;;
PT-BR | pt-br) 
	   language3=pt-br
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt-br"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Portuguese - Brazil"
	   break
	   ;;
RO | ro) 
	   language3=ro
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ro"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Romanian"
	   break
	   ;;
SK | sk) 
	   language3=sk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Slovak"
	   break
	   ;;
SL | sl) 
	   language3=sl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Slovenian"
	   break
	   ;;
SV | sv) 
	   language3=sv
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sv"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Swedish"
	   break
	   ;;
TA | ta) 
	   language3=ta
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ta"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Tamil"
	   break
	   ;;
TH | th) 
	   language3=th
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"th"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Thai"
	   break
	   ;;
TR | tr) 
	   language3=tr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"tr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Turkish"
	   break
	   ;;
VI | vi) 
	   language3=vi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"vi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Vietnamese"
	   break
	   ;;
ZH-TW | zh-tw) 
	   language3=zh-tw
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-tw"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Chinese - Taiwan"
	   break
	   ;;
 RM | rm) 
       echo -e "\n"
       echo -e "The secondary language tagged with \033[1;45m\033[1;39m###3\033[0m\033[0m tags in \033[1;35m"$baseName".docx\033[0m was removed.\n"
	   sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
	   secondlanguage3="Second Language 3 - removed"
       break
	   ;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
       ;;
esac

done

fi

fi

if [[ "$caption" == "on" ]]; then

if [[ "$secondlanguage3" == "Second Language 3 - removed" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if 	grep -q '###4' ./"$baseName"/"$baseName".txt ; then

if [[ "$language4" == "" ]]; then 
    
echo -e "\033[1;33mATTENTION:\033[0m The 4th secondary language tag \033[1;45m\033[1;39m(###4)\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m hasn't been assigned a value.\n"

while true; do

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
case $answer in
IT | it) 
	   language4=it	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"it"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage4="Italian"
       break
	   ;;
DE | de) 
	   language4=de	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="German - Germany"
	   break
	   ;;
ES | es) 
	   language4=es	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Spanish - Spain"
	   break
	   ;;
FR | fr) 
	   language4=fr	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="French - France"
	   break
	   ;;
JA | ja) 
	   language4=ja	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ja"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage4="Japanese"
	   break
	   ;;
EN-US | en-us) 
	   language4=en-us	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-us"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="English - American"
	   break
	   ;;
EN-GB | en-gb) 
	   language4=en-gb	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-gb"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="English - British"
	   break
	   ;;
ZH-CN | zh-cn) 
	   language4=zh-cn
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-cn"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Chinese - China"
	   break
	   ;;
RU | ru) 
	   language4=ru
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ru"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Russian"
	   break
	   ;;
PT | pt) 
	   language4=pt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Portuguese - Portugal"
	   break
	   ;;
PL | pl) 
	   language4=pl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Polish"
	   break
	   ;;
ES-MX | es-mx) 
	   language4=es-mx
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es-mx"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Spanish - Mexico"
	   break
	   ;;
ZH-HK | zh-hk) 
	   language4=zh-hk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-hk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Chinese - Hong Kong"
	   break
	   ;;
LA | la) 
	   language4=la
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"la"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Latin"
	   break
	   ;;
AF | af) 
	   language4=af
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"af"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Afrikaans"
	   break
	   ;;
AR-SA | ar-sa) 
	   language4=ar-sa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-sa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Arabic - Saudi Arabia"
	   break
	   ;;
AR-EG | ar-eg) 
	   language4=ar-eg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-eg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Arabic - Egypt"
	   break
	   ;;
BG | bg) 
	   language4=bg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"bg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Bulgarian"
	   break
	   ;;
CA | ca) 
	   language4=ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Catalan"
	   break
	   ;;
CS | cs) 
	   language4=cs
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"cs"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Czech"
	   break
	   ;;
DA | da) 
	   language4=da
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"da"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Danish"
	   break
	   ;;
DE-AT | de-at) 
	   language4=de-at
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-at"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="German - Austria"
	   break
	   ;;
DE-CH | de-ch) 
	   language4=de-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="German - Switzerland"
	   break
	   ;;
EL | el) 
	   language4=el
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"el"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Greek"
	   break
	   ;;
EN-AU | en-au) 
	   language4=en-au
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-au"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="English - Australia"
	   break
	   ;;
EN-CA | en-ca) 
	   language4=en-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="English - Canada"
	   break
	   ;;
EN-IN | en-in) 
	   language4=en-in
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-in"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="English - India"
	   break
	   ;;
EN-IE | en-ie) 
	   language4=en-ie
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ie"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="English - Ireland"
	   break
	   ;;
ET | et) 
	   language4=et
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"et"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Estonian"
	   break
	   ;;
FA | fa) 
	   language4=fa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Farsi"
	   break
	   ;;
FI | fi) 
	   language4=fi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Finnish"
	   break
	   ;;
FR-CA | fr-ca) 
	   language4=fr-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="French - Canada"
	   break
	   ;;
FR-CH | fr-ch) 
	   language4=fr-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="French - Switzerland"
	   break
	   ;;
HE | he) 
	   language4=he
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"he"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Hebrew"
	   break
	   ;;
HI | hi) 
	   language4=hi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Hindi"
	   break
	   ;;
HR | hr) 
	   language4=hr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Croatian"
	   break
	   ;;
HU | hu) 
	   language4=hu
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hu"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Hungarian"
	   break
	   ;;
ID | id) 
	   language4=id
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"id"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Indonesian"
	   break
	   ;;
KO | ko) 
	   language4=ko
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ko"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Korean"
	   break
	   ;;
LT | lt) 
	   language4=lt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"lt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Lithuanian"
	   break
	   ;;
MS | ms) 
	   language4=ms
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ms"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Malaysian"
	   break
	   ;;
NL | nl) 
	   language4=nl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Dutch - Netherlands"
	   break
	   ;;
NL-BE | nl-be) 
	   language4=nl-be
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl-be"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Dutch - Netherlands"
	   break
	   ;;
NO | no) 
	   language4=no
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"no"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Norwegian"
	   break
	   ;;
PT-BR | pt-br) 
	   language4=pt-br
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt-br"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Portuguese - Brazil"
	   break
	   ;;
RO | ro) 
	   language4=ro
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ro"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Romanian"
	   break
	   ;;
SK | sk) 
	   language4=sk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Slovak"
	   break
	   ;;
SL | sl) 
	   language4=sl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Slovenian"
	   break
	   ;;
SV | sv) 
	   language4=sv
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sv"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Swedish"
	   break
	   ;;
TA | ta) 
	   language4=ta
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ta"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Tamil"
	   break
	   ;;
TH | th) 
	   language4=th
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"th"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Thai"
	   break
	   ;;
TR | tr) 
	   language4=tr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"tr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Turkish"
	   break
	   ;;
VI | vi) 
	   language4=vi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"vi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Vietnamese"
	   break
	   ;;
ZH-TW | zh-tw) 
	   language4=zh-tw
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-tw"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Chinese - Taiwan"
	   break
	   ;;
 RM | rm) 
       echo -e "\n"
       echo -e "The secondary language tagged with \033[1;45m\033[1;39m###4\033[0m\033[0m tags in \033[1;35m"$baseName".docx\033[0m was removed.\n"
	   sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
	   secondlanguage4="Second Language 4 - removed"
       break
	   ;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
       ;;
esac

done

fi

fi

if [[ "$caption" == "on" ]]; then

if [[ "$secondlanguage4" == "Second Language 4 - removed" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if 	grep -q '###5' ./"$baseName"/"$baseName".txt ; then

if [[ "$language5" == "" ]]; then 
    
echo -e "\033[1;33mATTENTION:\033[0m The 5th secondary language tag \033[1;45m\033[1;39m(###5)\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m hasn't been assigned a value.\n"

while true; do

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
case $answer in
IT | it) 
	   language5=it	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"it"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage5="Italian"
       break
	   ;;
DE | de) 
	   language5=de	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="German - Germany"
	   break
	   ;;
ES | es) 
	   language5=es	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Spanish - Spain"
	   break
	   ;;
FR | fr) 
	   language5=fr	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="French - France"
	   break
	   ;;
JA | ja) 
	   language5=ja	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ja"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage5="Japanese"
	   break
	   ;;
EN-US | en-us) 
	   language5=en-us	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-us"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="English - American"
	   break
	   ;;
EN-GB | en-gb) 
	   language5=en-gb	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-gb"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="English - British"
	   break
	   ;;
ZH-CN | zh-cn) 
	   language5=zh-cn
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-cn"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Chinese - China"
	   break
	   ;;
RU | ru) 
	   language5=ru
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ru"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Russian"
	   break
	   ;;
PT | pt) 
	   language5=pt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Portuguese - Portugal"
	   break
	   ;;
PL | pl) 
	   language5=pl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Polish"
	   break
	   ;;
ES-MX | es-mx) 
	   language5=es-mx
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es-mx"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Spanish - Mexico"
	   break
	   ;;
ZH-HK | zh-hk) 
	   language5=zh-hk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-hk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Chinese - Hong Kong"
	   break
	   ;;
LA | la) 
	   language5=la
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"la"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Latin"
	   break
	   ;;
AF | af) 
	   language5=af
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"af"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Afrikaans"
	   break
	   ;;
AR-SA | ar-sa) 
	   language5=ar-sa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-sa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Arabic - Saudi Arabia"
	   break
	   ;;
AR-EG | ar-eg) 
	   language5=ar-eg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-eg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Arabic - Egypt"
	   break
	   ;;
BG | bg) 
	   language5=bg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"bg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Bulgarian"
	   break
	   ;;
CA | ca) 
	   language5=ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Catalan"
	   break
	   ;;
CS | cs) 
	   language5=cs
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"cs"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Czech"
	   break
	   ;;
DA | da) 
	   language5=da
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"da"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Danish"
	   break
	   ;;
DE-AT | de-at) 
	   language5=de-at
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-at"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="German - Austria"
	   break
	   ;;
DE-CH | de-ch) 
	   language5=de-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="German - Switzerland"
	   break
	   ;;
EL | el) 
	   language5=el
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"el"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Greek"
	   break
	   ;;
EN-AU | en-au) 
	   language5=en-au
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-au"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="English - Australia"
	   break
	   ;;
EN-CA | en-ca) 
	   language5=en-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="English - Canada"
	   break
	   ;;
EN-IN | en-in) 
	   language5=en-in
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-in"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="English - India"
	   break
	   ;;
EN-IE | en-ie) 
	   language5=en-ie
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ie"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="English - Ireland"
	   break
	   ;;
ET | et) 
	   language5=et
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"et"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Estonian"
	   break
	   ;;
FA | fa) 
	   language5=fa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Farsi"
	   break
	   ;;
FI | fi) 
	   language5=fi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Finnish"
	   break
	   ;;
FR-CA | fr-ca) 
	   language5=fr-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="French - Canada"
	   break
	   ;;
FR-CH | fr-ch) 
	   language5=fr-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="French - Switzerland"
	   break
	   ;;
HE | he) 
	   language5=he
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"he"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Hebrew"
	   break
	   ;;
HI | hi) 
	   language5=hi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Hindi"
	   break
	   ;;
HR | hr) 
	   language5=hr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Croatian"
	   break
	   ;;
HU | hu) 
	   language5=hu
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hu"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Hungarian"
	   break
	   ;;
ID | id) 
	   language5=id
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"id"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Indonesian"
	   break
	   ;;
KO | ko) 
	   language5=ko
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ko"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Korean"
	   break
	   ;;
LT | lt) 
	   language5=lt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"lt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Lithuanian"
	   break
	   ;;
MS | ms) 
	   language5=ms
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ms"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Malaysian"
	   break
	   ;;
NL | nl) 
	   language5=nl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Dutch - Netherlands"
	   break
	   ;;
NL-BE | nl-be) 
	   language5=nl-be
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl-be"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Dutch - Netherlands"
	   break
	   ;;
NO | no) 
	   language5=no
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"no"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Norwegian"
	   break
	   ;;
PT-BR | pt-br) 
	   language5=pt-br
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt-br"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Portuguese - Brazil"
	   break
	   ;;
RO | ro) 
	   language5=ro
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ro"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Romanian"
	   break
	   ;;
SK | sk) 
	   language5=sk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Slovak"
	   break
	   ;;
SL | sl) 
	   language5=sl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Slovenian"
	   break
	   ;;
SV | sv) 
	   language5=sv
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sv"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Swedish"
	   break
	   ;;
TA | ta) 
	   language5=ta
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ta"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Tamil"
	   break
	   ;;
TH | th) 
	   language5=th
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"th"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Thai"
	   break
	   ;;
TR | tr) 
	   language5=tr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"tr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Turkish"
	   break
	   ;;
VI | vi) 
	   language5=vi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"vi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Vietnamese"
	   break
	   ;;
ZH-TW | zh-tw) 
	   language5=zh-tw
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-tw"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Chinese - Taiwan"
	   break
	   ;;
 RM | rm) 
       echo -e "\n"
       echo -e "The secondary language tagged with \033[1;45m\033[1;39m###5\033[0m\033[0m tags in \033[1;35m"$baseName".docx\033[0m was removed.\n"
	   sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
	   secondlanguage5="Second Language 5 - removed"
       break
	   ;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
       ;;
esac

done

fi

fi

if [[ "$caption" == "on" ]]; then

if [[ "$secondlanguage5" == "Second Language 5 - removed" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if 	grep -q '###6' ./"$baseName"/"$baseName".txt ; then

if [[ "$language6" == "" ]]; then 
    
echo -e "\033[1;33mATTENTION:\033[0m The 6th secondary language tag \033[1;45m\033[1;39m(###6)\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m hasn't been assigned a value.\n"

while true; do

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
case $answer in
IT | it) 
	   language6=it	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"it"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage6="Italian"
       break
	   ;;
DE | de) 
	   language6=de	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="German - Germany"
	   break
	   ;;
ES | es) 
	   language6=es	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Spanish - Spain"
	   break
	   ;;
FR | fr) 
	   language6=fr	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="French - France"
	   break
	   ;;
JA | ja) 
	   language6=ja	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ja"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage6="Japanese"
	   break
	   ;;
EN-US | en-us) 
	   language6=en-us	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-us"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="English - American"
	   break
	   ;;
EN-GB | en-gb) 
	   language6=en-gb	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-gb"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="English - British"
	   break
	   ;;
ZH-CN | zh-cn) 
	   language6=zh-cn
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-cn"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Chinese - China"
	   break
	   ;;
RU | ru) 
	   language6=ru
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ru"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Russian"
	   break
	   ;;
PT | pt) 
	   language6=pt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Portuguese - Portugal"
	   break
	   ;;
PL | pl) 
	   language6=pl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Polish"
	   break
	   ;;
ES-MX | es-mx) 
	   language6=es-mx
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es-mx"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Spanish - Mexico"
	   break
	   ;;
ZH-HK | zh-hk) 
	   language6=zh-hk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-hk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Chinese - Hong Kong"
	   break
	   ;;
LA | la) 
	   language6=la
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"la"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Latin"
	   break
	   ;;
AF | af) 
	   language6=af
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"af"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Afrikaans"
	   break
	   ;;
AR-SA | ar-sa) 
	   language6=ar-sa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-sa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Arabic - Saudi Arabia"
	   break
	   ;;
AR-EG | ar-eg) 
	   language6=ar-eg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-eg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Arabic - Egypt"
	   break
	   ;;
BG | bg) 
	   language6=bg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"bg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Bulgarian"
	   break
	   ;;
CA | ca) 
	   language6=ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Catalan"
	   break
	   ;;
CS | cs) 
	   language6=cs
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"cs"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Czech"
	   break
	   ;;
DA | da) 
	   language6=da
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"da"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Danish"
	   break
	   ;;
DE-AT | de-at) 
	   language6=de-at
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-at"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="German - Austria"
	   break
	   ;;
DE-CH | de-ch) 
	   language6=de-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="German - Switzerland"
	   break
	   ;;
EL | el) 
	   language6=el
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"el"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Greek"
	   break
	   ;;
EN-AU | en-au) 
	   language6=en-au
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-au"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="English - Australia"
	   break
	   ;;
EN-CA | en-ca) 
	   language6=en-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="English - Canada"
	   break
	   ;;
EN-IN | en-in) 
	   language6=en-in
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-in"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="English - India"
	   break
	   ;;
EN-IE | en-ie) 
	   language6=en-ie
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ie"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="English - Ireland"
	   break
	   ;;
ET | et) 
	   language6=et
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"et"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Estonian"
	   break
	   ;;
FA | fa) 
	   language6=fa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Farsi"
	   break
	   ;;
FI | fi) 
	   language6=fi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Finnish"
	   break
	   ;;
FR-CA | fr-ca) 
	   language6=fr-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="French - Canada"
	   break
	   ;;
FR-CH | fr-ch) 
	   language6=fr-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="French - Switzerland"
	   break
	   ;;
HE | he) 
	   language6=he
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"he"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Hebrew"
	   break
	   ;;
HI | hi) 
	   language6=hi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Hindi"
	   break
	   ;;
HR | hr) 
	   language6=hr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Croatian"
	   break
	   ;;
HU | hu) 
	   language6=hu
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hu"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Hungarian"
	   break
	   ;;
ID | id) 
	   language6=id
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"id"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Indonesian"
	   break
	   ;;
KO | ko) 
	   language6=ko
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ko"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Korean"
	   break
	   ;;
LT | lt) 
	   language6=lt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"lt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Lithuanian"
	   break
	   ;;
MS | ms) 
	   language6=ms
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ms"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Malaysian"
	   break
	   ;;
NL | nl) 
	   language6=nl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Dutch - Netherlands"
	   break
	   ;;
NL-BE | nl-be) 
	   language6=nl-be
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl-be"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Dutch - Netherlands"
	   break
	   ;;
NO | no) 
	   language6=no
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"no"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Norwegian"
	   break
	   ;;
PT-BR | pt-br) 
	   language6=pt-br
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt-br"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Portuguese - Brazil"
	   break
	   ;;
RO | ro) 
	   language6=ro
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ro"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Romanian"
	   break
	   ;;
SK | sk) 
	   language6=sk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Slovak"
	   break
	   ;;
SL | sl) 
	   language6=sl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Slovenian"
	   break
	   ;;
SV | sv) 
	   language6=sv
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sv"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Swedish"
	   break
	   ;;
TA | ta) 
	   language6=ta
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ta"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Tamil"
	   break
	   ;;
TH | th) 
	   language6=th
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"th"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Thai"
	   break
	   ;;
TR | tr) 
	   language6=tr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"tr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Turkish"
	   break
	   ;;
VI | vi) 
	   language6=vi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"vi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Vietnamese"
	   break
	   ;;
ZH-TW | zh-tw) 
	   language6=zh-tw
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-tw"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Chinese - Taiwan"
	   break
	   ;;
 RM | rm) 
       echo -e "\n"
       echo -e "The secondary language tagged with \033[1;45m\033[1;39m###6\033[0m\033[0m tags in \033[1;35m"$baseName".docx\033[0m was removed.\n"
	   sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
	   secondlanguage6="Second Language 6 - removed"
       break
	   ;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
       ;;
esac

done

fi

fi

if [[ "$caption" == "on" ]]; then

if [[ "$secondlanguage6" == "Second Language 6 - removed" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if 	grep -q '###7' ./"$baseName"/"$baseName".txt ; then

if [[ "$language7" == "" ]]; then 
    
echo -e "\033[1;33mATTENTION:\033[0m The 7th secondary language tag \033[1;45m\033[1;39m(###7)\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m hasn't been assigned a value.\n"

while true; do

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
case $answer in
IT | it) 
	   language7=it	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"it"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage7="Italian"
       break
	   ;;
DE | de) 
	   language7=de	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="German - Germany"
	   break
	   ;;
ES | es) 
	   language7=es	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Spanish - Spain"
	   break
	   ;;
FR | fr) 
	   language7=fr	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="French - France"
	   break
	   ;;
JA | ja) 
	   language7=ja	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ja"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage7="Japanese"
	   break
	   ;;
EN-US | en-us) 
	   language7=en-us	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-us"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="English - American"
	   break
	   ;;
EN-GB | en-gb) 
	   language7=en-gb	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-gb"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="English - British"
	   break
	   ;;
ZH-CN | zh-cn) 
	   language7=zh-cn
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-cn"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Chinese - China"
	   break
	   ;;
RU | ru) 
	   language7=ru
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ru"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Russian"
	   break
	   ;;
PT | pt) 
	   language7=pt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Portuguese - Portugal"
	   break
	   ;;
PL | pl) 
	   language7=pl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Polish"
	   break
	   ;;
ES-MX | es-mx) 
	   language7=es-mx
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es-mx"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Spanish - Mexico"
	   break
	   ;;
ZH-HK | zh-hk) 
	   language7=zh-hk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-hk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Chinese - Hong Kong"
	   break
	   ;;
LA | la) 
	   language7=la
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"la"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Latin"
	   break
	   ;;
AF | af) 
	   language7=af
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"af"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Afrikaans"
	   break
	   ;;
AR-SA | ar-sa) 
	   language7=ar-sa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-sa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Arabic - Saudi Arabia"
	   break
	   ;;
AR-EG | ar-eg) 
	   language7=ar-eg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-eg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Arabic - Egypt"
	   break
	   ;;
BG | bg) 
	   language7=bg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"bg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Bulgarian"
	   break
	   ;;
CA | ca) 
	   language7=ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Catalan"
	   break
	   ;;
CS | cs) 
	   language7=cs
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"cs"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Czech"
	   break
	   ;;
DA | da) 
	   language7=da
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"da"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Danish"
	   break
	   ;;
DE-AT | de-at) 
	   language7=de-at
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-at"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="German - Austria"
	   break
	   ;;
DE-CH | de-ch) 
	   language7=de-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="German - Switzerland"
	   break
	   ;;
EL | el) 
	   language7=el
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"el"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Greek"
	   break
	   ;;
EN-AU | en-au) 
	   language7=en-au
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-au"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="English - Australia"
	   break
	   ;;
EN-CA | en-ca) 
	   language7=en-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="English - Canada"
	   break
	   ;;
EN-IN | en-in) 
	   language7=en-in
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-in"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="English - India"
	   break
	   ;;
EN-IE | en-ie) 
	   language7=en-ie
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ie"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="English - Ireland"
	   break
	   ;;
ET | et) 
	   language7=et
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"et"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Estonian"
	   break
	   ;;
FA | fa) 
	   language7=fa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Farsi"
	   break
	   ;;
FI | fi) 
	   language7=fi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Finnish"
	   break
	   ;;
FR-CA | fr-ca) 
	   language7=fr-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="French - Canada"
	   break
	   ;;
FR-CH | fr-ch) 
	   language7=fr-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="French - Switzerland"
	   break
	   ;;
HE | he) 
	   language7=he
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"he"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Hebrew"
	   break
	   ;;
HI | hi) 
	   language7=hi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Hindi"
	   break
	   ;;
HR | hr) 
	   language7=hr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Croatian"
	   break
	   ;;
HU | hu) 
	   language7=hu
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hu"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Hungarian"
	   break
	   ;;
ID | id) 
	   language7=id
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"id"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Indonesian"
	   break
	   ;;
KO | ko) 
	   language7=ko
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ko"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Korean"
	   break
	   ;;
LT | lt) 
	   language7=lt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"lt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Lithuanian"
	   break
	   ;;
MS | ms) 
	   language7=ms
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ms"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Malaysian"
	   break
	   ;;
NL | nl) 
	   language7=nl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Dutch - Netherlands"
	   break
	   ;;
NL-BE | nl-be) 
	   language7=nl-be
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl-be"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Dutch - Netherlands"
	   break
	   ;;
NO | no) 
	   language7=no
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"no"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Norwegian"
	   break
	   ;;
PT-BR | pt-br) 
	   language7=pt-br
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt-br"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Portuguese - Brazil"
	   break
	   ;;
RO | ro) 
	   language7=ro
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ro"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Romanian"
	   break
	   ;;
SK | sk) 
	   language7=sk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Slovak"
	   break
	   ;;
SL | sl) 
	   language7=sl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Slovenian"
	   break
	   ;;
SV | sv) 
	   language7=sv
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sv"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Swedish"
	   break
	   ;;
TA | ta) 
	   language7=ta
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ta"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Tamil"
	   break
	   ;;
TH | th) 
	   language7=th
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"th"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Thai"
	   break
	   ;;
TR | tr) 
	   language7=tr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"tr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Turkish"
	   break
	   ;;
VI | vi) 
	   language7=vi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"vi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Vietnamese"
	   break
	   ;;
ZH-TW | zh-tw) 
	   language7=zh-tw
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-tw"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Chinese - Taiwan"
	   break
	   ;;
 RM | rm) 
       echo -e "\n"
       echo -e "The secondary language tagged with \033[1;45m\033[1;39m###7\033[0m\033[0m tags in \033[1;35m"$baseName".docx\033[0m was removed.\n"
	   sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
	   secondlanguage7="Second Language 7 - removed"
       break
	   ;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
       ;;
esac

done

fi

fi

if [[ "$caption" == "on" ]]; then

if [[ "$secondlanguage7" == "Second Language 7 - removed" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if 	grep -q '###8' ./"$baseName"/"$baseName".txt ; then

if [[ "$language8" == "" ]]; then 
    
echo -e "\033[1;33mATTENTION:\033[0m The 8th secondary language tag \033[1;45m\033[1;39m(###8)\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m hasn't been assigned a value.\n"

while true; do

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
case $answer in
IT | it) 
	   language8=it	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"it"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage8="Italian"
       break
	   ;;
DE | de) 
	   language8=de	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="German - Germany"
	   break
	   ;;
ES | es) 
	   language8=es	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Spanish - Spain"
	   break
	   ;;
FR | fr) 
	   language8=fr	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="French - France"
	   break
	   ;;
JA | ja) 
	   language8=ja	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ja"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage8="Japanese"
	   break
	   ;;
EN-US | en-us) 
	   language8=en-us	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-us"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="English - American"
	   break
	   ;;
EN-GB | en-gb) 
	   language8=en-gb	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-gb"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="English - British"
	   break
	   ;;
ZH-CN | zh-cn) 
	   language8=zh-cn
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-cn"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Chinese - China"
	   break
	   ;;
RU | ru) 
	   language8=ru
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ru"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Russian"
	   break
	   ;;
PT | pt) 
	   language8=pt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Portuguese - Portugal"
	   break
	   ;;
PL | pl) 
	   language8=pl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Polish"
	   break
	   ;;
ES-MX | es-mx) 
	   language8=es-mx
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es-mx"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Spanish - Mexico"
	   break
	   ;;
ZH-HK | zh-hk) 
	   language8=zh-hk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-hk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Chinese - Hong Kong"
	   break
	   ;;
LA | la) 
	   language8=la
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"la"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Latin"
	   break
	   ;;
AF | af) 
	   language8=af
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"af"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Afrikaans"
	   break
	   ;;
AR-SA | ar-sa) 
	   language8=ar-sa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-sa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Arabic - Saudi Arabia"
	   break
	   ;;
AR-EG | ar-eg) 
	   language8=ar-eg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-eg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Arabic - Egypt"
	   break
	   ;;
BG | bg) 
	   language8=bg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"bg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Bulgarian"
	   break
	   ;;
CA | ca) 
	   language8=ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Catalan"
	   break
	   ;;
CS | cs) 
	   language8=cs
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"cs"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Czech"
	   break
	   ;;
DA | da) 
	   language8=da
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"da"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Danish"
	   break
	   ;;
DE-AT | de-at) 
	   language8=de-at
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-at"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="German - Austria"
	   break
	   ;;
DE-CH | de-ch) 
	   language8=de-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="German - Switzerland"
	   break
	   ;;
EL | el) 
	   language8=el
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"el"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Greek"
	   break
	   ;;
EN-AU | en-au) 
	   language8=en-au
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-au"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="English - Australia"
	   break
	   ;;
EN-CA | en-ca) 
	   language8=en-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="English - Canada"
	   break
	   ;;
EN-IN | en-in) 
	   language8=en-in
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-in"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="English - India"
	   break
	   ;;
EN-IE | en-ie) 
	   language8=en-ie
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ie"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="English - Ireland"
	   break
	   ;;
ET | et) 
	   language8=et
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"et"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Estonian"
	   break
	   ;;
FA | fa) 
	   language8=fa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Farsi"
	   break
	   ;;
FI | fi) 
	   language8=fi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Finnish"
	   break
	   ;;
FR-CA | fr-ca) 
	   language8=fr-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="French - Canada"
	   break
	   ;;
FR-CH | fr-ch) 
	   language8=fr-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="French - Switzerland"
	   break
	   ;;
HE | he) 
	   language8=he
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"he"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Hebrew"
	   break
	   ;;
HI | hi) 
	   language8=hi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Hindi"
	   break
	   ;;
HR | hr) 
	   language8=hr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Croatian"
	   break
	   ;;
HU | hu) 
	   language8=hu
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hu"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Hungarian"
	   break
	   ;;
ID | id) 
	   language8=id
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"id"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Indonesian"
	   break
	   ;;
KO | ko) 
	   language8=ko
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ko"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Korean"
	   break
	   ;;
LT | lt) 
	   language8=lt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"lt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Lithuanian"
	   break
	   ;;
MS | ms) 
	   language8=ms
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ms"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Malaysian"
	   break
	   ;;
NL | nl) 
	   language8=nl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Dutch - Netherlands"
	   break
	   ;;
NL-BE | nl-be) 
	   language8=nl-be
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl-be"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Dutch - Netherlands"
	   break
	   ;;
NO | no) 
	   language8=no
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"no"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Norwegian"
	   break
	   ;;
PT-BR | pt-br) 
	   language8=pt-br
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt-br"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Portuguese - Brazil"
	   break
	   ;;
RO | ro) 
	   language8=ro
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ro"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Romanian"
	   break
	   ;;
SK | sk) 
	   language8=sk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Slovak"
	   break
	   ;;
SL | sl) 
	   language8=sl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Slovenian"
	   break
	   ;;
SV | sv) 
	   language8=sv
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sv"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Swedish"
	   break
	   ;;
TA | ta) 
	   language8=ta
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ta"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Tamil"
	   break
	   ;;
TH | th) 
	   language8=th
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"th"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Thai"
	   break
	   ;;
TR | tr) 
	   language8=tr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"tr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Turkish"
	   break
	   ;;
VI | vi) 
	   language8=vi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"vi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Vietnamese"
	   break
	   ;;
ZH-TW | zh-tw) 
	   language8=zh-tw
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-tw"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Chinese - Taiwan"
	   break
	   ;;
 RM | rm) 
       echo -e "\n"
       echo -e "The secondary language tagged with \033[1;45m\033[1;39m###8\033[0m\033[0m tags in \033[1;35m"$baseName".docx\033[0m was removed.\n"
	   sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
	   secondlanguage8="Second Language 8 - removed"
       break
	   ;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
       ;;
esac

done

fi

fi

if [[ "$caption" == "on" ]]; then

if [[ "$secondlanguage8" == "Second Language 8 - removed" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if 	grep -q '###9' ./"$baseName"/"$baseName".txt ; then

if [[ "$language9" == "" ]]; then 
    
echo -e "\033[1;33mATTENTION:\033[0m The 9th secondary language tag \033[1;45m\033[1;39m(###9)\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m hasn't been assigned a value.\n"

while true; do

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
case $answer in
IT | it) 
	   language9=it	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"it"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage9="Italian"
       break
	   ;;
DE | de) 
	   language9=de	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="German - Germany"
	   break
	   ;;
ES | es) 
	   language9=es	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Spanish - Spain"
	   break
	   ;;
FR | fr) 
	   language9=fr	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="French - France"
	   break
	   ;;
JA | ja) 
	   language9=ja	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ja"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
	   secondlanguage9="Japanese"
	   break
	   ;;
EN-US | en-us) 
	   language9=en-us	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-us"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="English - American"
	   break
	   ;;
EN-GB | en-gb) 
	   language9=en-gb	
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-gb"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="English - British"
	   break
	   ;;
ZH-CN | zh-cn) 
	   language9=zh-cn
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-cn"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Chinese - China"
	   break
	   ;;
RU | ru) 
	   language9=ru
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ru"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Russian"
	   break
	   ;;
PT | pt) 
	   language9=pt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Portuguese - Portugal"
	   break
	   ;;
PL | pl) 
	   language9=pl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Polish"
	   break
	   ;;
ES-MX | es-mx) 
	   language9=es-mx
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"es-mx"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Spanish - Mexico"
	   break
	   ;;
ZH-HK | zh-hk) 
	   language9=zh-hk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-hk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Chinese - Hong Kong"
	   break
	   ;;
LA | la) 
	   language9=la
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"la"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Latin"
	   break
	   ;;
AF | af) 
	   language9=af
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"af"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Afrikaans"
	   break
	   ;;
AR-SA | ar-sa) 
	   language9=ar-sa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-sa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Arabic - Saudi Arabia"
	   break
	   ;;
AR-EG | ar-eg) 
	   language9=ar-eg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ar-eg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Arabic - Egypt"
	   break
	   ;;
BG | bg) 
	   language9=bg
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"bg"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Bulgarian"
	   break
	   ;;
CA | ca) 
	   language9=ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Catalan"
	   break
	   ;;
CS | cs) 
	   language9=cs
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"cs"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Czech"
	   break
	   ;;
DA | da) 
	   language9=da
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"da"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Danish"
	   break
	   ;;
DE-AT | de-at) 
	   language9=de-at
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-at"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="German - Austria"
	   break
	   ;;
DE-CH | de-ch) 
	   language9=de-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"de-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="German - Switzerland"
	   break
	   ;;
EL | el) 
	   language9=el
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"el"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Greek"
	   break
	   ;;
EN-AU | en-au) 
	   language9=en-au
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-au"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="English - Australia"
	   break
	   ;;
EN-CA | en-ca) 
	   language9=en-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="English - Canada"
	   break
	   ;;
EN-IN | en-in) 
	   language9=en-in
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-in"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="English - India"
	   break
	   ;;
EN-IE | en-ie) 
	   language9=en-ie
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"en-ie"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="English - Ireland"
	   break
	   ;;
ET | et) 
	   language9=et
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"et"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Estonian"
	   break
	   ;;
FA | fa) 
	   language9=fa
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fa"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Farsi"
	   break
	   ;;
FI | fi) 
	   language9=fi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Finnish"
	   break
	   ;;
FR-CA | fr-ca) 
	   language9=fr-ca
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ca"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="French - Canada"
	   break
	   ;;
FR-CH | fr-ch) 
	   language9=fr-ch
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"fr-ch"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="French - Switzerland"
	   break
	   ;;
HE | he) 
	   language9=he
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"he"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Hebrew"
	   break
	   ;;
HI | hi) 
	   language9=hi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Hindi"
	   break
	   ;;
HR | hr) 
	   language9=hr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Croatian"
	   break
	   ;;
HU | hu) 
	   language9=hu
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"hu"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Hungarian"
	   break
	   ;;
ID | id) 
	   language9=id
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"id"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Indonesian"
	   break
	   ;;
KO | ko) 
	   language9=ko
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ko"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Korean"
	   break
	   ;;
LT | lt) 
	   language9=lt
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"lt"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Lithuanian"
	   break
	   ;;
MS | ms) 
	   language9=ms
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ms"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Malaysian"
	   break
	   ;;
NL | nl) 
	   language9=nl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Dutch - Netherlands"
	   break
	   ;;
NL-BE | nl-be) 
	   language9=nl-be
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"nl-be"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Dutch - Netherlands"
	   break
	   ;;
NO | no) 
	   language9=no
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"no"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Norwegian"
	   break
	   ;;
PT-BR | pt-br) 
	   language9=pt-br
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"pt-br"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Portuguese - Brazil"
	   break
	   ;;
RO | ro) 
	   language9=ro
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ro"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Romanian"
	   break
	   ;;
SK | sk) 
	   language9=sk
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sk"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Slovak"
	   break
	   ;;
SL | sl) 
	   language9=sl
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sl"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Slovenian"
	   break
	   ;;
SV | sv) 
	   language9=sv
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"sv"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Swedish"
	   break
	   ;;
TA | ta) 
	   language9=ta
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"ta"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Tamil"
	   break
	   ;;
TH | th) 
	   language9=th
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"th"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Thai"
	   break
	   ;;
TR | tr) 
	   language9=tr
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"tr"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Turkish"
	   break
	   ;;
VI | vi) 
	   language9=vi
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"vi"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Vietnamese"
	   break
	   ;;
ZH-TW | zh-tw) 
	   language9=zh-tw
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"zh-tw"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Chinese - Taiwan"
	   break
	   ;;
 RM | rm) 
       echo -e "\n"
       echo -e "The secondary language tagged with \033[1;45m\033[1;39m###9\033[0m\033[0m tags in \033[1;35m"$baseName".docx\033[0m was removed.\n"
	   sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt
	   secondlanguage9="Second Language 9 - removed"
       break
	   ;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
       ;;
esac

done

fi

fi

if [[ "$caption" == "on" ]]; then

if [[ "$secondlanguage9" == "Second Language 9 - removed" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

# Check if language voices are installed

if [[ "$language1" == "it" ]] || [[ "$language2" == "it" ]] ||  [[ "$language3" == "it" ]] ||  [[ "$language4" == "it" ]] ||  [[ "$language5" == "it" ]] ||  [[ "$language6" == "it" ]] ||  [[ "$language7" == "it" ]] ||  [[ "$language8" == "it" ]] ||  [[ "$language9" == "it" ]] ; then 

if ! "C:\balcon\balcon.exe" -l 2> /dev/null | grep -q -w 'Elsa' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Elsa not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "it" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Italian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "it" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Italian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "it" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Italian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "it" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Italian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "it" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Italian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "it" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Italian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "it" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Italian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "it" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Italian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "it" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Italian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "fr" ]] || [[ "$language2" == "fr" ]] ||  [[ "$language3" == "fr" ]] ||  [[ "$language4" == "fr" ]] ||  [[ "$language5" == "fr" ]] ||  [[ "$language6" == "fr" ]] ||  [[ "$language7" == "fr" ]] ||  [[ "$language8" == "fr" ]] ||  [[ "$language9" == "fr" ]] ; then 

if ! "C:\balcon\balcon.exe" -l | grep -q  -w 'Hortense' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Hortense not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "fr" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="French - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "fr" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="French - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "fr" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="French - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "fr" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="French - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "fr" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="French - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "fr" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="French - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "fr" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="French - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "fr" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="French - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "fr" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="French - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "de" ]] || [[ "$language2" == "de" ]] ||  [[ "$language3" == "de" ]] ||  [[ "$language4" == "de" ]] ||  [[ "$language5" == "de" ]] ||  [[ "$language6" == "de" ]] ||  [[ "$language7" == "de" ]] ||  [[ "$language8" == "de" ]] ||  [[ "$language9" == "de" ]] ; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Hedda' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Hedda not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "de" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="German - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "de" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="German - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "de" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="German - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "de" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="German - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "de" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="German - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "de" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="German - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "de" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="German - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "de" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="German - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "de" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="German - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "es" ]] || [[ "$language2" == "es" ]] ||  [[ "$language3" == "es" ]] ||  [[ "$language4" == "es" ]] ||  [[ "$language5" == "es" ]] ||  [[ "$language6" == "es" ]] ||  [[ "$language7" == "es" ]] ||  [[ "$language8" == "es" ]] ||  [[ "$language9" == "es" ]] ; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Helena' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Helena not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "es" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Spanish - Spain - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "es" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Spanish - Spain - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "es" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Spanish - Spain - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "es" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Spanish - Spain - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "es" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Spanish - Spain - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "es" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Spanish - Spain - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "es" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Spanish - Spain - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "es" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Spanish - Spain - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "es" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Spanish - Spain - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "ja" ]] || [[ "$language2" == "ja" ]] ||  [[ "$language3" == "ja" ]] ||  [[ "$language4" == "ja" ]] ||  [[ "$language5" == "ja" ]] ||  [[ "$language6" == "ja" ]] ||  [[ "$language7" == "ja" ]] ||  [[ "$language8" == "ja" ]] ||  [[ "$language9" == "ja" ]] ; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Haruka' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Haruka not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "ja" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Japanese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "ja" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Japanese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "ja" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Japanese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "ja" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Japanese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "ja" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Japanese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "ja" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Japanese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "ja" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Japanese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "ja" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Japanese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "ja" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Japanese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "en-us" ]] || [[ "$language2" == "en-us" ]] ||  [[ "$language3" == "en-us" ]] ||  [[ "$language4" == "en-us" ]] ||  [[ "$language5" == "en-us" ]] ||  [[ "$language6" == "en-us" ]] ||  [[ "$language7" == "en-us" ]] ||  [[ "$language8" == "en-us" ]] ||  [[ "$language9" == "en-us" ]] ; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Mark' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Mark not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "en-us" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="English - American - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "en-us" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="English - American - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "en-us" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="English - American - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "en-us" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="English - American - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "en-us" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="English - American - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "en-us" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="English - American - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "en-us" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="English - American - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "en-us" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="English - American - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "en-us" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="English - American - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "en-gb" ]] || [[ "$language2" == "en-gb" ]] ||  [[ "$language3" == "en-gb" ]] ||  [[ "$language4" == "en-gb" ]] ||  [[ "$language5" == "en-gb" ]] ||  [[ "$language6" == "en-gb" ]] ||  [[ "$language7" == "en-gb" ]] ||  [[ "$language8" == "en-gb" ]] ||  [[ "$language9" == "en-gb" ]] ; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Hazel' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Hazel not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "en-gb" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="English - British - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "en-gb" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="English - British - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "en-gb" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="English - British - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "en-gb" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="English - British - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "en-gb" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="English - British - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "en-gb" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="English - British - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "en-gb" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="English - British - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "en-gb" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="English - British - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "en-gb" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="English - British - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "zh-cn" ]] || [[ "$language2" == "zh-cn" ]] ||  [[ "$language3" == "zh-cn" ]] ||  [[ "$language4" == "zh-cn" ]] ||  [[ "$language5" == "zh-cn" ]] ||  [[ "$language6" == "zh-cn" ]] ||  [[ "$language7" == "zh-cn" ]] ||  [[ "$language8" == "zh-cn" ]] ||  [[ "$language9" == "zh-cn" ]] ; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Huihui' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Huihui not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "zh-cn" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Chinese - China - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "zh-cn" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Chinese - China - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "zh-cn" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Chinese - China - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "zh-cn" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Chinese - China - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "zh-cn" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Chinese - China - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "zh-cn" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Chinese - China - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "zh-cn" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Chinese - China - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "zh-cn" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Chinese - China - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "zh-cn" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Chinese - China - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "zh-hk" ]] || [[ "$language2" == "zh-hk" ]] ||  [[ "$language3" == "zh-hk" ]] ||  [[ "$language4" == "zh-hk" ]] ||  [[ "$language5" == "zh-hk" ]] ||  [[ "$language6" == "zh-hk" ]] ||  [[ "$language7" == "zh-hk" ]] ||  [[ "$language8" == "zh-hk" ]] ||  [[ "$language9" == "zh-hk" ]] ; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Tracy' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Tracy not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "zh-hk" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Chinese - Hong Kong - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "zh-hk" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Chinese - Hong Kong - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "zh-hk" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Chinese - Hong Kong - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "zh-hk" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Chinese - Hong Kong - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "zh-hk" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Chinese - Hong Kong - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "zh-hk" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Chinese - Hong Kong - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "zh-hk" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Chinese - Hong Kong - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "zh-hk" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Chinese - Hong Kong - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "zh-hk" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Chinese - Hong Kong - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "ru" ]] || [[ "$language2" == "ru" ]] ||  [[ "$language3" == "ru" ]] ||  [[ "$language4" == "ru" ]] ||  [[ "$language5" == "ru" ]] ||  [[ "$language6" == "ru" ]] ||  [[ "$language7" == "ru" ]] ||  [[ "$language8" == "ru" ]] ||  [[ "$language9" == "ru" ]] ; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Irina' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Irina not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "ru" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Russian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "ru" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Russian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "ru" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Russian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "ru" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Russian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "ru" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Russian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "ru" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Russian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "ru" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Russian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "ru" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Russian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "ru" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Russian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "es-mx" ]] || [[ "$language2" == "es-mx" ]] ||  [[ "$language3" == "es-mx" ]] ||  [[ "$language4" == "es-mx" ]] ||  [[ "$language5" == "es-mx" ]] ||  [[ "$language6" == "es-mx" ]] ||  [[ "$language7" == "es-mx" ]] ||  [[ "$language8" == "es-mx" ]] ||  [[ "$language9" == "es-mx" ]] ; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Sabina' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Sabina not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "es-mx" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Spanish - Mexico - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "es-mx" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Spanish - Mexico - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "es-mx" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Spanish - Mexico - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "es-mx" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Spanish - Mexico - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "es-mx" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Spanish - Mexico - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "es-mx" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Spanish - Mexico - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "es-mx" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Spanish - Mexico - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "es-mx" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Spanish - Mexico - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "es-mx" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Spanish - Mexico - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "pt" ]] || [[ "$language2" == "pt" ]] ||  [[ "$language3" == "pt" ]] ||  [[ "$language4" == "pt" ]] ||  [[ "$language5" == "pt" ]] ||  [[ "$language6" == "pt" ]] ||  [[ "$language7" == "pt" ]] ||  [[ "$language8" == "pt" ]] ||  [[ "$language9" == "pt" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Helia' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Helia not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "pt" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Portuguese - Portugal - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "pt" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Portuguese - Portugal - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "pt" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Portuguese - Portugal - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "pt" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Portuguese - Portugal - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "pt" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Portuguese - Portugal - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "pt" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Portuguese - Portugal - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "pt" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Portuguese - Portugal - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "pt" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Portuguese - Portugal - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "pt" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Portuguese - Portugal - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "pl" ]] || [[ "$language2" == "pl" ]] ||  [[ "$language3" == "pl" ]] ||  [[ "$language4" == "pl" ]] ||  [[ "$language5" == "pl" ]] ||  [[ "$language6" == "pl" ]] ||  [[ "$language7" == "pl" ]] ||  [[ "$language8" == "pl" ]] ||  [[ "$language9" == "pl" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Paulina' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Paulina not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "pl" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Polish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "pl" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Polish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "pl" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Polish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "pl" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Polish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "pl" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Polish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "pl" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Polish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "pl" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Polish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "pl" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Polish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "pl" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Polish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "la" ]] ||  [[ "$language2" == "la" ]] ||  [[ "$language3" == "la" ]] ||  [[ "$language4" == "la" ]] ||  [[ "$language5" == "la" ]] ||  [[ "$language6" == "la" ]] ||  [[ "$language7" == "la" ]] ||  [[ "$language8" == "la" ]] ||  [[ "$language9" == "la" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'mb-la1' 2> /dev/null ; then

echo -e "\033[1;31mError: Mbrola Latin voice not installed. Follow these steps to install additional voices on your PC (https://github.com/numediart/MBROLA-voices). Will not process Latin text...\033[0m\n" >&2

if [[ "$language1" == "la" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Latin - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "la" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Latin - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "la" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Latin - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "la" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Latin - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "la" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Latin - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "la" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Latin - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "la" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Latin - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "la" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Latin - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "la" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Latin - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "fa" ]] ||  [[ "$language2" == "fa" ]] ||  [[ "$language3" == "fa" ]] ||  [[ "$language4" == "fa" ]] ||  [[ "$language5" == "fa" ]] ||  [[ "$language6" == "fa" ]] ||  [[ "$language7" == "fa" ]] ||  [[ "$language8" == "fa" ]] ||  [[ "$language9" == "fa" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'mb-ir1' 2> /dev/null ; then

echo -e "\033[1;31mError: Mbrola Farsi voice not installed. Follow these steps to install additional voices on your PC (https://github.com/numediart/MBROLA-voices). Will not process Persian text...\033[0m\n" >&2

if [[ "$language1" == "fa" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Farsi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "fa" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Farsi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "fa" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Farsi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "fa" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Farsi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "fa" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Farsi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "fa" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Farsi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "fa" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Farsi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "fa" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Farsi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "fa" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Farsi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "af" ]] ||  [[ "$language2" == "af" ]] ||  [[ "$language3" == "af" ]] ||  [[ "$language4" == "af" ]] ||  [[ "$language5" == "af" ]] ||  [[ "$language6" == "af" ]] ||  [[ "$language7" == "af" ]] ||  [[ "$language8" == "af" ]] ||  [[ "$language9" == "af" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'mb-af1' 2> /dev/null ; then

echo -e "\033[1;31mError: Mbrola Afrikaans voice not installed. Follow these steps to install additional voices on your PC (https://github.com/numediart/MBROLA-voices). Will not process Persian text...\033[0m\n" >&2

if [[ "$language1" == "af" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Afrikaans - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "af" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Afrikaans - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "af" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Afrikaans - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "af" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Afrikaans - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "af" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Afrikaans - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "af" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Afrikaans - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "af" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Afrikaans - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "af" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Afrikaans - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "af" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Afrikaans - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "et" ]] ||  [[ "$language2" == "et" ]] ||  [[ "$language3" == "et" ]] ||  [[ "$language4" == "et" ]] ||  [[ "$language5" == "et" ]] ||  [[ "$language6" == "et" ]] ||  [[ "$language7" == "et" ]] ||  [[ "$language8" == "et" ]] ||  [[ "$language9" == "et" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'mb-ee1' 2> /dev/null ; then

echo -e "\033[1;31mError: Mbrola Estonian voice not installed. Follow these steps to install additional voices on your PC (https://github.com/numediart/MBROLA-voices). Will not process Persian text...\033[0m\n" >&2

if [[ "$language1" == "et" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Estonian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "et" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Estonian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "et" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Estonian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "et" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Estonian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "et" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Estonian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "et" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Estonian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "et" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Estonian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "et" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Estonian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "et" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Estonian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "lt" ]] ||  [[ "$language2" == "lt" ]] ||  [[ "$language3" == "lt" ]] ||  [[ "$language4" == "lt" ]] ||  [[ "$language5" == "lt" ]] ||  [[ "$language6" == "lt" ]] ||  [[ "$language7" == "lt" ]] ||  [[ "$language8" == "lt" ]] ||  [[ "$language9" == "lt" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'mb-lt1' 2> /dev/null ; then

echo -e "\033[1;31mError: Mbrola Lithuanian voice not installed. Follow these steps to install additional voices on your PC (https://github.com/numediart/MBROLA-voices). Will not process Persian text...\033[0m\n" >&2

if [[ "$language1" == "lt" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Lithuanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "lt" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Lithuanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "lt" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Lithuanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "lt" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Lithuanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "lt" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Lithuanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "lt" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Lithuanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "lt" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Lithuanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "lt" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Lithuanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "lt" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Lithuanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "ar-sa" ]] || [[ "$language2" == "ar-sa" ]] ||  [[ "$language3" == "ar-sa" ]] ||  [[ "$language4" == "ar-sa" ]] ||  [[ "$language5" == "ar-sa" ]] ||  [[ "$language6" == "ar-sa" ]] ||  [[ "$language7" == "ar-sa" ]] ||  [[ "$language8" == "ar-sa" ]] ||  [[ "$language9" == "ar-sa" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Naayf' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Naayf not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "ar-sa" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Arabic - Saudi Arabia - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "ar-sa" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Arabic - Saudi Arabia - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "ar-sa" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Arabic - Saudi Arabia - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "ar-sa" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Arabic - Saudi Arabia - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "ar-sa" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Arabic - Saudi Arabia - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "ar-sa" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Arabic - Saudi Arabia - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "ar-sa" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Arabic - Saudi Arabia - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "ar-sa" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Arabic - Saudi Arabia - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "ar-sa" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Arabic - Saudi Arabia - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "ar-eg" ]] || [[ "$language2" == "ar-eg" ]] ||  [[ "$language3" == "ar-eg" ]] ||  [[ "$language4" == "ar-eg" ]] ||  [[ "$language5" == "ar-eg" ]] ||  [[ "$language6" == "ar-eg" ]] ||  [[ "$language7" == "ar-eg" ]] ||  [[ "$language8" == "ar-eg" ]] ||  [[ "$language9" == "ar-eg" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Hoda' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Hoda not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "ar-eg" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Arabic - Egypt - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "ar-eg" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Arabic - Egypt - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "ar-eg" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Arabic - Egypt - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "ar-eg" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Arabic - Egypt - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "ar-eg" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Arabic - Egypt - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "ar-eg" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Arabic - Egypt - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "ar-eg" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Arabic - Egypt - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "ar-eg" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Arabic - Egypt - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "ar-eg" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Arabic - Egypt - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "bg" ]] || [[ "$language2" == "bg" ]] ||  [[ "$language3" == "bg" ]] ||  [[ "$language4" == "bg" ]] ||  [[ "$language5" == "bg" ]] ||  [[ "$language6" == "bg" ]] ||  [[ "$language7" == "bg" ]] ||  [[ "$language8" == "bg" ]] ||  [[ "$language9" == "bg" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Ivan' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Ivan not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "bg" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Bulgarian- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "bg" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Bulgarian- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "bg" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Bulgarian- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "bg" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Bulgarian- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "bg" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Bulgarian- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "bg" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Bulgarian- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "bg" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Bulgarian- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "bg" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Bulgarian- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "bg" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Bulgarian- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "ca" ]] || [[ "$language2" == "ca" ]] ||  [[ "$language3" == "ca" ]] ||  [[ "$language4" == "ca" ]] ||  [[ "$language5" == "ca" ]] ||  [[ "$language6" == "ca" ]] ||  [[ "$language7" == "ca" ]] ||  [[ "$language8" == "ca" ]] ||  [[ "$language9" == "ca" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Herena' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Herena not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "ca" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Catalan- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "ca" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Catalan- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "ca" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Catalan- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "ca" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Catalan- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "ca" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Catalan- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "ca" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Catalan- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "ca" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Catalan- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "ca" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Catalan- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "ca" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Catalan- removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "cs" ]] || [[ "$language2" == "cs" ]] ||  [[ "$language3" == "cs" ]] ||  [[ "$language4" == "cs" ]] ||  [[ "$language5" == "cs" ]] ||  [[ "$language6" == "cs" ]] ||  [[ "$language7" == "cs" ]] ||  [[ "$language8" == "cs" ]] ||  [[ "$language9" == "cs" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Jakub' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Jakub not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "cs" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Czech - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "cs" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage12="Czech - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "cs" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Czech - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "cs" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Czech - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "cs" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Czech - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "cs" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Czech - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "cs" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Czech - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "cs" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Czech - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "cs" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Czech - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "da" ]] || [[ "$language2" == "da" ]] ||  [[ "$language3" == "da" ]] ||  [[ "$language4" == "da" ]] ||  [[ "$language5" == "da" ]] ||  [[ "$language6" == "da" ]] ||  [[ "$language7" == "da" ]] ||  [[ "$language8" == "da" ]] ||  [[ "$language9" == "da" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Helle' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Helle not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "da" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Danish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "da" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Danish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "da" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Danish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "da" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Danish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "da" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Danish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "da" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Danish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "da" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Danish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "da" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Danish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "da" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Danish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "de-at" ]] || [[ "$language2" == "de-at" ]] ||  [[ "$language3" == "de-at" ]] ||  [[ "$language4" == "de-at" ]] ||  [[ "$language5" == "de-at" ]] ||  [[ "$language6" == "de-at" ]] ||  [[ "$language7" == "de-at" ]] ||  [[ "$language8" == "de-at" ]] ||  [[ "$language9" == "de-at" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Michael' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Michael not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "de-at" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="German - Austria - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "de-at" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="German - Austria - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "de-at" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="German - Austria - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "de-at" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="German - Austria - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "de-at" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="German - Austria - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "de-at" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="German - Austria - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "de-at" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="German - Austria - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "de-at" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="German - Austria - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "de-at" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="German - Austria - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "de-ch" ]] || [[ "$language2" == "de-ch" ]] ||  [[ "$language3" == "de-ch" ]] ||  [[ "$language4" == "de-ch" ]] ||  [[ "$language5" == "de-ch" ]] ||  [[ "$language6" == "de-ch" ]] ||  [[ "$language7" == "de-ch" ]] ||  [[ "$language8" == "de-ch" ]] ||  [[ "$language9" == "de-ch" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Karsten' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Karsten not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "de-ch" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="German - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "de-ch" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="German - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "de-ch" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="German - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "de-ch" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="German - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "de-ch" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="German - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "de-ch" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="German - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "de-ch" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="German - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "de-ch" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="German - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "de-ch" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="German - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "el" ]] || [[ "$language2" == "el" ]] ||  [[ "$language3" == "el" ]] ||  [[ "$language4" == "el" ]] ||  [[ "$language5" == "el" ]] ||  [[ "$language6" == "el" ]] ||  [[ "$language7" == "el" ]] ||  [[ "$language8" == "el" ]] ||  [[ "$language9" == "el" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Stefanos' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Stefanos not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "el" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "el" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "el" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "el" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "el" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "el" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "el" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "el" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "el" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "en-au" ]] || [[ "$language2" == "en-au" ]] ||  [[ "$language3" == "en-au" ]] ||  [[ "$language4" == "en-au" ]] ||  [[ "$language5" == "en-au" ]] ||  [[ "$language6" == "en-au" ]] ||  [[ "$language7" == "en-au" ]] ||  [[ "$language8" == "en-au" ]] ||  [[ "$language9" == "en-au" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'James' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft James not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "en-au" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="English - Australian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "en-au" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="English - Australian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "en-au" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="English - Australian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "en-au" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="English - Australian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "en-au" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="English - Australian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "en-au" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="English - Australian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "en-au" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="English - Australian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "en-au" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="English - Australian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "en-au" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="English - Australian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "en-ca" ]] || [[ "$language2" == "en-ca" ]] ||  [[ "$language3" == "en-ca" ]] ||  [[ "$language4" == "en-ca" ]] ||  [[ "$language5" == "en-ca" ]] ||  [[ "$language6" == "en-ca" ]] ||  [[ "$language7" == "en-ca" ]] ||  [[ "$language8" == "en-ca" ]] ||  [[ "$language9" == "en-ca" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Linda' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Linda not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "en-ca" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="English - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "en-ca" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="English - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "en-ca" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="English - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "en-ca" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="English - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "en-ca" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="English - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "en-ca" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="English - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "en-ca" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="English - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "en-ca" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="English - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "en-ca" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="English - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi
fi

fi

if [[ "$language1" == "en-in" ]] || [[ "$language2" == "en-in" ]] ||  [[ "$language3" == "en-in" ]] ||  [[ "$language4" == "en-in" ]] ||  [[ "$language5" == "en-in" ]] ||  [[ "$language6" == "en-in" ]] ||  [[ "$language7" == "en-in" ]] ||  [[ "$language8" == "en-in" ]] ||  [[ "$language9" == "en-in" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Ravi' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Ravi not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "en-in" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="English - India - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "en-in" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="English - India - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "en-in" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="English - India - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "en-in" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="English - India - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "en-in" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="English - India - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "en-in" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="English - India - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "en-in" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="English - India - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "en-in" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="English - India - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "en-in" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="English - India - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "en-ie" ]] || [[ "$language2" == "en-ie" ]] ||  [[ "$language3" == "en-ie" ]] ||  [[ "$language4" == "en-ie" ]] ||  [[ "$language5" == "en-ie" ]] ||  [[ "$language6" == "en-ie" ]] ||  [[ "$language7" == "en-ie" ]] ||  [[ "$language8" == "en-ie" ]] ||  [[ "$language9" == "en-ie" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Sean' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Sean not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "en-ie" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="English - Ireland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "en-ie" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="English - Ireland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "en-ie" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="English - Ireland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "en-ie" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="English - Ireland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "en-ie" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="English - Ireland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "en-ie" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="English - Ireland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "en-ie" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="English - Ireland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "en-ie" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="English - Ireland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "en-ie" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="English - Ireland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "fi" ]] || [[ "$language2" == "fi" ]] ||  [[ "$language3" == "fi" ]] ||  [[ "$language4" == "fi" ]] ||  [[ "$language5" == "fi" ]] ||  [[ "$language6" == "fi" ]] ||  [[ "$language7" == "fi" ]] ||  [[ "$language8" == "fi" ]] ||  [[ "$language9" == "fi" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Heidi' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Heidi not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "fi" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Finnish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "fi" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Finnish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "fi" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Finnish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "fi" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Finnish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "fi" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Finnish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "fi" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Finnish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "fi" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Finnish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "fi" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Finnish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "fi" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Finnish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "fr-ca" ]] || [[ "$language2" == "fr-ca" ]] ||  [[ "$language3" == "fr-ca" ]] ||  [[ "$language4" == "fr-ca" ]] ||  [[ "$language5" == "fr-ca" ]] ||  [[ "$language6" == "fr-ca" ]] ||  [[ "$language7" == "fr-ca" ]] ||  [[ "$language8" == "fr-ca" ]] ||  [[ "$language9" == "fr-ca" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Claude' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Claude not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "fr-ca" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="French - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "fr-ca" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="French - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "fr-ca" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="French - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "fr-ca" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="French - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "fr-ca" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="French - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "fr-ca" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="French - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "fr-ca" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="French - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "fr-ca" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="French - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "fr-ca" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="French - Canada - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "fr-ch" ]] || [[ "$language2" == "fr-ch" ]] ||  [[ "$language3" == "fr-ch" ]] ||  [[ "$language4" == "fr-ch" ]] ||  [[ "$language5" == "fr-ch" ]] ||  [[ "$language6" == "fr-ch" ]] ||  [[ "$language7" == "fr-ch" ]] ||  [[ "$language8" == "fr-ch" ]] ||  [[ "$language9" == "fr-ch" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Guillaume' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Guillaume not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "fr-ch" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="French - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "fr-ch" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="French - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "fr-ch" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="French - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "fr-ch" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="French - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "fr-ch" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="French - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "fr-ch" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="French - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "fr-ch" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="French - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "fr-ch" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="French - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "fr-ch" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="French - Switzerland - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "he" ]] || [[ "$language2" == "he" ]] ||  [[ "$language3" == "he" ]] ||  [[ "$language4" == "he" ]] ||  [[ "$language5" == "he" ]] ||  [[ "$language6" == "he" ]] ||  [[ "$language7" == "he" ]] ||  [[ "$language8" == "he" ]] ||  [[ "$language9" == "he" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Asaf' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Asaf not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "he" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Hebrew - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "he" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Hebrew - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "he" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Hebrew - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "he" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Hebrew - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "he" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Hebrew - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "he" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Hebrew - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "he" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Hebrew - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "he" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Hebrew - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "he" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Hebrew - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "hi" ]] || [[ "$language2" == "hi" ]] ||  [[ "$language3" == "hi" ]] ||  [[ "$language4" == "hi" ]] ||  [[ "$language5" == "hi" ]] ||  [[ "$language6" == "hi" ]] ||  [[ "$language7" == "hi" ]] ||  [[ "$language8" == "hi" ]] ||  [[ "$language9" == "hi" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Hemant' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Hemant not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "hi" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Hindi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "hi" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Hindi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "hi" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Hindi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "hi" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Hindi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "hi" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Hindi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "hi" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Hindi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "hi" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Hindi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "hi" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Hindi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "hi" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Hindi - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "hr" ]] || [[ "$language2" == "hr" ]] ||  [[ "$language3" == "hr" ]] ||  [[ "$language4" == "hr" ]] ||  [[ "$language5" == "hr" ]] ||  [[ "$language6" == "hr" ]] ||  [[ "$language7" == "hr" ]] ||  [[ "$language8" == "hr" ]] ||  [[ "$language9" == "hr" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Matej' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Matej not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "hr" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Croatian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "hr" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Croatian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "hr" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Croatian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "hr" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Croatian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "hr" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Croatian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "hr" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Croatian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "hr" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Croatian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "hr" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Croatian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "hr" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Croatian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "hu" ]] || [[ "$language2" == "hu" ]] ||  [[ "$language3" == "hu" ]] ||  [[ "$language4" == "hu" ]] ||  [[ "$language5" == "hu" ]] ||  [[ "$language6" == "hu" ]] ||  [[ "$language7" == "hu" ]] ||  [[ "$language8" == "hu" ]] ||  [[ "$language9" == "hu" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Szabolcs' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Szabolcs not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "hu" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Hungarian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "hu" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Hungarian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "hu" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Hungarian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "hu" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Hungarian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "hu" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Hungarian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "hu" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Hungarian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "hu" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Hungarian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "hu" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Hungarian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "hu" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Hungarian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "id" ]] || [[ "$language2" == "id" ]] ||  [[ "$language3" == "id" ]] ||  [[ "$language4" == "id" ]] ||  [[ "$language5" == "id" ]] ||  [[ "$language6" == "id" ]] ||  [[ "$language7" == "id" ]] ||  [[ "$language8" == "id" ]] ||  [[ "$language9" == "id" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Andika' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Andika not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "id" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Indonesian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "id" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Indonesian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "id" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Indonesian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "id" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Indonesian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "id" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Indonesian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "id" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Indonesian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "id" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Indonesian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "id" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Indonesian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "id" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Indonesian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "ko" ]] || [[ "$language2" == "ko" ]] ||  [[ "$language3" == "ko" ]] ||  [[ "$language4" == "ko" ]] ||  [[ "$language5" == "ko" ]] ||  [[ "$language6" == "ko" ]] ||  [[ "$language7" == "ko" ]] ||  [[ "$language8" == "ko" ]] ||  [[ "$language9" == "ko" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Heami' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Andika not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "ko" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Korean - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "ko" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Korean - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "ko" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Korean - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "ko" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Korean - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "ko" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Korean - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "ko" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Korean - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "ko" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Korean - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "ko" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Korean - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "ko" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Korean - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "ms" ]] || [[ "$language2" == "ms" ]] ||  [[ "$language3" == "ms" ]] ||  [[ "$language4" == "ms" ]] ||  [[ "$language5" == "ms" ]] ||  [[ "$language6" == "ms" ]] ||  [[ "$language7" == "ms" ]] ||  [[ "$language8" == "ms" ]] ||  [[ "$language9" == "ms" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Rizwan' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Rizwan not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "ms" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Malaysian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "ms" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Malaysian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "ms" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Malaysian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "ms" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Malaysian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "ms" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Malaysian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "ms" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Malaysian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "ms" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Malaysian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "ms" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Malaysian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "ms" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Malaysian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "nl" ]] || [[ "$language2" == "nl" ]] ||  [[ "$language3" == "nl" ]] ||  [[ "$language4" == "nl" ]] ||  [[ "$language5" == "nl" ]] ||  [[ "$language6" == "nl" ]] ||  [[ "$language7" == "nl" ]] ||  [[ "$language8" == "nl" ]] ||  [[ "$language9" == "nl" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Frank' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Frank not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "nl" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Dutch - Netherlands - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "nl" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Dutch - Netherlands - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "nl" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Dutch - Netherlands - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "nl" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Dutch - Netherlands - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "nl" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Dutch - Netherlands - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "nl" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Dutch - Netherlands - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "nl" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Dutch - Netherlands - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "nl" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Dutch - Netherlands - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "nl" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Dutch - Netherlands - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "nl-be" ]] || [[ "$language2" == "nl-be" ]] ||  [[ "$language3" == "nl-be" ]] ||  [[ "$language4" == "nl-be" ]] ||  [[ "$language5" == "nl-be" ]] ||  [[ "$language6" == "nl-be" ]] ||  [[ "$language7" == "nl-be" ]] ||  [[ "$language8" == "nl-be" ]] ||  [[ "$language9" == "nl-be" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Bart' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Bart not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "nl-be" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Dutch - Belgium - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "nl-be" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Dutch - Belgium - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "nl-be" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Dutch - Belgium - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "nl-be" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Dutch - Belgium - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "nl-be" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Dutch - Belgium - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "nl-be" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Dutch - Belgium - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "nl-be" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Dutch - Belgium - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "nl-be" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Dutch - Belgium - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "nl-be" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Dutch - Belgium - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "no" ]] || [[ "$language2" == "no" ]] ||  [[ "$language3" == "no" ]] ||  [[ "$language4" == "no" ]] ||  [[ "$language5" == "no" ]] ||  [[ "$language6" == "no" ]] ||  [[ "$language7" == "no" ]] ||  [[ "$language8" == "no" ]] ||  [[ "$language9" == "no" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Jon' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Jon not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "no" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Norwegian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "no" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Norwegian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "no" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Norwegian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "no" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Norwegian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "no" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Norwegian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "no" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Norwegian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "no" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Norwegian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "no" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Norwegian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "no" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Norwegian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "pt-br" ]] || [[ "$language2" == "pt-br" ]] ||  [[ "$language3" == "pt-br" ]] ||  [[ "$language4" == "pt-br" ]] ||  [[ "$language5" == "pt-br" ]] ||  [[ "$language6" == "pt-br" ]] ||  [[ "$language7" == "pt-br" ]] ||  [[ "$language8" == "pt-br" ]] ||  [[ "$language9" == "pt-br" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Maria' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Maria not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "pt-br" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Portuguese - Brazil - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "pt-br" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Portuguese - Brazil - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "pt-br" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Portuguese - Brazil - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "pt-br" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Portuguese - Brazil - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "pt-br" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Portuguese - Brazil - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "pt-br" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Portuguese - Brazil - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "pt-br" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Portuguese - Brazil - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "pt-br" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Portuguese - Brazil - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "pt-br" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Portuguese - Brazil - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "ro" ]] || [[ "$language2" == "ro" ]] ||  [[ "$language3" == "ro" ]] ||  [[ "$language4" == "ro" ]] ||  [[ "$language5" == "ro" ]] ||  [[ "$language6" == "ro" ]] ||  [[ "$language7" == "ro" ]] ||  [[ "$language8" == "ro" ]] ||  [[ "$language9" == "ro" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Andrei' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Andrei not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "ro" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Romanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "ro" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Romanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "ro" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Romanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "ro" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Romanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "ro" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Romanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "ro" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Romanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "ro" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Romanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "ro" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Romanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "ro" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Romanian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "sk" ]] || [[ "$language2" == "sk" ]] ||  [[ "$language3" == "sk" ]] ||  [[ "$language4" == "sk" ]] ||  [[ "$language5" == "sk" ]] ||  [[ "$language6" == "sk" ]] ||  [[ "$language7" == "sk" ]] ||  [[ "$language8" == "sk" ]] ||  [[ "$language9" == "sk" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Filip' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Filip not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "sk" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Slovak - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "sk" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2"Slovak - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "sk" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Slovak - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "sk" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Slovak - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "sk" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Slovak - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "sk" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Slovak - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "sk" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Slovak - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "sk" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Slovak - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "sk" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Slovak - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "sl" ]] || [[ "$language2" == "sl" ]] ||  [[ "$language3" == "sl" ]] ||  [[ "$language4" == "sl" ]] ||  [[ "$language5" == "sl" ]] ||  [[ "$language6" == "sl" ]] ||  [[ "$language7" == "sl" ]] ||  [[ "$language8" == "sl" ]] ||  [[ "$language9" == "sl" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Lado' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Lado not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "sl" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Slovenian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "sl" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Slovenian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "sl" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Slovenian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "sl" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Slovenian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "sl" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Slovenian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "sl" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Slovenian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "sl" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Slovenian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "sl" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Slovenian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "sl" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Slovenian - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "sv" ]] || [[ "$language2" == "sv" ]] ||  [[ "$language3" == "sv" ]] ||  [[ "$language4" == "sv" ]] ||  [[ "$language5" == "sv" ]] ||  [[ "$language6" == "sv" ]] ||  [[ "$language7" == "sv" ]] ||  [[ "$language8" == "sv" ]] ||  [[ "$language9" == "sv" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Bengt' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Bengt not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "sv" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Swedish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "sv" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Swedish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "sv" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Swedish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "sv" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Swedish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "sv" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Swedish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "sv" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Swedish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "sv" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Swedish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "sv" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Swedish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "sv" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Swedish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "ta" ]] || [[ "$language2" == "ta" ]] ||  [[ "$language3" == "ta" ]] ||  [[ "$language4" == "ta" ]] ||  [[ "$language5" == "ta" ]] ||  [[ "$language6" == "ta" ]] ||  [[ "$language7" == "ta" ]] ||  [[ "$language8" == "ta" ]] ||  [[ "$language9" == "ta" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Valluvar' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Valluvar not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "ta" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Tamil - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "ta" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Tamil - removed"


if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "ta" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Tamil - removed"


if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "ta" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Tamil - removed"


if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "ta" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Tamil - removed"


if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "ta" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Tamil - removed"


if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "ta" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Tamil - removed"


if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "ta" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Tamil - removed"


if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "ta" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Tamil - removed"


if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "th" ]] || [[ "$language2" == "th" ]] ||  [[ "$language3" == "th" ]] ||  [[ "$language4" == "th" ]] ||  [[ "$language5" == "th" ]] ||  [[ "$language6" == "th" ]] ||  [[ "$language7" == "th" ]] ||  [[ "$language8" == "th" ]] ||  [[ "$language9" == "th" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Pattara' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Pattara not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "th" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Thai - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "th" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Thai - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "th" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Thai - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "th" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Thai - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "th" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Thai - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "th" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Thai - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "th" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Thai - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "th" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Thai - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "th" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Thai - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "tr" ]] || [[ "$language2" == "tr" ]] ||  [[ "$language3" == "tr" ]] ||  [[ "$language4" == "tr" ]] ||  [[ "$language5" == "tr" ]] ||  [[ "$language6" == "tr" ]] ||  [[ "$language7" == "tr" ]] ||  [[ "$language8" == "tr" ]] ||  [[ "$language9" == "tr" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Tolga' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Tolga not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "tr" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Turkish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "tr" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Turkish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "tr" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Turkish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "tr" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Turkish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "tr" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Turkish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "tr" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Turkish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "tr" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Turkish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "tr" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Turkish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "tr" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Turkish - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "vi" ]] || [[ "$language2" == "vi" ]] ||  [[ "$language3" == "vi" ]] ||  [[ "$language4" == "vi" ]] ||  [[ "$language5" == "vi" ]] ||  [[ "$language6" == "vi" ]] ||  [[ "$language7" == "vi" ]] ||  [[ "$language8" == "vi" ]] ||  [[ "$language9" == "vi" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'An' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft An not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "vi" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Vietnamese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "vi" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Vietnamese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "vi" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Vietnamese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "vi" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Vietnamese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "vi" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Vietnamese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "vi" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Vietnamese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "vi" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Vietnamese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "vi" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Vietnamese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "vi" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Vietnamese - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

if [[ "$language1" == "zh-tw" ]] || [[ "$language2" == "zh-tw" ]] ||  [[ "$language3" == "zh-tw" ]] ||  [[ "$language4" == "zh-tw" ]] ||  [[ "$language5" == "zh-tw" ]] ||  [[ "$language6" == "zh-tw" ]] ||  [[ "$language7" == "zh-tw" ]] ||  [[ "$language8" == "zh-tw" ]] ||  [[ "$language9" == "zh-tw" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Zhiwei' 2> /dev/null ; then

echo -e "\n\033[1;31mError: Microsoft Zhiwei not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Will not process this secondary language...\033[0m" >&2

if [[ "$language1" == "zh-tw" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Chinese-Taiwan - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "zh-tw" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Chinese-Taiwan - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "zh-tw" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Chinese-Taiwan - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "zh-tw" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Chinese-Taiwan - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "zh-tw" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Chinese-Taiwan - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "zh-tw" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Chinese-Taiwan - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "zh-tw" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Chinese-Taiwan - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "zh-tw" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Chinese-Taiwan - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "zh-tw" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Chinese-Taiwan - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

fi

if [[ ! -n $secondlanguage1 ]]; then

secondlanguage1=" None "

fi


if [[ $language == "off" ]]; then

secondlanguage1=" Language(s) Removed "

fi

if [[ $math_equations == "" && $secondary_text == "" && $extended_descriptions == "" && $footnotes == "" && $footnote_text_regions == "" && $mp3_bookmarks == "" ]]; then

features="None"

fi

# Print MP3 Settings to the terminal
	echo -e "MP3 Settings: Name: \033[1;44m"$fullname"\033[0m Speed: \033[1;44m"$speed"\033[0m\x1B[49m\x1B[K\n"
	
	echo -e "Secondary Languages:  \033[1;44m$secondlanguage1\033[0m\e[0m \033[1;44m$secondlanguage2\e[0m\033[1;40m\033[0m \033[1;44m$secondlanguage3\e[0m\033[1;40m\033[0m \033[1;44m$secondlanguage4\e[0m\033[1;40m\033[0m \033[1;44m$secondlanguage5\e[0m\033[1;40m\033[0m \033[1;44m$secondlanguage6\e[0m \033[1;44m$secondlanguage7\e[0m\033[1;40m\033[0m \033[1;44m$secondlanguage8\e[0m\033[1;40m\033[0m \033[1;44m$secondlanguage9\e[0m\x1B[49m\x1B[K\n"
	
	echo -e "Other Features: \033[1;44m$features\e[0m \033[1;44m$math_equations\e[0m \033[1;44m$secondary_text\e[0m \033[1;44m$extended_descriptions\e[0m \033[1;44m$footnotes\e[0m \033[1;44m$footnote_text_regions\e[0m \033[1;44m$mp3_bookmarks\e[0m\x1B[49m\x1B[K\n"

####

if [[ "$caption" == "on" ]]; 

then 

# Remove second language markup from the formatted text

sed -i 's/\(\\#\\#\\#[1-9]\)\( \)/\1/g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/\\#\\#\\#[1-9]//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/\(###[1-9]\)\( \)/\1/g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/###[1-9]//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/%%%//g' ./"$baseName"/"$baseName"_formatted.txt

fi

####

# Secondary Language Markup
		
if [[ "$language" == "on" ]]; then 

# Remove backslashes from before hashtags

sed -i 's/\\#\\#\\#/###/g' ./"$baseName"/"$baseName".txt

if [[ "$name" == @(Ava|Tom|Allison|Samantha|Susan) ]]; then

## Move ### onto its own line

perl -pi -e 's/(###[1-9])/\n$1/g' ./"$baseName"/"$baseName".txt

## Move %%% onto its own line

perl -pi -e 's/(%%%)/$1\n/g' ./"$baseName"/"$baseName".txt

# Extract secondary languages
sed -n "s/\(###[1-9]\)\(.*\)\(%%%\)/<voice required='Name=Microsoft \1'>\2<\/voice>/p" ./"$baseName"/"$baseName".txt > ./speech-log.txt

#

# replace the language tags with the language values

sed -i "s/###1/"$language1"/g" ./speech-log.txt

sed -i "s/###2/"$language2"/g" ./speech-log.txt

sed -i "s/###3/"$language3"/g" ./speech-log.txt

sed -i "s/###4/"$language4"/g" ./speech-log.txt

sed -i "s/###5/"$language5"/g" ./speech-log.txt

sed -i "s/###6/"$language6"/g" ./speech-log.txt

sed -i "s/###7/"$language7"/g" ./speech-log.txt

sed -i "s/###8/"$language8"/g" ./speech-log.txt

sed -i "s/###9/"$language9"/g" ./speech-log.txt

# Replace the language values with the voice

sed -i 's/Microsoft it/Microsoft Elsa Desktop/g' ./speech-log.txt

sed -i "s/Microsoft es'/Microsoft Helena Desktop'/g" ./speech-log.txt

sed -i "s/Microsoft fr'/Microsoft Hortense Desktop'/g" ./speech-log.txt

sed -i "s/Microsoft de'/Microsoft Hedda Desktop'/g" ./speech-log.txt

sed -i 's/Microsoft ja/Microsoft Haruka Desktop/g' ./speech-log.txt

sed -i "s/Microsoft en-us/Microsoft Mark/g" ./speech-log.txt

sed -i 's/Microsoft en-gb/Microsoft Hazel Desktop/g' ./speech-log.txt

sed -i "s/Microsoft zh-cn/Microsoft Huihui Desktop/g" ./speech-log.txt

sed -i 's/Microsoft ru/Microsoft Irina Desktop/g' ./speech-log.txt

sed -i "s/Microsoft pt'/Microsoft Helia'/g" ./speech-log.txt

sed -i 's/Microsoft pl/Microsoft Paulina Desktop/g' ./speech-log.txt

sed -i 's/Microsoft es-mx/Microsoft Sabina Desktop/g' ./speech-log.txt

sed -i 's/Microsoft zh-hk/Microsoft Tracy Desktop/g' ./speech-log.txt

sed -i 's/Microsoft la/eSpeak-mb-la1/g' ./speech-log.txt

sed -i 's/Microsoft fa/eSpeak-mb-ir1/g' ./speech-log.txt

sed -i 's/Microsoft lt/eSpeak-mb-lt1/g' ./speech-log.txt

sed -i 's/Microsoft et/eSpeak-mb-ee1/g' ./speech-log.txt

sed -i 's/Microsoft af/eSpeak-mb-af1/g' ./speech-log.txt

sed -i 's/Microsoft ar-sa/Microsoft Naayf/g' ./speech-log.txt

sed -i 's/Microsoft ar-eg/Microsoft Hoda/g' ./speech-log.txt

sed -i 's/Microsoft bg/Microsoft Ivan/g' ./speech-log.txt

sed -i 's/Microsoft ca/Microsoft Herena/g' ./speech-log.txt

sed -i 's/Microsoft cs/Microsoft Jakub/g' ./speech-log.txt

sed -i 's/Microsoft da/Microsoft Helle/g' ./speech-log.txt

sed -i 's/Microsoft de-at/Microsoft Michael/g' ./speech-log.txt

sed -i 's/Microsoft de-ch/Microsoft Karsten/g' ./speech-log.txt

sed -i 's/Microsoft el/Microsoft Stefanos/g' ./speech-log.txt

sed -i 's/Microsoft en-au/Microsoft James/g' ./speech-log.txt

sed -i 's/Microsoft en-ca/Microsoft Linda/g' ./speech-log.txt

sed -i 's/Microsoft en-in/Microsoft Ravi/g' ./speech-log.txt

sed -i 's/Microsoft en-ie/Microsoft Sean/g' ./speech-log.txt

sed -i 's/Microsoft fi/Microsoft Heidi/g' ./speech-log.txt

sed -i 's/Microsoft fr-ca/Microsoft Claude/g' ./speech-log.txt

sed -i 's/Microsoft fr-ch/Microsoft Guillaume/g' ./speech-log.txt

sed -i 's/Microsoft he/Microsoft Asaf/g' ./speech-log.txt

sed -i 's/Microsoft hi/Microsoft Hemant/g' ./speech-log.txt

sed -i 's/Microsoft hr/Microsoft Matej/g' ./speech-log.txt

sed -i 's/Microsoft hu/Microsoft Szabolcs/g' ./speech-log.txt

sed -i 's/Microsoft id/Microsoft Andika/g' ./speech-log.txt

sed -i 's/Microsoft ko/Microsoft Heami/g' ./speech-log.txt

sed -i 's/Microsoft ms/Microsoft Rizwan/g' ./speech-log.txt

sed -i "s/Microsoft nl'/Microsoft Frank'/g" ./speech-log.txt

sed -i "s/Microsoft nl-be/Microsoft Bart/g" ./speech-log.txt

sed -i 's/Microsoft no/Microsoft Jon/g' ./speech-log.txt

sed -i 's/Microsoft pt-br/Microsoft Maria Desktop/g' ./speech-log.txt

sed -i 's/Microsoft ro/Microsoft Andrei/g' ./speech-log.txt

sed -i 's/Microsoft sk/Microsoft Filip/g' ./speech-log.txt

sed -i 's/Microsoft sl/Microsoft Lado/g' ./speech-log.txt

sed -i 's/Microsoft sv/Microsoft Bengt/g' ./speech-log.txt

sed -i 's/Microsoft ta/Microsoft Valluvar/g' ./speech-log.txt

sed -i 's/Microsoft th/Microsoft Pattara/g' ./speech-log.txt

sed -i 's/Microsoft tr/Microsoft Tolga/g' ./speech-log.txt

sed -i 's/Microsoft vi/Microsoft An/g' ./speech-log.txt

sed -i 's/Microsoft zh-tw/Microsoft Zhiwei/g' ./speech-log.txt

# Remove double quotation mark from text (which leads to incorrect pronunication

perl -pi -e 's/"//g' ./speech-log.txt

# Insert place marker for secondary languages

sed -i 's/\(###[1-9]\)\(.*\)\(%%%\)/@@ \2/g' ./"$baseName"/"$baseName".txt

count=$1
lang=1
while IFS="" read -r p || [ -n "$p" ] ; do echo -ne "Processing secondary languages... \033[1;33m'$count'\033[0m\r" ; balcon -t "$p" -s -1 -v 100 -fr 22 -bt 16 -ch 1 -w ./"$baseName"/output.wav 2> /dev/null ; mv ./"$baseName"/output.wav ./"$baseName"/${lang}.wav ; count=$[ $count + 1 ] ; lang=$[ $lang + 1 ] ; done <./speech-log.txt

IFS=$IFS_OLD

echo -ne 'Processing secondary languages... \033[1;32mDone.\033[0m\r'
echo -ne '\n\n'

ls -d -1 "$PWD/"**/* | grep -w 'wav' > ./speech-log2.txt

# Remove txt files

rm ./speech-log.txt

# Delete Empty lines

sed -i '/^\s*$/d' ./speech-log2.txt

# Correct path structure

sed -i 's/\//\\/g' ./speech-log2.txt

# Correct XML markup for path to wav file

sed -i 's/\\c\\/<Audio="C:\\/g' ./speech-log2.txt

sed -i 's/.wav/.wav"\/>/g' ./speech-log2.txt

# Add String to beginning of each line

sed -i -e 's/^/@@ /' ./speech-log2.txt

# Insert path to secondary language WAV files back into txt file

# Replace secondary language fragments with paths to WAV files from speech-log2.txt

awk '
    /^@@/{                   
        getline <"./speech-log2.txt" 
    }
    1                      
    ' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
       
# Replace placeholder text

sed -i -e 's/@@ //g' ./"$baseName"/"$baseName".txt
    
# Remove txt files

rm ./speech-log2.txt

# Reposition alternative text on the same line in the HTML file

perl -0777 -pi -e 's/(\n)(<Audio="C)/ $2/g' ./"$baseName"/"$baseName".txt

# Clean up punctuation after the <Audio...> markup

perl -0777 -pi -e 's/(wav"\/>\n)(, )/$1/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(wav"\/>)(,)/$1/g' ./"$baseName"/"$baseName".txt

else

# replace the language tags with the language values

sed -i "s/###1/<voice required='Name=Microsoft "$language1"'>/g" ./"$baseName"/"$baseName".txt

sed -i "s/###2/<voice required='Name=Microsoft "$language2"'>/g" ./"$baseName"/"$baseName".txt

sed -i "s/###3/<voice required='Name=Microsoft "$language3"'>/g" ./"$baseName"/"$baseName".txt

sed -i "s/###4/<voice required='Name=Microsoft "$language4"'>/g" ./"$baseName"/"$baseName".txt

sed -i "s/###5/<voice required='Name=Microsoft "$language5"'>/g" ./"$baseName"/"$baseName".txt

sed -i "s/###6/<voice required='Name=Microsoft "$language6"'>/g" ./"$baseName"/"$baseName".txt

sed -i "s/###7/<voice required='Name=Microsoft "$language7"'>/g" ./"$baseName"/"$baseName".txt

sed -i "s/###8/<voice required='Name=Microsoft "$language8"'>/g" ./"$baseName"/"$baseName".txt

sed -i "s/###9/<voice required='Name=Microsoft "$language9"'>/g" ./"$baseName"/"$baseName".txt

# Replace the language values with the voice

sed -i 's/Microsoft it/Microsoft Elsa Desktop/g' ./"$baseName"/"$baseName".txt

sed -i "s/Microsoft es'/Microsoft Helena Desktop'/g" ./"$baseName"/"$baseName".txt

sed -i "s/Microsoft fr'/Microsoft Hortense Desktop'/g" ./"$baseName"/"$baseName".txt

sed -i "s/Microsoft de'/Microsoft Hedda Desktop'/g" ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft ja/Microsoft Haruka Desktop/g' ./"$baseName"/"$baseName".txt

sed -i "s/Microsoft en-us/Microsoft Mark Desktop/g" ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft en-gb/Microsoft Hazel Desktop/g' ./"$baseName"/"$baseName".txt

sed -i "s/Microsoft zh-cn/Microsoft Huihui Desktop/g" ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft ru/Microsoft Irina Desktop/g' ./"$baseName"/"$baseName".txt

sed -i "s/Microsoft pt'/Microsoft Helia'/g" ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft pl/Microsoft Paulina Desktop/g' ./"$baseName"/"$baseName".txt

sed -i "s/Microsoft es-mx/Microsoft Sabina Desktop/g" ./"$baseName"/"$baseName".txt

sed -i "s/Microsoft zh-hk/Microsoft Tracy Desktop/g" ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft la/eSpeak-mb-la1/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft fa/eSpeak-mb-ir1/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft lt/eSpeak-mb-lt1/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft et/eSpeak-mb-ee1/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft af/eSpeak-mb-af1/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft ar-sa/Microsoft Naayf/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft ar-eg/Microsoft Hoda/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft bg/Microsoft Ivan/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft ca/Microsoft Herena/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft cs/Microsoft Jakub/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft da/Microsoft Helle/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft de-at/Microsoft Michael/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft de-ch/Microsoft Karsten/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft el/Microsoft Stefanos/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft en-au/Microsoft James/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft en-ca/Microsoft Linda/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft en-in/Microsoft Ravi/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft en-ie/Microsoft Sean/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft fi/Microsoft Heidi/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft fr-ca/Microsoft Claude/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft fr-ch/Microsoft Guillaume/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft he/Microsoft Asaf/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft hi/Microsoft Hemant/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft hr/Microsoft Matej/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft hu/Microsoft Szabolcs/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft id/Microsoft Andika/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft ko/Microsoft Heami/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft ms/Microsoft Rizwan/g' ./"$baseName"/"$baseName".txt

sed -i "s/Microsoft nl'/Microsoft Frank'/g" ./"$baseName"/"$baseName".txt

sed -i "s/Microsoft nl-be/Microsoft Bart/g" ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft no/Microsoft Jon/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft pt-br/Microsoft Maria Desktop/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft ro/Microsoft Andrei/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft sk/Microsoft Filip/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft sl/Microsoft Lado/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft sv/Microsoft Bengt/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft ta/Microsoft Valluvar/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft th/Microsoft Pattara/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft tr/Microsoft Tolga/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft vi/Microsoft An/g' ./"$baseName"/"$baseName".txt

sed -i 's/Microsoft zh-tw/Microsoft Zhiwei/g' ./"$baseName"/"$baseName".txt

# Replace the ending voice tag

sed -i 's/%%%/<\/voice>/g' ./"$baseName"/"$baseName".txt

fi

fi

# Reformatting the document for conversion

# Add an extra line after each new line

sed -i 's/$/\n/' ./"$baseName"/"$baseName".txt
	
# Put sentences on their own lines

perl '/c/scripts/sentence-boundary-original.pl' -d /c/scripts/HONORIFICS -i ./"$baseName"/"$baseName".txt -o ./"$baseName"/"$baseName"_segmented.txt

mv ./"$baseName"/"$baseName"_segmented.txt ./"$baseName"/"$baseName".txt

# Remove empty lines

perl -0777 -pi -e 's/(\n)(\n)/$1/g' ./"$baseName"/"$baseName".txt

# Check for pronunciation mistakes

		if [[ "$name" == @(Ava|Tom|Allison|Samantha|Susan) ]]; then
		
		if [ -n "$insert" ];

		then 
		
		stop_words=( "the" "of" "to" "and" "a" "in" "is" "it" "you" "that" "he" "was" "for" "on" "are" "with" "as" "I" "his" "they" "be" "at" "one" "have" "this" "from" "or" "had" "by" "not" "word" "but" "what" "some" "we" "can" "out" "other" "were" "all" "there" "when" "up" "use" "your" "how" "said" "an" "each" "she" "which" "do" "their" "time" "if" "will" "way" "about" "many" "then" "them" "write" "would" "like" "so" "these" "her" "long" "make" "thing" "see" "him" "two" "has" "look" "more" "day" "could" "go" "come" "did" "number" "sound" "no" "most" "people" "my" "over" "know" "water" "than" "call" "first" "who" "may" "down" "side" "been" "now" "find" "any" "new" "work" "part" "take" "get" "place" "made" "live" "where" "after" "back" "little" "only" "round" "man" "year" "came" "show" "every" "good" "me" "give" "our" "under" "name" "very" "through" "just" "form" "sentence" "great" "think" "say" "help" "low" "line" "differ" "turn" "cause" "much" "mean" "before" "move" "right" "boy" "old" "too" "same" "tell" "does" "set" "three" "want" "air" "well" "also" "play" "small" "end" "put" "home" "read" "hand" "port" "large" "spell" "add" "even" "land" "here" "must" "big" "high" "such" "follow" "act" "why" "ask" "men" "change" "went" "light" "kind" "off" "need" "house" "picture" "try" "us" "again" "animal" "point" "mother" "world" "near" "build" "self" "earth" "father" "head" "stand" "own" "page" "should" "country" "found" "answer" "school" "grow" "study" "still" "learn" "plant" "cover" "food" "sun" "four" "between" "state" "keep" "eye" "never" "last" "let" "thought" "city" "tree" "cross" "farm" "hard" "start" "might" "story" "saw" "far" "sea" "draw" "left" "late" "run" "don't" "while" "press" "close" "night" "real" "life" "few" "north" "open" "seem" "together" "next" "white" "children" "begin" "got" "walk" "example" "ease" "paper" "group" "always" "music" "those" "both" "mark" "often" "letter" "until" "mile" "river" "car" "feet" "care" "second" "book" "carry" "took" "science" "eat" "room" "friend" "began" "idea" "fish" "mountain" "stop" "once" "base" "hear" "horse" "cut" "sure" "watch" "color" "face" "wood" "main" "enough" "plain" "girl" "usual" "young" "ready" "above" "ever" "red" "list" "though" "feel" "talk" "bird" "soon" "body" "dog" "family" "direct" "pose" "leave" "song" "measure" "door" "product" "black" "short" "numeral" "class" "wind" "question" "happen" "complete" "ship" "area" "half" "rock" "order" "fire" "south" "problem" "piece" "told" "knew" "pass" "since" "top" "whole" "king" "space" "heard" "best" "hour" "better" "true" "during" "hundred" "five" "remember" "step" "early" "hold" "west" "ground" "interest" "reach" "fast" "verb" "sing" "listen" "six" "table" "travel" "less" "morning" "ten" "simple" "several" "vowel" "toward" "war" "lay" "against" "pattern" "slow" "center" "love" "person" "money" "serve" "appear" "road" "map" "rain" "rule" "govern" "pull" "cold" "notice" "voice" "unit" "power" "town" "fine" "certain" "fly" "fall" "lead" "cry" "dark" "machine" "note" "wait" "plan" "figure" "star" "box" "noun" "field" "rest" "correct" "able" "pound" "done" "beauty" "drive" "stood" "contain" "front" "teach" "week" "final" "gave" "green" "oh" "quick" "develop" "ocean" "warm" "free" "minute" "strong" "special" "mind" "behind" "clear" "tail" "produce" "fact" "street" "inch" "multiply" "nothing" "course" "stay" "wheel" "full" "force" "blue" "object" "decide" "surface" "deep" "moon" "island" "foot" "system" "busy" "test" "record" "boat" "common" "gold" "possible" "plane" "stead" "dry" "wonder" "laugh" "thousand" "ago" "ran" "check" "game" "shape" "equate" "hot" "miss" "brought" "heat" "snow" "tire" "bring" "yes" "distant" "fill" "east" "paint" "language" "among" "grand" "ball" "yet" "wave" "drop" "heart" "am" "present" "heavy" "dance" "engine" "position" "arm" "wide" "sail" "material" "size" "vary" "settle" "speak" "weight" "general" "ice" "matter" "circle" "pair" "include" "divide" "syllable" "felt" "perhaps" "pick" "sudden" "count" "square" "reason" "length" "represent" "art" "subject" "region" "energy" "hunt" "probable" "bed" "brother" "egg" "ride" "cell" "believe" "fraction" "forest" "sit" "race" "window" "store" "summer" "train" "sleep" "prove" "lone" "leg" "exercise" "wall" "catch" "mount" "wish" "sky" "board" "joy" "winter" "sat" "written" "wild" "instrument" "kept" "glass" "grass" "cow" "job" "edge" "sign" "visit" "past" "soft" "fun" "bright" "gas" "weather" "month" "million" "bear" "finish" "happy" "hope" "flower" "clothe" "strange" "gone" "jump" "baby" "eight" "village" "meet" "root" "buy" "raise" "solve" "metal" "whether" "push" "seven" "paragraph" "third" "shall" "held" "hair" "describe" "cook" "floor" "either" "result" "burn" "hill" "safe" "cat" "century" "consider" "type" "law" "bit" "coast" "copy" "phrase" "silent" "tall" "sand" "soil" "roll" "temperature" "finger" "industry" "value" "fight" "lie" "beat" "excite" "natural" "view" "sense" "ear" "else" "quite" "broke" "case" "middle" "kill" "son" "lake" "moment" "scale" "loud" "spring" "observe" "child" "straight" "consonant" "nation" "dictionary" "milk" "speed" "method" "organ" "pay" "age" "section" "dress" "cloud" "surprise" "quiet" "stone" "tiny" "climb" "cool" "design" "poor" "lot" "experiment" "bottom" "key" "iron" "single" "stick" "flat" "twenty" "skin" "smile" "crease" "hole" "trade" "melody" "trip" "office" "receive" "row" "mouth" "exact" "symbol" "die" "least" "trouble" "shout" "except" "wrote" "seed" "tone" "join" "suggest" "clean" "break" "lady" "yard" "rise" "bad" "blow" "oil" "blood" "touch" "grew" "cent" "mix" "team" "wire" "cost" "lost" "brown" "wear" "garden" "equal" "sent" "choose" "fell" "fit" "flow" "fair" "bank" "collect" "save" "control" "decimal" "gentle" "woman" "captain" "practice" "separate" "difficult" "doctor" "please" "protect" "noon" "whose" "locate" "ring" "character" "insect" "caught" "period" "indicate" "radio" "spoke" "atom" "human" "history" "effect" "electric" "expect" "crop" "modern" "element" "hit" "student" "corner" "party" "supply" "bone" "rail" "imagine" "provide" "agree" "thus" "capital" "won't" "chair" "danger" "fruit" "rich" "thick" "soldier" "process" "operate" "guess" "necessary" "sharp" "wing" "create" "neighbor" "wash" "bat" "rather" "crowd" "corn" "compare" "poem" "string" "bell" "depend" "meat" "rub" "tube" "famous" "dollar" "stream" "fear" "sight" "thin" "triangle" "planet" "hurry" "chief" "colony" "clock" "mine" "tie" "enter" "major" "fresh" "search" "send" "yellow" "gun" "allow" "print" "dead" "spot" "desert" "suit" "current" "lift" "rose" "continue" "block" "chart" "hat" "sell" "success" "company" "subtract" "event" "particular" "deal" "swim" "term" "opposite" "wife" "shoe" "shoulder" "spread" "arrange" "camp" "invent" "cotton" "born" "determine" "quart" "nine" "truck" "noise" "level" "chance" "gather" "shop" "stretch" "throw" "shine" "property" "column" "molecule" "select" "wrong" "gray" "repeat" "require" "broad" "prepare" "salt" "nose" "plural" "anger" "claim" "continent" "oxygen" "sugar" "death" "pretty" "skill" "women" "season" "solution" "magnet" "silver" "thank" "branch" "match" "suffix" "especially" "fig" "afraid" "huge" "sister" "steel" "discuss" "forward" "similar" "guide" "experience" "score" "apple" "bought" "led" "pitch" "coat" "mass" "card" "band" "rope" "slip" "win" "dream" "evening" "condition" "feed" "tool" "total" "basic" "smell" "valley" "nor" "double" "seat" "arrive" "master" "track" "parent" "shore" "division" "sheet" "substance" "favor" "connect" "post" "spend" "chord" "fat" "glad" "original" "share" "station" "dad" "bread" "charge" "proper" "bar" "offer" "segment" "slave" "duck" "instant" "market" "degree" "populate" "chick" "dear" "enemy" "reply" "drink" "occur" "support" "speech" "nature" "range" "steam" "motion" "path" "liquid" "log" "meant" "quotient" "teeth" "shell" "neck" "ain" "aren" "aren't" "because" "being" "below" "couldn" "couldn't" "d" "didn" "didn't" "doesn" "doesn't" "doing" "don" "further" "hadn" "hadn't" "hasn" "hasn't" "haven" "haven't" "having" "hers" "herself" "himself" "i" "into" "isn" "isn't" "it's" "its" "itself" "ll" "m" "ma" "mightn" "mightn't" "mustn" "mustn't" "myself" "needn" "needn't" "o" "ours" "ourselves" "re" "s" "shan" "shan't" "she's" "should've" "shouldn" "shouldn't" "t" "that'll" "theirs" "themselves" "ve" "wasn" "wasn't" "weren" "weren't" "whom" "won" "wouldn" "wouldn't" "y" "you'd" "you'll" "you're" "you've" "yours" "yourself" "yourselves" "he'd" "he'll" "he's" "here's" "how's" "i'd" "i'll" "i'm" "i've" "let's" "ought" "she'd" "she'll" "that's" "there's" "they'd" "they'll" "they're" "they've" "we'd" "we'll" "we're" "we've" "what's" "when's" "where's" "who's" "why's" "abst" "accordance" "according" "accordingly" "across" "actually" "added" "adj" "affected" "affecting" "affects" "afterwards" "ah" "almost" "alone" "along" "already" "although" "amongst" "announce" "another" "anybody" "anyhow" "anymore" "anyone" "anything" "anyway" "anyways" "anywhere" "apparently" "approximately" "arent" "arise" "around" "aside" "asking" "auth" "available" "away" "awfully" "b" "became" "become" "becomes" "becoming" "beforehand" "beginning" "beginnings" "begins" "beside" "besides" "beyond" "biol" "brief" "briefly" "c" "ca" "cannot" "can't" "causes" "certainly" "co" "com" "comes" "containing" "contains" "couldnt" "date" "different" "downwards" "due" "e" "ed" "edu" "eg" "eastern" "eighty" "elsewhere" "ending" "et" "etc" "everybody" "everyone" "everything" "everywhere" "ex" "f" "ff" "fifth" "fix" "followed" "following" "follows" "former" "formerly" "forth" "furthermore" "french" "g" "german" "gets" "getting" "given" "gives" "giving" "goes" "gotten" "h" "happens" "hardly" "hed" "hence" "hereafter" "hereby" "herein" "heres" "hereupon" "hes" "hi" "hid" "hither" "howbeit" "however" "id" "ie" "im" "immediate" "heading" "startfraction" "endfraction" "immediately" "importance" "important" "inc" "indeed" "index" "information" "instead" "invention" "inward" "itd" "it'll" "j" "k" "keeps" "kg" "km" "known" "knows" "l" "largely" "lately" "later" "latter" "latterly" "lest" "lets" "liked" "likely" "'ll" "looking" "looks" "ltd" "mainly" "makes" "maybe" "means" "meantime" "meanwhile" "merely" "mg" "ml" "moreover" "mostly" "mr" "mrs" "mug" "n" "na" "namely" "nay" "nd" "nearly" "necessarily" "needs" "neither" "nevertheless" "ninety" "nobody" "non" "none" "nonetheless" "noone" "normally" "nos" "noted" "nowhere" "obtain" "obtained" "obviously" "ok" "okay" "omitted" "ones" "onto" "ord" "others" "otherwise" "outside" "overall" "owing" "p" "pages" "particularly" "per" "placed" "plus" "poorly" "possibly" "potentially" "pp" "predominantly" "previously" "primarily" "probably" "promptly" "proud" "provides" "q" "que" "quickly" "qv" "r" "rd" "readily" "really" "recent" "recently" "ref" "refs" "regarding" "regardless" "regards" "related" "relatively" "research" "respectively" "resulted" "resulting" "results" "saying" "says" "sec" "seeing" "seemed" "seeming" "seems" "seen" "selves" "shed" "shes" "showed" "shown" "showns" "shows" "significant" "significantly" "similarly" "slightly" "somebody" "somehow" "someone" "somethan" "something" "sometime" "sometimes" "somewhat" "somewhere" "sorry" "specifically" "specified" "specify" "specifying" "strongly" "sub" "substantially" "successfully" "sufficiently" "sup" "taken" "taking" "extended" "description" "caption" "tends" "th" "thanks" "thanx" "thats" "that've" "thence" "thereafter" "thereby" "thered" "therefore" "therein" "there'll" "thereof" "therere" "theres" "thereto" "thereupon" "there've" "theyd" "theyre" "thou" "thoughh" "throug" "throughout" "thru" "til" "tip" "towards" "tried" "tries" "truly" "trying" "ts" "twice" "u" "un" "unfortunately" "unless" "unlike" "unlikely" "unto" "upon" "ups" "used" "useful" "usefully" "usefulness" "uses" "using" "usually" "v" "various" "'ve" "via" "viz" "vol" "vols" "vs" "w" "wants" "wasnt" "wed" "welcome" "werent" "whatever" "what'll" "whats" "whence" "whenever" "whereafter" "whereas" "whereby" "wherein" "wheres" "whereupon" "wherever" "whim" "whither" "whod" "whoever" "who'll" "whomever" "whos" "widely" "willing" "within" "without" "wont" "words" "wouldnt" "www" "x" "youd" "youre" "z" "zero" "a's" "ain't" "allows" "apart" "appreciate" "appropriate" "associated" "c'mon" "c's" "cant" "changes" "clearly" "concerning" "consequently" "considering" "corresponding" "currently" "definitely" "described" "despite" "entirely" "exactly" "going" "greetings" "hello" "hopefully" "ignored" "inasmuch" "indicated" "indicates" "inner" "insofar" "it'd" "novel" "presumably" "reasonably" "secondly" "sensible" "serious" "seriously" "t's" "thorough" "thoroughly" "france" "amoungst" "amount" "bill" "con" "de" "detail" "eleven" "empty" "fifteen" "fify" "forty" "hasnt" "society" "church" "mill" "sincere" "sixty" "political" "thickv" "twelve" "western" "january" "february" "march" "april" "june" "july" "august" "september" "god" "lord" "october" "november" "december" "A" "B" "C" "D" "E" "F" "G" "H" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "op" "aaron" "abbey" "abbie" "abby" "abdul" "abe" "abel" "abigail" "abraham" "abram" "ada" "adah" "adalberto" "adaline" "adam" "adan" "addie" "adela" "adelaida" "adelaide" "adele" "adelia" "adelina" "adeline" "adell" "adella" "adelle" "adena" "adina" "adolfo" "adolph" "adria" "adrian" "adriana" "adriane" "adrianna" "adrianne" "adrien" "adriene" "adrienne" "afton" "agatha" "agnes" "agnus" "agripina" "agueda" "agustin" "agustina" "ahmad" "ahmed" "ai" "aida" "aide" "aiko" "aileen" "ailene" "aimee" "aisha" "aja" "akiko" "akilah" "al" "alaina" "alaine" "alan" "alana" "alane" "alanna" "alayna" "alba" "albert" "alberta" "albertha" "albertina" "albertine" "alberto" "albina" "alda" "alden" "aldo" "alease" "alec" "alecia" "aleen" "aleida" "aleisha" "alejandra" "alejandrina" "alejandro" "alena" "alene" "alesha" "aleshia" "alesia" "alessandra" "aleta" "aletha" "alethea" "alethia" "alex" "alexa" "alexander" "alexandra" "alexandria" "alexia" "alexis" "alfonso" "alfonzo" "alfred" "alfreda" "alfredia" "alfredo" "ali" "alia" "alica" "alice" "alicia" "alida" "alina" "aline" "alisa" "alise" "alisha" "alishia" "alisia" "alison" "alissa" "alita" "alix" "aliza" "alla" "allan" "alleen" "allegra" "allen" "allena" "allene" "allie" "alline" "allison" "allyn" "allyson" "alma" "almeda" "almeta" "alona" "alonso" "alonzo" "alpha" "alphonse" "alphonso" "alta" "altagracia" "altha" "althea" "alton" "alva" "alvaro" "alvera" "alverta" "alvin" "alvina" "alyce" "alycia" "alysa" "alyse" "alysha" "alysia" "alyson" "alyssa" "amada" "amado" "amal" "amalia" "amanda" "amber" "amberly" "ambrose" "amee" "amelia" "america" "ami" "amie" "amiee" "amina" "amira" "ammie" "amos" "amparo" "amy" "ana" "anabel" "analisa" "anamaria" "anastacia" "anastasia" "andera" "anderson" "andra" "andre" "andrea" "andreas" "andree" "andres" "andrew" "andria" "andy" "anette" "angel" "angela" "angele" "angelena" "angeles" "angelia" "angelic" "angelica" "angelika" "angelina" "angeline" "angelique" "angelita" "angella" "angelo" "angelyn" "angie" "angila" "angla" "angle" "anglea" "anh" "anibal" "anika" "anisa" "anisha" "anissa" "anita" "anitra" "anja" "anjanette" "anjelica" "ann" "anna" "annabel" "annabell" "annabelle" "annalee" "annalisa" "annamae" "annamaria" "annamarie" "anne" "anneliese" "annelle" "annemarie" "annett" "annetta" "annette" "annice" "annie" "annika" "annis" "annita" "annmarie" "anthony" "antione" "antionette" "antoine" "antoinette" "anton" "antone" "antonetta" "antonette" "antonia" "antonietta" "antonina" "antonio" "antony" "antwan" "anya" "apolonia" "apryl" "ara" "araceli" "aracelis" "aracely" "arcelia" "archie" "ardath" "ardelia" "ardell" "ardella" "ardelle" "arden" "ardis" "ardith" "aretha" "argelia" "argentina" "ariana" "ariane" "arianna" "arianne" "arica" "arie" "ariel" "arielle" "arla" "arlean" "arleen" "arlen" "arlena" "arlene" "arletha" "arletta" "arlette" "arlie" "arlinda" "arline" "arlyne" "armand" "armanda" "armandina" "armando" "armida" "arminda" "arnetta" "arnette" "arnita" "arnold" "arnoldo" "arnulfo" "aron" "arron" "arthur" "artie" "arturo" "arvilla" "asa" "asha" "ashanti" "ashely" "ashlea" "ashlee" "ashleigh" "ashley" "ashli" "ashlie" "ashly" "ashlyn" "ashton" "asia" "asley" "assunta" "astrid" "asuncion" "athena" "aubrey" "audie" "audra" "audrea" "audrey" "audria" "audrie" "audry" "augusta" "augustina" "augustine" "augustus" "aundrea" "aura" "aurea" "aurelia" "aurelio" "aurora" "aurore" "austin" "autumn" "ava" "avelina" "avery" "avis" "avril" "awilda" "ayako" "ayana" "ayanna" "ayesha" "azalee" "azucena" "azzie" "babara" "babette" "bailey" "bambi" "bao" "barabara" "barb" "barbar" "barbara" "barbera" "barbie" "barbra" "bari" "barney" "barrett" "barrie" "barry" "bart" "barton" "basil" "basilia" "bea" "beata" "beatrice" "beatris" "beatriz" "beau" "beaulah" "bebe" "becki" "beckie" "becky" "bee" "belen" "belia" "belinda" "belkis" "bella" "belle" "belva" "ben" "benedict" "benita" "benito" "benjamin" "bennett" "bennie" "benny" "benton" "berenice" "berna" "bernadette" "bernadine" "bernard" "bernarda" "bernardina" "bernardine" "bernardo" "berneice" "bernetta" "bernice" "bernie" "berniece" "bernita" "berry" "bert" "berta" "bertha" "bertie" "bertram" "beryl" "bess" "bessie" "beth" "bethanie" "bethann" "bethany" "bethel" "betsey" "betsy" "bette" "bettie" "bettina" "betty" "bettyann" "bettye" "beula" "beulah" "bev" "beverlee" "beverley" "beverly" "bianca" "bibi" "billi" "billie" "billy" "billye" "birdie" "birgit" "blaine" "blair" "blake" "blanca" "blanch" "blanche" "blondell" "blossom" "blythe" "bo" "bob" "bobbi" "bobbie" "bobby" "bobbye" "bobette" "bok" "bong" "bonita" "bonnie" "bonny" "booker" "boris" "boyce" "boyd" "brad" "bradford" "bradley" "bradly" "brady" "brain" "branda" "brande" "brandee" "branden" "brandi" "brandie" "brandon" "brandy" "brant" "breana" "breann" "breanna" "breanne" "bree" "brenda" "brendan" "brendon" "brenna" "brent" "brenton" "bret" "brett" "brian" "briana" "brianna" "brianne" "brice" "bridget" "bridgett" "bridgette" "brigette" "brigid" "brigida" "brigitte" "brinda" "britany" "britney" "britni" "britt" "britta" "brittaney" "brittani" "brittanie" "brittany" "britteny" "brittney" "brittni" "brittny" "brock" "broderick" "bronwyn" "brook" "brooke" "brooks" "bruce" "bruna" "brunilda" "bruno" "bryan" "bryanna" "bryant" "bryce" "brynn" "bryon" "buck" "bud" "buddy" "buena" "buffy" "buford" "bula" "bulah" "bunny" "burl" "burma" "burt" "burton" "buster" "byron" "caitlin" "caitlyn" "calandra" "caleb" "calista" "callie" "calvin" "camelia" "camellia" "cameron" "cami" "camie" "camila" "camilla" "camille" "cammie" "cammy" "candace" "candance" "candelaria" "candi" "candice" "candida" "candie" "candis" "candra" "candy" "candyce" "caprice" "cara" "caren" "carey" "cari" "caridad" "carie" "carin" "carina" "carisa" "carissa" "carita" "carl" "carla" "carlee" "carleen" "carlena" "carlene" "carletta" "carley" "carli" "carlie" "carline" "carlita" "carlo" "carlos" "carlota" "carlotta" "carlton" "carly" "carlyn" "carma" "carman" "carmel" "carmela" "carmelia" "carmelina" "carmelita" "carmella" "carmelo" "carmen" "carmina" "carmine" "carmon" "carol" "carola" "carolann" "carole" "carolee" "carolin" "carolina" "caroline" "caroll" "carolyn" "carolyne" "carolynn" "caron" "caroyln" "carri" "carrie" "carrol" "carroll" "carson" "carter" "cary" "caryl" "carylon" "caryn" "casandra" "casey" "casie" "casimira" "cassandra" "cassaundra" "cassey" "cassi" "cassidy" "cassie" "cassondra" "cassy" "catalina" "catarina" "caterina" "catharine" "catherin" "catherina" "catherine" "cathern" "catheryn" "cathey" "cathi" "cathie" "cathleen" "cathrine" "cathryn" "cathy" "catina" "catrice" "catrina" "cayla" "cecelia" "cecil" "cecila" "cecile" "cecilia" "cecille" "cecily" "cedric" "cedrick" "celena" "celesta" "celeste" "celestina" "celestine" "celia" "celina" "celinda" "celine" "celsa" "ceola" "cesar" "chad" "chadwick" "chae" "chan" "chana" "chanda" "chandra" "chanel" "chanell" "chanelle" "chang" "chantal" "chantay" "chante" "chantel" "chantell" "chantelle" "chara" "charis" "charise" "charissa" "charisse" "charita" "charity" "charla" "charleen" "charlena" "charlene" "charles" "charlesetta" "charlette" "charley" "charlie" "charline" "charlott" "charlotte" "charlsie" "charlyn" "charmain" "charmaine" "charolette" "chas" "chase" "chasidy" "chasity" "chassidy" "chastity" "chau" "chauncey" "chaya" "chelsea" "chelsey" "chelsie" "cher" "chere" "cheree" "cherelle" "cheri" "cherie" "cherilyn" "cherise" "cherish" "cherly" "cherlyn" "cherri" "cherrie" "cherry" "cherryl" "chery" "cheryl" "cheryle" "cheryll" "chester" "chet" "cheyenne" "chi" "chia" "chieko" "chin" "china" "ching" "chiquita" "chloe" "chong" "chris" "chrissy" "christa" "christal" "christeen" "christel" "christen" "christena" "christene" "christi" "christia" "christian" "christiana" "christiane" "christie" "christin" "christina" "christine" "christinia" "christoper" "christopher" "christy" "chrystal" "chu" "chuck" "chun" "chung" "ciara" "cicely" "ciera" "cierra" "cinda" "cinderella" "cindi" "cindie" "cindy" "cinthia" "cira" "clair" "claire" "clara" "clare" "clarence" "claretha" "claretta" "claribel" "clarice" "clarinda" "clarine" "claris" "clarisa" "clarissa" "clarita" "clark" "classie" "claud" "claude" "claudette" "claudia" "claudie" "claudine" "claudio" "clay" "clayton" "clelia" "clemencia" "clement" "clemente" "clementina" "clementine" "clemmie" "cleo" "cleopatra" "cleora" "cleotilde" "cleta" "cletus" "cleveland" "cliff" "clifford" "clifton" "clint" "clinton" "clora" "clorinda" "clotilde" "clyde" "codi" "cody" "colby" "cole" "coleen" "coleman" "colene" "coletta" "colette" "colin" "colleen" "collen" "collene" "collette" "collin" "colton" "columbus" "concepcion" "conception" "concetta" "concha" "conchita" "connie" "conrad" "constance" "consuela" "consuelo" "contessa" "cora" "coral" "coralee" "coralie" "corazon" "cordelia" "cordell" "cordia" "cordie" "coreen" "corene" "coretta" "corey" "cori" "corie" "corina" "corine" "corinna" "corinne" "corliss" "cornelia" "cornelius" "cornell" "corrie" "corrin" "corrina" "corrine" "corrinne" "cortez" "cortney" "cory" "courtney" "coy" "craig" "creola" "cris" "criselda" "crissy" "crista" "cristal" "cristen" "cristi" "cristie" "cristin" "cristina" "cristine" "cristobal" "cristopher" "cristy" "cruz" "crysta" "crystal" "crystle" "cuc" "curt" "curtis" "cyndi" "cyndy" "cynthia" "cyril" "cyrstal" "cyrus" "cythia" "dacia" "dagmar" "dagny" "dahlia" "daina" "daine" "daisey" "daisy" "dakota" "dale" "dalene" "dalia" "dalila" "dallas" "dalton" "damaris" "damian" "damien" "damion" "damon" "dan" "dana" "danae" "dane" "danelle" "danette" "dani" "dania" "danial" "danica" "daniel" "daniela" "daniele" "daniell" "daniella" "danielle" "danika" "danille" "danilo" "danita" "dann" "danna" "dannette" "dannie" "dannielle" "danny" "dante" "danuta" "danyel" "danyell" "danyelle" "daphine" "daphne" "dara" "darby" "darcel" "darcey" "darci" "darcie" "darcy" "darell" "daren" "daria" "darin" "dario" "darius" "darla" "darleen" "darlena" "darlene" "darline" "darnell" "daron" "darrel" "darrell" "darren" "darrick" "darrin" "darron" "darryl" "darwin" "daryl" "dave" "david" "davida" "davina" "davis" "dawn" "dawna" "dawne" "dayle" "dayna" "daysi" "deadra" "dean" "deana" "deandra" "deandre" "deandrea" "deane" "deangelo" "deann" "deanna" "deanne" "deb" "debbi" "debbie" "debbra" "debby" "debera" "debi" "debora" "deborah" "debra" "debrah" "debroah" "dede" "dedra" "dee" "deeann" "deeanna" "deedee" "deedra" "deena" "deetta" "deidra" "deidre" "deirdre" "deja" "del" "delaine" "delana" "delbert" "delcie" "delena" "delfina" "delia" "delicia" "delila" "delilah" "delinda" "delisa" "dell" "della" "delma" "delmar" "delmer" "delmy" "delois" "deloise" "delora" "deloras" "delores" "deloris" "delorse" "delpha" "delphia" "delphine" "delsie" "delta" "demarcus" "demetra" "demetria" "demetrice" "demetrius" "dena" "denae" "deneen" "denese" "denice" "denis" "denise" "denisha" "denisse" "denita" "denna" "dennis" "dennise" "denny" "denver" "denyse" "deon" "deonna" "derek" "derick" "derrick" "deshawn" "desirae" "desire" "desiree" "desmond" "despina" "dessie" "destiny" "detra" "devin" "devon" "devona" "devora" "devorah" "dewayne" "dewey" "dewitt" "dexter" "dia" "diamond" "dian" "diana" "diane" "diann" "dianna" "dianne" "dick" "diedra" "diedre" "diego" "dierdre" "digna" "dillon" "dimple" "dina" "dinah" "dino" "dinorah" "dion" "dione" "dionna" "dionne" "dirk" "divina" "dixie" "dodie" "dollie" "dolly" "dolores" "doloris" "domenic" "domenica" "dominga" "domingo" "dominic" "dominica" "dominick" "dominique" "dominque" "domitila" "domonique" "dona" "donald" "donella" "donetta" "donette" "dong" "donita" "donn" "donna" "donnell" "donnetta" "donnette" "donnie" "donny" "donovan" "donte" "donya" "dora" "dorathy" "dorcas" "doreatha" "doreen" "dorene" "doretha" "dorethea" "doretta" "dori" "doria" "dorian" "dorie" "dorinda" "dorine" "doris" "dorla" "dorotha" "dorothea" "dorothy" "dorris" "dorsey" "dortha" "dorthea" "dorthey" "dorthy" "dot" "dottie" "dotty" "doug" "douglas" "douglass" "dovie" "doyle" "dreama" "drema" "drew" "drucilla" "drusilla" "duane" "dudley" "dulce" "dulcie" "duncan" "dung" "dusti" "dustin" "dusty" "dwain" "dwana" "dwayne" "dwight" "dyan" "dylan" "earl" "earle" "earlean" "earleen" "earlene" "earlie" "earline" "earnest" "earnestine" "eartha" "easter" "eboni" "ebonie" "ebony" "echo" "eda" "edda" "eddie" "eddy" "edelmira" "eden" "edgar" "edgardo" "edie" "edison" "edith" "edmond" "edmund" "edmundo" "edna" "edra" "edris" "eduardo" "edward" "edwardo" "edwin" "edwina" "edyth" "edythe" "effie" "efrain" "efren" "ehtel" "eileen" "eilene" "ela" "eladia" "elaina" "elaine" "elana" "elane" "elanor" "elayne" "elba" "elbert" "elda" "elden" "eldon" "eldora" "eldridge" "eleanor" "eleanora" "eleanore" "elease" "elena" "elene" "eleni" "elenor" "elenora" "elenore" "eleonor" "eleonora" "eleonore" "elfreda" "elfrieda" "elfriede" "eli" "elia" "eliana" "elias" "elicia" "elida" "elidia" "elijah" "elin" "elina" "elinor" "elinore" "elisa" "elisabeth" "elise" "eliseo" "elisha" "elissa" "eliz" "eliza" "elizabet" "elizabeth" "elizbeth" "elizebeth" "elke" "ella" "ellamae" "ellan" "ellen" "ellena" "elli" "ellie" "elliot" "elliott" "ellis" "ellsworth" "elly" "ellyn" "elma" "elmer" "elmira" "elmo" "elna" "elnora" "elodia" "elois" "eloisa" "eloise" "elouise" "eloy" "elroy" "elsa" "elsie" "elsy" "elton" "elva" "elvera" "elvia" "elvie" "elvin" "elvina" "elvira" "elvis" "elwanda" "elwood" "elyse" "elza" "ema" "emanuel" "emelda" "emelia" "emelina" "emeline" "emely" "emerald" "emerita" "emerson" "emery" "emiko" "emil" "emile" "emilee" "emilia" "emilie" "emilio" "emily" "emma" "emmaline" "emmanuel" "emmett" "emmie" "emmitt" "emmy" "emogene" "emory" "ena" "enda" "enedina" "eneida" "enid" "enoch" "enola" "enrique" "enriqueta" "epifania" "era" "erasmo" "eric" "erica" "erich" "erick" "ericka" "erik" "erika" "erin" "erinn" "erlene" "erlinda" "erline" "erma" "ermelinda" "erminia" "erna" "ernest" "ernestina" "ernestine" "ernesto" "ernie" "errol" "ervin" "erwin" "eryn" "esmeralda" "esperanza" "essie" "esta" "esteban" "estefana" "estela" "estell" "estella" "estelle" "ester" "esther" "estrella" "etha" "ethan" "ethel" "ethelene" "ethelyn" "ethyl" "etsuko" "etta" "ettie" "eufemia" "eugena" "eugene" "eugenia" "eugenie" "eugenio" "eula" "eulah" "eulalia" "eun" "euna" "eunice" "eura" "eusebia" "eusebio" "eustolia" "eva" "evalyn" "evan" "evangelina" "evangeline" "eve" "evelia" "evelin" "evelina" "eveline" "evelyn" "evelyne" "evelynn" "everett" "everette" "evette" "evia" "evie" "evita" "evon" "evonne" "ewa" "exie" "ezekiel" "ezequiel" "ezra" "fabian" "fabiola" "fae" "fairy" "faith" "fallon" "fannie" "fanny" "farah" "farrah" "fatima" "fatimah" "faustina" "faustino" "fausto" "faviola" "fawn" "fay" "faye" "fe" "federico" "felecia" "felica" "felice" "felicia" "felicidad" "felicita" "felicitas" "felipa" "felipe" "felisa" "felisha" "felix" "felton" "ferdinand" "fermin" "fermina" "fern" "fernanda" "fernande" "fernando" "ferne" "fidel" "fidela" "fidelia" "filiberto" "filomena" "fiona" "flavia" "fleta" "fletcher" "flo" "flor" "flora" "florance" "florence" "florencia" "florencio" "florene" "florentina" "florentino" "floretta" "floria" "florida" "florinda" "florine" "florrie" "flossie" "floy" "floyd" "fonda" "forrest" "foster" "fran" "francene" "frances" "francesca" "francesco" "franchesca" "francie" "francina" "francine" "francis" "francisca" "francisco" "francoise" "frank" "frankie" "franklin" "franklyn" "fransisca" "fred" "freda" "fredda" "freddie" "freddy" "frederic" "frederica" "frederick" "fredericka" "fredia" "fredric" "fredrick" "fredricka" "freeda" "freeman" "freida" "frida" "frieda" "fritz" "fumiko" "gabriel" "gabriela" "gabriele" "gabriella" "gabrielle" "gail" "gala" "gale" "galen" "galina" "garfield" "garland" "garnet" "garnett" "garret" "garrett" "garry" "garth" "gary" "gaston" "gavin" "gay" "gaye" "gayla" "gayle" "gaylene" "gaylord" "gaynell" "gaynelle" "gearldine" "gema" "gemma" "gena" "genaro" "gene" "genesis" "geneva" "genevie" "genevieve" "genevive" "genia" "genie" "genna" "gennie" "genny" "genoveva" "geoffrey" "georgann" "george" "georgeann" "georgeanna" "georgene" "georgetta" "georgette" "georgia" "georgiana" "georgiann" "georgianna" "georgianne" "georgie" "georgina" "georgine" "gerald" "geraldine" "geraldo" "geralyn" "gerard" "gerardo" "gerda" "geri" "germaine" "gerri" "gerry" "gertha" "gertie" "gertrud" "gertrude" "gertrudis" "gertude" "ghislaine" "gia" "gianna" "gidget" "gigi" "gil" "gilbert" "gilberte" "gilberto" "gilda" "gillian" "gilma" "gina" "ginette" "ginger" "ginny" "gino" "giovanna" "giovanni" "gisela" "gisele" "giselle" "gita" "giuseppe" "giuseppina" "gladis" "glady" "gladys" "glayds" "glen" "glenda" "glendora" "glenn" "glenna" "glennie" "glennis" "glinda" "gloria" "glory" "glynda" "glynis" "golda" "golden" "goldie" "gonzalo" "gordon" "grace" "gracia" "gracie" "graciela" "grady" "graham" "graig" "grant" "granville" "grayce" "grazyna" "greg" "gregg" "gregoria" "gregorio" "gregory" "greta" "gretchen" "gretta" "gricelda" "grisel" "griselda" "grover" "guadalupe" "gudrun" "guillermina" "guillermo" "gus" "gussie" "gustavo" "guy" "gwen" "gwenda" "gwendolyn" "gwenn" "gwyn" "gwyneth" "ha" "hae" "hai" "hailey" "hal" "haley" "halina" "halley" "hallie" "han" "hana" "hang" "hanh" "hank" "hanna" "hannah" "hannelore" "hans" "harlan" "harland" "harley" "harmony" "harold" "harriet" "harriett" "harriette" "harris" "harrison" "harry" "harvey" "hassan" "hassie" "hattie" "haydee" "hayden" "hayley" "haywood" "hazel" "heath" "heather" "hector" "hedwig" "hedy" "hee" "heide" "heidi" "heidy" "heike" "helaine" "helen" "helena" "helene" "helga" "hellen" "henrietta" "henriette" "henry" "herb" "herbert" "heriberto" "herlinda" "herma" "herman" "hermelinda" "hermila" "hermina" "hermine" "herminia" "herschel" "hershel" "herta" "hertha" "hester" "hettie" "hiedi" "hien" "hilaria" "hilario" "hilary" "hilda" "hilde" "hildegard" "hildegarde" "hildred" "hillary" "hilma" "hilton" "hipolito" "hiram" "hiroko" "hisako" "hoa" "hobert" "holley" "holli" "hollie" "hollis" "holly" "homer" "honey" "hong" "horace" "horacio" "hortencia" "hortense" "hortensia" "hosea" "houston" "howard" "hoyt" "hsiu" "hubert" "hue" "huey" "hugh" "hugo" "hui" "hulda" "humberto" "hung" "hunter" "huong" "hwa" "hyacinth" "hye" "hyman" "hyo" "hyon" "hyun" "ian" "ida" "idalia" "idell" "idella" "iesha" "ignacia" "ignacio" "ike" "ila" "ilana" "ilda" "ileana" "ileen" "ilene" "iliana" "illa" "ilona" "ilse" "iluminada" "ima" "imelda" "imogene" "ina" "india" "indira" "inell" "ines" "inez" "inga" "inge" "ingeborg" "inger" "ingrid" "inocencia" "iola" "iona" "ione" "ira" "iraida" "irena" "irene" "irina" "iris" "irish" "irma" "irmgard" "irvin" "irving" "irwin" "isa" "isaac" "isabel" "isabell" "isabella" "isabelle" "isadora" "isaiah" "isaias" "isaura" "isela" "isiah" "isidra" "isidro" "isis" "ismael" "isobel" "israel" "isreal" "issac" "iva" "ivan" "ivana" "ivelisse" "ivette" "ivey" "ivonne" "ivory" "ivy" "izetta" "izola" "ja" "jacalyn" "jacelyn" "jacinda" "jacinta" "jacinto" "jack" "jackeline" "jackelyn" "jacki" "jackie" "jacklyn" "jackqueline" "jackson" "jaclyn" "jacob" "jacqualine" "jacque" "jacquelin" "jacqueline" "jacquelyn" "jacquelyne" "jacquelynn" "jacques" "jacquetta" "jacqui" "jacquie" "jacquiline" "jacquline" "jacqulyn" "jada" "jade" "jadwiga" "jae" "jaime" "jaimee" "jaimie" "jake" "jaleesa" "jalisa" "jama" "jamaal" "jamal" "jamar" "jame" "jamee" "jamel" "james" "jamey" "jami" "jamie" "jamika" "jamila" "jamison" "jammie" "jan" "jana" "janae" "janay" "jane" "janean" "janee" "janeen" "janel" "janell" "janella" "janelle" "janene" "janessa" "janet" "janeth" "janett" "janetta" "janette" "janey" "jani" "janice" "janie" "janiece" "janina" "janine" "janis" "janise" "janita" "jann" "janna" "jannet" "jannette" "jannie" "janyce" "jaqueline" "jaquelyn" "jared" "jarod" "jarred" "jarrett" "jarrod" "jarvis" "jasmin" "jasmine" "jason" "jasper" "jaunita" "javier" "jay" "jaye" "jayme" "jaymie" "jayna" "jayne" "jayson" "jazmin" "jazmine" "jc" "jean" "jeana" "jeane" "jeanelle" "jeanene" "jeanett" "jeanetta" "jeanette" "jeanice" "jeanie" "jeanine" "jeanmarie" "jeanna" "jeanne" "jeannetta" "jeannette" "jeannie" "jeannine" "jed" "jeff" "jefferey" "jefferson" "jeffery" "jeffie" "jeffrey" "jeffry" "jen" "jena" "jenae" "jene" "jenee" "jenell" "jenelle" "jenette" "jeneva" "jeni" "jenice" "jenifer" "jeniffer" "jenine" "jenise" "jenna" "jennefer" "jennell" "jennette" "jenni" "jennie" "jennifer" "jenniffer" "jennine" "jenny" "jerald" "jeraldine" "jeramy" "jere" "jeremiah" "jeremy" "jeri" "jerica" "jerilyn" "jerlene" "jermaine" "jerold" "jerome" "jeromy" "jerrell" "jerri" "jerrica" "jerrie" "jerrod" "jerrold" "jerry" "jesenia" "jesica" "jess" "jesse" "jessenia" "jessi" "jessia" "jessica" "jessie" "jessika" "jestine" "jesus" "jesusa" "jesusita" "jetta" "jettie" "jewel" "jewell" "ji" "jill" "jillian" "jim" "jimmie" "jimmy" "jin" "jina" "jinny" "jo" "joan" "joana" "joane" "joanie" "joann" "joanna" "joanne" "joannie" "joaquin" "joaquina" "jocelyn" "jodee" "jodi" "jodie" "jody" "joe" "joeann" "joel" "joella" "joelle" "joellen" "joesph" "joetta" "joette" "joey" "johana" "johanna" "johanne" "john" "johna" "johnathan" "johnathon" "johnetta" "johnette" "johnie" "johnna" "johnnie" "johnny" "johnsie" "johnson" "joi" "joie" "jolanda" "joleen" "jolene" "jolie" "joline" "jolyn" "jolynn" "jon" "jona" "jonah" "jonas" "jonathan" "jonathon" "jone" "jonell" "jonelle" "jong" "joni" "jonie" "jonna" "jonnie" "jordan" "jordon" "jorge" "jose" "josef" "josefa" "josefina" "josefine" "joselyn" "joseph" "josephina" "josephine" "josette" "josh" "joshua" "josiah" "josie" "joslyn" "jospeh" "josphine" "josue" "jovan" "jovita" "joya" "joyce" "joycelyn" "joye" "juan" "juana" "juanita" "jude" "judi" "judie" "judith" "judson" "judy" "jule" "julee" "julene" "jules" "juli" "julia" "julian" "juliana" "juliane" "juliann" "julianna" "julianne" "julie" "julieann" "julienne" "juliet" "julieta" "julietta" "juliette" "julio" "julissa" "julius" "jung" "junie" "junior" "junita" "junko" "justa" "justin" "justina" "justine" "jutta" "ka" "kacey" "kaci" "kacie" "kacy" "kai" "kaila" "kaitlin" "kaitlyn" "kala" "kaleigh" "kaley" "kali" "kallie" "kalyn" "kam" "kamala" "kami" "kamilah" "kandace" "kandi" "kandice" "kandis" "kandra" "kandy" "kanesha" "kanisha" "kara" "karan" "kareem" "kareen" "karen" "karena" "karey" "kari" "karie" "karima" "karin" "karina" "karine" "karisa" "karissa" "karl" "karla" "karleen" "karlene" "karly" "karlyn" "karma" "karmen" "karol" "karole" "karoline" "karolyn" "karon" "karren" "karri" "karrie" "karry" "kary" "karyl" "karyn" "kasandra" "kasey" "kasha" "kasi" "kasie" "kassandra" "kassie" "kate" "katelin" "katelyn" "katelynn" "katerine" "kathaleen" "katharina" "katharine" "katharyn" "kathe" "katheleen" "katherin" "katherina" "katherine" "kathern" "katheryn" "kathey" "kathi" "kathie" "kathleen" "kathlene" "kathline" "kathlyn" "kathrin" "kathrine" "kathryn" "kathryne" "kathy" "kathyrn" "kati" "katia" "katie" "katina" "katlyn" "katrice" "katrina" "kattie" "katy" "kay" "kayce" "kaycee" "kaye" "kayla" "kaylee" "kayleen" "kayleigh" "kaylene" "kazuko" "kecia" "keeley" "keely" "keena" "keenan" "keesha" "keiko" "keila" "keira" "keisha" "keith" "keitha" "keli" "kelle" "kellee" "kelley" "kelli" "kellie" "kelly" "kellye" "kelsey" "kelsi" "kelsie" "kelvin" "kemberly" "ken" "kena" "kenda" "kendal" "kendall" "kendra" "kendrick" "keneth" "kenia" "kenisha" "kenna" "kenneth" "kennith" "kenny" "kent" "kenton" "kenya" "kenyatta" "kenyetta" "kera" "keren" "keri" "kermit" "kerri" "kerrie" "kerry" "kerstin" "kesha" "keshia" "keturah" "keva" "keven" "kevin" "khadijah" "khalilah" "kia" "kiana" "kiara" "kiera" "kiersten" "kiesha" "kieth" "kiley" "kim" "kimber" "kimberely" "kimberlee" "kimberley" "kimberli" "kimberlie" "kimberly" "kimbery" "kimbra" "kimi" "kimiko" "kina" "kindra" "kip" "kira" "kirby" "kirk" "kirsten" "kirstie" "kirstin" "kisha" "kit" "kittie" "kitty" "kiyoko" "kizzie" "kizzy" "klara" "korey" "kori" "kortney" "kory" "kourtney" "kraig" "kris" "krishna" "krissy" "krista" "kristal" "kristan" "kristeen" "kristel" "kristen" "kristi" "kristian" "kristie" "kristin" "kristina" "kristine" "kristle" "kristofer" "kristopher" "kristy" "kristyn" "krysta" "krystal" "krysten" "krystin" "krystina" "krystle" "krystyna" "kum" "kurt" "kurtis" "kyla" "kyle" "kylee" "kylie" "kym" "kymberly" "kyoko" "kyong" "kyra" "kyung" "lacey" "lachelle" "laci" "lacie" "lacresha" "lacy" "ladawn" "ladonna" "lael" "lahoma" "lai" "laila" "laine" "lajuana" "lakeesha" "lakeisha" "lakendra" "lakenya" "lakesha" "lakeshia" "lakia" "lakiesha" "lakisha" "lakita" "lala" "lamar" "lamonica" "lamont" "lan" "lana" "lance" "landon" "lane" "lanell" "lanelle" "lanette" "lang" "lani" "lanie" "lanita" "lannie" "lanny" "lanora" "laquanda" "laquita" "lara" "larae" "laraine" "laree" "larhonda" "larisa" "larissa" "larita" "laronda" "larraine" "larry" "larue" "lasandra" "lashanda" "lashandra" "lashaun" "lashaunda" "lashawn" "lashawna" "lashawnda" "lashay" "lashell" "lashon" "lashonda" "lashunda" "lasonya" "latanya" "latarsha" "latasha" "latashia" "latesha" "latia" "laticia" "latina" "latisha" "latonia" "latonya" "latoria" "latosha" "latoya" "latoyia" "latrice" "latricia" "latrina" "latrisha" "launa" "laura" "lauralee" "lauran" "laure" "laureen" "laurel" "lauren" "laurena" "laurence" "laurene" "lauretta" "laurette" "lauri" "laurice" "laurie" "laurinda" "laurine" "lauryn" "lavada" "lavelle" "lavenia" "lavera" "lavern" "laverna" "laverne" "laveta" "lavette" "lavina" "lavinia" "lavon" "lavona" "lavonda" "lavone" "lavonia" "lavonna" "lavonne" "lawana" "lawanda" "lawanna" "lawerence" "lawrence" "layla" "layne" "lazaro" "le" "lea" "leah" "lean" "leana" "leandra" "leandro" "leann" "leanna" "leanne" "leanora" "leatha" "leatrice" "lecia" "leda" "lee" "leeann" "leeanna" "leeanne" "leena" "leesa" "leia" "leida" "leif" "leigh" "leigha" "leighann" "leila" "leilani" "leisa" "leisha" "lekisha" "lela" "lelah" "leland" "lelia" "lemuel" "len" "lena" "lenard" "lenita" "lenna" "lennie" "lenny" "lenora" "lenore" "leo" "leola" "leoma" "leon" "leona" "leonard" "leonarda" "leonardo" "leone" "leonel" "leonia" "leonida" "leonie" "leonila" "leonor" "leonora" "leonore" "leontine" "leopoldo" "leora" "leota" "lera" "leroy" "les" "lesa" "lesha" "lesia" "leslee" "lesley" "lesli" "leslie" "lessie" "lester" "leta" "letha" "leticia" "letisha" "letitia" "lettie" "letty" "levi" "lewis" "lexie" "lezlie" "li" "lia" "liana" "liane" "lianne" "libbie" "libby" "liberty" "librada" "lida" "lidia" "lien" "lieselotte" "ligia" "lila" "lili" "lilia" "lilian" "liliana" "lilla" "lilli" "lillia" "lilliam" "lillian" "lilliana" "lillie" "lilly" "lily" "lin" "lina" "lincoln" "linda" "lindsay" "lindsey" "lindsy" "lindy" "linette" "ling" "linh" "linn" "linnea" "linnie" "lino" "linsey" "linwood" "lionel" "lisa" "lisabeth" "lisandra" "lisbeth" "lise" "lisette" "lisha" "lissa" "lissette" "lita" "livia" "liz" "liza" "lizabeth" "lizbeth" "lizeth" "lizette" "lizzette" "lizzie" "lloyd" "loan" "logan" "loida" "lois" "loise" "lola" "lolita" "loma" "lon" "lona" "londa" "loni" "lonna" "lonnie" "lonny" "lora" "loraine" "loralee" "lore" "lorean" "loree" "loreen" "lorelei" "loren" "lorena" "lorene" "lorenza" "lorenzo" "loreta" "loretta" "lorette" "lori" "loria" "loriann" "lorie" "lorilee" "lorina" "lorinda" "lorine" "loris" "lorita" "lorna" "lorraine" "lorretta" "lorri" "lorriane" "lorrie" "lorrine" "lory" "lottie" "lou" "louann" "louanne" "louella" "louetta" "louie" "louis" "louisa" "louise" "loura" "lourdes" "lourie" "louvenia" "lovella" "lovetta" "lovie" "lowell" "loyce" "loyd" "lu" "luana" "luann" "luanna" "luanne" "luba" "lucas" "luci" "lucia" "luciana" "luciano" "lucie" "lucien" "lucienne" "lucila" "lucile" "lucilla" "lucille" "lucina" "lucinda" "lucio" "lucius" "lucrecia" "lucretia" "lucy" "ludie" "ludivina" "lue" "luella" "luetta" "luigi" "luis" "luisa" "luise" "luke" "lula" "lulu" "luna" "lupe" "lupita" "lura" "lurlene" "lurline" "luther" "luvenia" "luz" "lyda" "lydia" "lyla" "lyle" "lyman" "lyn" "lynda" "lyndia" "lyndon" "lyndsay" "lyndsey" "lynell" "lynelle" "lynetta" "lynette" "lynn" "lynna" "lynne" "lynnette" "lynsey" "lynwood" "mabel" "mabelle" "mable" "mac" "machelle" "macie" "mack" "mackenzie" "macy" "madalene" "madaline" "madalyn" "maddie" "madelaine" "madeleine" "madelene" "madeline" "madelyn" "madge" "madie" "madison" "madlyn" "madonna" "mae" "maegan" "mafalda" "magali" "magaly" "magan" "magaret" "magda" "magdalen" "magdalena" "magdalene" "magen" "maggie" "magnolia" "mahalia" "mai" "maia" "maida" "maile" "maira" "maire" "maisha" "maisie" "majorie" "makeda" "malcolm" "malcom" "malena" "malia" "malik" "malika" "malinda" "malisa" "malissa" "malka" "mallie" "mallory" "malorie" "malvina" "mamie" "mammie" "mana" "manda" "mandi" "mandie" "mandy" "manie" "manual" "manuel" "manuela" "mao" "maple" "mara" "maragaret" "maragret" "maranda" "marc" "marcel" "marcela" "marcelene" "marcelina" "marceline" "marcelino" "marcell" "marcella" "marcelle" "marcellus" "marcelo" "marcene" "marchelle" "marci" "marcia" "marcie" "marco" "marcos" "marcus" "marcy" "mardell" "maren" "marg" "margaret" "margareta" "margarete" "margarett" "margaretta" "margarette" "margarita" "margarite" "margarito" "margart" "marge" "margene" "margeret" "margert" "margery" "marget" "margherita" "margie" "margit" "margo" "margorie" "margot" "margret" "margrett" "marguerita" "marguerite" "margurite" "margy" "marhta" "mari" "maria" "mariah" "mariam" "marian" "mariana" "marianela" "mariann" "marianna" "marianne" "mariano" "maribel" "maribeth" "marica" "maricela" "maricruz" "marie" "mariel" "mariela" "mariella" "marielle" "marietta" "mariette" "mariko" "marilee" "marilou" "marilu" "marilyn" "marilynn" "marin" "marina" "marinda" "marine" "mario" "marion" "maris" "marisa" "marisela" "marisha" "marisol" "marissa" "marita" "maritza" "marivel" "marjorie" "marjory" "marketta" "markita" "markus" "marla" "marlana" "marleen" "marlen" "marlena" "marlene" "marlin" "marline" "marlo" "marlon" "marlyn" "marlys" "marna" "marni" "marnie" "marquerite" "marquetta" "marquis" "marquita" "marquitta" "marry" "marsha" "marshall" "marta" "marth" "martha" "marti" "martin" "martina" "martine" "marty" "marva" "marvel" "marvella" "marvin" "marvis" "marx" "mary" "marya" "maryalice" "maryam" "maryann" "maryanna" "maryanne" "marybelle" "marybeth" "maryellen" "maryetta" "maryjane" "maryjo" "maryland" "marylee" "marylin" "maryln" "marylou" "marylouise" "marylyn" "marylynn" "maryrose" "masako" "mason" "matha" "mathew" "mathilda" "mathilde" "matilda" "matilde" "matt" "matthew" "mattie" "maud" "maude" "maudie" "maura" "maureen" "maurice" "mauricio" "maurine" "maurita" "mauro" "mavis" "max" "maxie" "maxima" "maximina" "maximo" "maxine" "maxwell" "maya" "maybell" "maybelle" "maye" "mayme" "maynard" "mayola" "mayra" "mazie" "mckenzie" "mckinley" "meagan" "meaghan" "mechelle" "meda" "mee" "meg" "megan" "meggan" "meghan" "meghann" "mei" "mel" "melaine" "melani" "melania" "melanie" "melany" "melba" "melda" "melia" "melida" "melina" "melinda" "melisa" "melissa" "melissia" "melita" "mellie" "mellisa" "mellissa" "melodee" "melodi" "melodie" "melonie" "melony" "melva" "melvin" "melvina" "melynda" "mendy" "mercedes" "mercedez" "mercy" "meredith" "meri" "merideth" "meridith" "merilyn" "merissa" "merle" "merlene" "merlin" "merlyn" "merna" "merri" "merrie" "merrilee" "merrill" "merry" "mertie" "mervin" "meryl" "meta" "mi" "mia" "mica" "micaela" "micah" "micha" "michael" "michaela" "michaele" "michal" "michale" "micheal" "michel" "michele" "michelina" "micheline" "michell" "michelle" "michiko" "mickey" "micki" "mickie" "miesha" "migdalia" "mignon" "miguel" "miguelina" "mika" "mikaela" "mike" "mikel" "miki" "mikki" "mila" "milagro" "milagros" "milan" "milda" "mildred" "miles" "milford" "milissa" "millard" "millicent" "millie" "milly" "milo" "milton" "mimi" "min" "mina" "minda" "mindi" "mindy" "minerva" "ming" "minh" "minna" "minnie" "minta" "miquel" "mira" "miranda" "mireille" "mirella" "mireya" "miriam" "mirian" "mirna" "mirta" "mirtha" "misha" "missy" "misti" "mistie" "misty" "mitch" "mitchel" "mitchell" "mitsue" "mitsuko" "mittie" "mitzi" "mitzie" "miyoko" "modesta" "modesto" "mohamed" "mohammad" "mohammed" "moira" "moises" "mollie" "molly" "mona" "monet" "monica" "monika" "monique" "monnie" "monroe" "monserrate" "monte" "monty" "mora" "morgan" "moriah" "morris" "morton" "mose" "moses" "moshe" "mozell" "mozella" "mozelle" "mui" "muoi" "muriel" "murray" "myesha" "myles" "myong" "myra" "myriam" "myrl" "myrle" "myrna" "myron" "myrta" "myrtice" "myrtie" "myrtis" "myrtle" "myung" "nada" "nadene" "nadia" "nadine" "naida" "nakesha" "nakia" "nakisha" "nakita" "nam" "nan" "nana" "nancee" "nancey" "nanci" "nancie" "nancy" "nanette" "nannette" "nannie" "naoma" "naomi" "napoleon" "narcisa" "natacha" "natalia" "natalie" "natalya" "natasha" "natashia" "nathalie" "nathan" "nathanael" "nathanial" "nathaniel" "natisha" "natividad" "natosha" "neal" "necole" "ned" "neda" "nedra" "neely" "neida" "neil" "nelda" "nelia" "nelida" "nell" "nella" "nelle" "nellie" "nelly" "nelson" "nena" "nenita" "neoma" "neomi" "nereida" "nerissa" "nery" "nestor" "neta" "nettie" "neva" "nevada" "neville" "newton" "nga" "ngan" "ngoc" "nguyet" "nia" "nichelle" "nichol" "nicholas" "nichole" "nicholle" "nick" "nicki" "nickie" "nickolas" "nickole" "nicky" "nicol" "nicola" "nicolas" "nicolasa" "nicole" "nicolette" "nicolle" "nida" "nidia" "niesha" "nieves" "nigel" "niki" "nikia" "nikita" "nikki" "nikole" "nila" "nilda" "nilsa" "nina" "ninfa" "nisha" "nita" "noah" "noble" "nobuko" "noe" "noel" "noelia" "noella" "noelle" "noemi" "nohemi" "nola" "nolan" "noma" "nona" "nora" "norah" "norbert" "norberto" "noreen" "norene" "noriko" "norine" "norma" "norman" "normand" "norris" "nova" "novella" "nu" "nubia" "numbers" "nydia" "nyla" "obdulia" "ocie" "octavia" "octavio" "oda" "odelia" "odell" "odessa" "odette" "odilia" "odis" "ofelia" "ola" "olen" "olene" "oleta" "olevia" "olga" "olimpia" "olin" "olinda" "oliva" "olive" "oliver" "olivia" "ollie" "olympia" "oma" "omar" "omega" "omer" "ona" "oneida" "onie" "onita" "opal" "ophelia" "ora" "oralee" "oralia" "oren" "oretha" "orlando" "orpha" "orval" "orville" "oscar" "ossie" "osvaldo" "oswaldo" "otelia" "otha" "otilia" "otis" "otto" "ouida" "owen" "ozell" "ozella" "ozie" "pa" "pablo" "paige" "palma" "palmer" "palmira" "pam" "pamala" "pamela" "pamelia" "pamella" "pamila" "pamula" "pandora" "pansy" "paola" "paris" "parker" "parthenia" "particia" "pasquale" "pasty" "pat" "patience" "patria" "patrica" "patrice" "patricia" "patrick" "patrina" "patsy" "patti" "pattie" "patty" "paul" "paula" "paulene" "pauletta" "paulette" "paulina" "pauline" "paulita" "paz" "pearl" "pearle" "pearlene" "pearlie" "pearline" "pearly" "pedro" "peg" "peggie" "peggy" "pei" "penelope" "penney" "penni" "pennie" "penny" "percy" "perla" "perry" "pete" "peter" "petra" "petrina" "petronila" "phebe" "phil" "philip" "phillip" "phillis" "philomena" "phoebe" "phung" "phuong" "phylicia" "phylis" "phyliss" "phyllis" "pia" "piedad" "pierre" "pilar" "ping" "pinkie" "piper" "pok" "polly" "porfirio" "porsche" "porsha" "porter" "portia" "precious" "preston" "pricilla" "prince" "princess" "priscila" "priscilla" "providencia" "prudence" "pura" "qiana" "queen" "queenie" "quentin" "quiana" "quincy" "quinn" "quintin" "quinton" "quyen" "rachael" "rachal" "racheal" "rachel" "rachele" "rachell" "rachelle" "racquel" "rae" "raeann" "raelene" "rafael" "rafaela" "raguel" "raina" "raisa" "raleigh" "ralph" "ramiro" "ramon" "ramona" "ramonita" "rana" "ranae" "randa" "randal" "randall" "randee" "randell" "randi" "randolph" "randy" "ranee" "raphael" "raquel" "rashad" "rasheeda" "rashida" "raul" "raven" "ray" "raye" "rayford" "raylene" "raymon" "raymond" "raymonde" "raymundo" "rayna" "rea" "reagan" "reanna" "reatha" "reba" "rebbeca" "rebbecca" "rebeca" "rebecca" "rebecka" "rebekah" "reda" "reed" "reena" "refugia" "refugio" "regan" "regena" "regenia" "reggie" "regina" "reginald" "regine" "reginia" "reid" "reiko" "reina" "reinaldo" "reita" "rema" "remedios" "remona" "rena" "renae" "renaldo" "renata" "renate" "renato" "renay" "renda" "rene" "renea" "renee" "renetta" "renita" "renna" "ressie" "reta" "retha" "retta" "reuben" "reva" "rex" "rey" "reyes" "reyna" "reynalda" "reynaldo" "rhea" "rheba" "rhett" "rhiannon" "rhoda" "rhona" "rhonda" "ria" "ricarda" "ricardo" "richard" "richelle" "richie" "rick" "rickey" "ricki" "rickie" "ricky" "rico" "rigoberto" "rikki" "riley" "rima" "rina" "risa" "rita" "riva" "rivka" "rob" "robbi" "robbie" "robbin" "robby" "robbyn" "robena" "robert" "roberta" "roberto" "robin" "robt" "robyn" "rocco" "rochel" "rochell" "rochelle" "rocio" "rocky" "rod" "roderick" "rodger" "rodney" "rodolfo" "rodrick" "rodrigo" "rogelio" "roger" "roland" "rolanda" "rolande" "rolando" "rolf" "rolland" "roma" "romaine" "roman" "romana" "romelia" "romeo" "romona" "ron" "rona" "ronald" "ronda" "roni" "ronna" "ronni" "ronnie" "ronny" "roosevelt" "rory" "rosa" "rosalba" "rosalee" "rosalia" "rosalie" "rosalina" "rosalind" "rosalinda" "rosaline" "rosalva" "rosalyn" "rosamaria" "rosamond" "rosana" "rosann" "rosanna" "rosanne" "rosaria" "rosario" "rosaura" "roscoe" "roseann" "roseanna" "roseanne" "roselee" "roselia" "roseline" "rosella" "roselle" "roselyn" "rosemarie" "rosemary" "rosena" "rosenda" "rosendo" "rosetta" "rosette" "rosia" "rosie" "rosina" "rosio" "rosita" "roslyn" "ross" "rossana" "rossie" "rosy" "rowena" "roxana" "roxane" "roxann" "roxanna" "roxanne" "roxie" "roxy" "roy" "royal" "royce" "rozanne" "rozella" "ruben" "rubi" "rubie" "rubin" "ruby" "rubye" "rudolf" "rudolph" "rudy" "rueben" "rufina" "rufus" "rupert" "russ" "russel" "russell" "rusty" "ruth" "rutha" "ruthann" "ruthanne" "ruthe" "ruthie" "ryan" "ryann" "sabina" "sabine" "sabra" "sabrina" "sacha" "sachiko" "sade" "sadie" "sadye" "sage" "sal" "salena" "salina" "salley" "sallie" "sally" "salome" "salvador" "salvatore" "sam" "samantha" "samara" "samatha" "samella" "samira" "sammie" "sammy" "samual" "samuel" "sana" "sanda" "sandee" "sandi" "sandie" "sandra" "sandy" "sanford" "sang" "sanjuana" "sanjuanita" "sanora" "santa" "santana" "santiago" "santina" "santo" "santos" "sara" "sarah" "sarai" "saran" "sari" "sarina" "sarita" "sasha" "saturnina" "sau" "saul" "saundra" "savanna" "savannah" "scarlet" "scarlett" "scot" "scott" "scottie" "scotty" "sean" "sebastian" "sebrina" "seema" "selena" "selene" "selina" "selma" "sena" "senaida" "serafina" "serena" "sergio" "serina" "serita" "seth" "setsuko" "seymour" "sha" "shad" "shae" "shaina" "shakia" "shakira" "shakita" "shala" "shalanda" "shalon" "shalonda" "shameka" "shamika" "shana" "shanae" "shanda" "shandi" "shandra" "shane" "shaneka" "shanel" "shanell" "shanelle" "shani" "shanice" "shanika" "shaniqua" "shanita" "shanna" "shannan" "shannon" "shanon" "shanta" "shantae" "shantay" "shante" "shantel" "shantell" "shantelle" "shanti" "shaquana" "shaquita" "shara" "sharan" "sharda" "sharee" "sharell" "sharen" "shari" "sharice" "sharie" "sharika" "sharilyn" "sharita" "sharla" "sharleen" "sharlene" "sharmaine" "sharolyn" "sharon" "sharonda" "sharri" "sharron" "sharyl" "sharyn" "shasta" "shaun" "shauna" "shaunda" "shaunna" "shaunta" "shaunte" "shavon" "shavonda" "shavonne" "shawana" "shawanda" "shawanna" "shawn" "shawna" "shawnda" "shawnee" "shawnna" "shawnta" "shay" "shayla" "shayna" "shayne" "shea" "sheba" "sheena" "sheila" "sheilah" "shela" "shelba" "shelby" "sheldon" "shelia" "shella" "shelley" "shelli" "shellie" "shelly" "shelton" "shemeka" "shemika" "shena" "shenika" "shenita" "shenna" "shera" "sheree" "sherell" "sheri" "sherice" "sheridan" "sherie" "sherika" "sherill" "sherilyn" "sherise" "sherita" "sherlene" "sherley" "sherly" "sherlyn" "sherman" "sheron" "sherrell" "sherri" "sherrie" "sherril" "sherrill" "sherron" "sherry" "sherryl" "sherwood" "shery" "sheryl" "sheryll" "shiela" "shila" "shiloh" "shin" "shira" "shirely" "shirl" "shirlee" "shirleen" "shirlene" "shirley" "shirly" "shizue" "shizuko" "shon" "shona" "shonda" "shondra" "shonna" "shonta" "shoshana" "shu" "shyla" "sibyl" "sid" "sidney" "sierra" "signe" "sigrid" "silas" "silva" "silvana" "silvia" "sima" "simon" "simona" "simone" "simonne" "sina" "sindy" "siobhan" "sirena" "siu" "sixta" "skye" "slyvia" "socorro" "sofia" "soila" "sol" "solange" "soledad" "solomon" "somer" "sommer" "sona" "sondra" "sonia" "sonja" "sonny" "sonya" "soo" "sook" "sophia" "sophie" "soraya" "sparkle" "spencer" "stacee" "stacey" "staci" "stacia" "stacie" "stacy" "stan" "stanford" "stanley" "stanton" "starla" "starr" "stasia" "stefan" "stefani" "stefania" "stefanie" "stefany" "steffanie" "stella" "stepanie" "stephaine" "stephan" "stephane" "stephani" "stephania" "stephanie" "stephany" "stephen" "stephenie" "stephine" "stephnie" "sterling" "steve" "steven" "stevie" "stewart" "stormy" "stuart" "su" "suanne" "sudie" "sue" "sueann" "suellen" "suk" "sulema" "sumiko" "sunday" "sung" "sunni" "sunny" "sunshine" "susan" "susana" "susann" "susanna" "susannah" "susanne" "susie" "susy" "suzan" "suzann" "suzanna" "suzanne" "suzette" "suzi" "suzie" "suzy" "svetlana" "sybil" "syble" "sydney" "sylvester" "sylvia" "sylvie" "synthia" "syreeta" "ta" "tabatha" "tabetha" "tabitha" "tad" "tai" "taina" "taisha" "tajuana" "takako" "takisha" "talia" "talisha" "talitha" "tam" "tama" "tamala" "tamar" "tamara" "tamatha" "tambra" "tameika" "tameka" "tamekia" "tamela" "tamera" "tamesha" "tami" "tamica" "tamie" "tamika" "tamiko" "tamisha" "tammara" "tammera" "tammi" "tammie" "tammy" "tamra" "tana" "tandra" "tandy" "taneka" "tanesha" "tangela" "tania" "tanika" "tanisha" "tanja" "tanna" "tanner" "tanya" "tara" "tarah" "taren" "tari" "tarra" "tarsha" "taryn" "tasha" "tashia" "tashina" "tasia" "tatiana" "tatum" "tatyana" "taunya" "tawana" "tawanda" "tawanna" "tawna" "tawny" "tawnya" "taylor" "tayna" "ted" "teddy" "teena" "tegan" "teisha" "telma" "temeka" "temika" "tempie" "temple" "tena" "tenesha" "tenisha" "tennie" "tennille" "teodora" "teodoro" "teofila" "tequila" "tera" "tereasa" "terence" "teresa" "terese" "teresia" "teresita" "teressa" "teri" "terica" "terina" "terisa" "terra" "terrance" "terrell" "terrence" "terresa" "terri" "terrie" "terrilyn" "terry" "tesha" "tess" "tessa" "tessie" "thad" "thaddeus" "thalia" "thanh" "thao" "thea" "theda" "thelma" "theo" "theodora" "theodore" "theola" "theresa" "therese" "theresia" "theressa" "theron" "thersa" "thi" "thomas" "thomasena" "thomasina" "thomasine" "thora" "thresa" "thu" "thurman" "thuy" "tia" "tiana" "tianna" "tiara" "tien" "tiera" "tierra" "tiesha" "tifany" "tiffaney" "tiffani" "tiffanie" "tiffany" "tiffiny" "tijuana" "tilda" "tillie" "tim" "timika" "timmy" "timothy" "tina" "tinisha" "tisa" "tish" "tisha" "titus" "tobi" "tobias" "tobie" "toby" "toccara" "tod" "todd" "toi" "tom" "tomas" "tomasa" "tomeka" "tomi" "tomika" "tomiko" "tommie" "tommy" "tommye" "tomoko" "tona" "tonda" "tonette" "toney" "toni" "tonia" "tonie" "tonisha" "tonita" "tonja" "tony" "tonya" "tora" "tori" "torie" "torri" "torrie" "tory" "tosha" "toshia" "toshiko" "tova" "towanda" "toya" "tracee" "tracey" "traci" "tracie" "tracy" "tran" "trang" "travis" "treasa" "treena" "trena" "trent" "trenton" "tresa" "tressa" "tressie" "treva" "trevor" "trey" "tricia" "trina" "trinh" "trinidad" "trinity" "trish" "trisha" "trista" "tristan" "troy" "trudi" "trudie" "trudy" "trula" "truman" "tu" "tuan" "tula" "tuyet" "twana" "twanda" "twanna" "twila" "twyla" "ty" "tyesha" "tyisha" "tyler" "tynisha" "tyra" "tyree" "tyrell" "tyron" "tyrone" "tyson" "ula" "ulrike" "ulysses" "una" "ursula" "usha" "ute" "vada" "val" "valarie" "valda" "valencia" "valene" "valentin" "valentina" "valentine" "valeri" "valeria" "valerie" "valery" "vallie" "valorie" "valrie" "van" "vance" "vanda" "vanesa" "vanessa" "vanetta" "vania" "vanita" "vanna" "vannesa" "vannessa" "vashti" "vasiliki" "vaughn" "veda" "velda" "velia" "vella" "velma" "velva" "velvet" "vena" "venessa" "venetta" "venice" "venita" "vennie" "venus" "veola" "vera" "verda" "verdell" "verdie" "verena" "vergie" "verla" "verlene" "verlie" "verline" "vern" "verna" "vernell" "vernetta" "vernia" "vernice" "vernie" "vernita" "vernon" "verona" "veronica" "veronika" "veronique" "versie" "vertie" "vesta" "veta" "vi" "vicenta" "vicente" "vickey" "vicki" "vickie" "vicky" "victor" "victoria" "victorina" "vida" "viki" "vikki" "vilma" "vina" "vince" "vincent" "vincenza" "vincenzo" "vinita" "vinnie" "viola" "violet" "violeta" "violette" "virgen" "virgie" "virgil" "virgilio" "virgina" "virginia" "vita" "vito" "viva" "vivan" "vivian" "viviana" "vivien" "vivienne" "von" "voncile" "vonda" "vonnie" "wade" "wai" "waldo" "walker" "wallace" "wally" "walter" "walton" "waltraud" "wan" "wanda" "waneta" "wanetta" "wanita" "ward" "warner" "warren" "wava" "waylon" "wayne" "wei" "weldon" "wen" "wendell" "wendi" "wendie" "wendolyn" "wendy" "wenona" "werner" "wes" "wesley" "weston" "whitley" "whitney" "wilber" "wilbert" "wilbur" "wilburn" "wilda" "wiley" "wilford" "wilfred" "wilfredo" "wilhelmina" "wilhemina" "willa" "willard" "willena" "willene" "willetta" "willette" "willia" "william" "williams" "willian" "willie" "williemae" "willis" "willodean" "willow" "willy" "wilma" "wilmer" "wilson" "wilton" "windy" "winford" "winfred" "winifred" "winnie" "winnifred" "winona" "winston" "wm" "wonda" "woodrow" "wyatt" "wynell" "wynona" "xavier" "xenia" "xiao" "xiomara" "xochitl" "xuan" "yadira" "yaeko" "yael" "yahaira" "yajaira" "yan" "yang" "yanira" "yasmin" "yasmine" "yasuko" "yee" "yelena" "yen" "yer" "yesenia" "yessenia" "yetta" "yevette" "yi" "ying" "yoko" "yolanda" "yolande" "yolando" "yolonda" "yon" "yong" "yoshie" "yoshiko" "youlanda" "yu" "yuette" "yuk" "yuki" "yukiko" "yuko" "yulanda" "yun" "yung" "yuonne" "yuri" "yuriko" "yvette" "yvone" "yvonne" "zachariah" "zachary" "zachery" "zack" "zackary" "zada" "zaida" "zana" "zandra" "zane" "zelda" "zella" "zelma" "zena" "zenaida" "zenia" "zenobia" "zetta" "zina" "zita" "zoe" "zofia" "zoila" "zola" "zona" "zonia" "zora" "zoraida" "zula" "zulema" "zulma" "alaska" "alabama" "arkansas" "american samoa" "arizona" "california" "colorado" "connecticut" "district" "columbia" "delaware" "guam" "hawaii" "iowa" "idaho" "illinois" "indiana" "kansas" "kentucky" "louisiana" "massachusetts" "maine" "michigan" "minnesota" "missouri" "mississippi" "montana" "north carolina" "north dakota" "nebraska" "new hampshire" "new jersey" "new mexico" "new york" "ohio" "oklahoma" "oregon" "pennsylvania" "puerto rico" "rhode island" "south carolina" "south dakota" "tennessee" "texas" "utah" "virgin islands" "vermont" "washington" "wisconsin" "west virginia" "wyoming" "afghanistan" "albania" "algeria" "andorra" "angola" "antigua & deps" "armenia" "australia" "austria" "azerbaijan" "bahamas" "bahrain" "bangladesh" "barbados" "belarus" "belgium" "belize" "benin" "bhutan" "bolivia" "bosnia herzegovina" "botswana" "brazil" "brunei" "bulgaria" "burkina" "burundi" "cambodia" "cameroon" "canada" "cape verde" "central african rep" "chile" "colombia" "comoros" "congo" "congo {democratic rep}" "costa rica" "croatia" "cuba" "cyprus" "czech republic" "denmark" "djibouti" "dominican republic" "east timor" "ecuador" "egypt" "el salvador" "equatorial guinea" "eritrea" "estonia" "ethiopia" "fiji" "finland" "gabon" "gambia" "germany" "ghana" "greece" "grenada" "guatemala" "guinea" "guinea-bissau" "guyana" "haiti" "honduras" "hungary" "iceland" "indonesia" "iran" "iraq" "ireland {republic}" "italy" "ivory coast" "jamaica" "japan" "kazakhstan" "kiribati" "korea north" "korea south" "kosovo" "kuwait" "kyrgyzstan" "laos" "latvia" "lebanon" "lesotho" "liberia" "libya" "liechtenstein" "lithuania" "luxembourg" "macedonia" "madagascar" "malawi" "malaysia" "maldives" "mali" "malta" "marshall islands" "mauritania" "mauritius" "mexico" "micronesia" "moldova" "monaco" "mongolia" "montenegro" "morocco" "mozambique" "myanmar, {burma}" "namibia" "nauru" "nepal" "netherlands" "new zealand" "nicaragua" "niger" "nigeria" "norway" "oman" "pakistan" "palau" "panama" "papua new guinea" "paraguay" "peru" "philippines" "poland" "portugal" "qatar" "romania" "russian federation" "rwanda" "st kitts & nevis" "st lucia" "saint vincent & the grenadines" "samoa" "san marino" "sao tome & principe" "saudi arabia" "senegal" "serbia" "seychelles" "sierra leone" "singapore" "slovakia" "slovenia" "solomon islands" "somalia" "south africa" "south sudan" "spain" "sri lanka" "sudan" "suriname" "swaziland" "sweden" "switzerland" "syria" "taiwan" "tajikistan" "tanzania" "thailand" "togo" "tonga" "trinidad & tobago" "tunisia" "turkey" "turkmenistan" "tuvalu" "uganda" "ukraine" "united arab emirates" "united kingdom" "united states" "uruguay" "uzbekistan" "vanuatu" "vatican city" "venezuela" "vietnam" "yemen" "zambia" "zimbabwe" "aberdeen" "abilene" "akron" "albany" "albuquerque" "allentown" "amarillo" "anaheim" "anchorage" "ann arbor" "antioch" "apple valley" "appleton" "arlington" "arvada" "asheville" "athens" "atlanta" "atlantic city" "bakersfield" "baltimore" "barnstable" "baton rouge" "beaumont" "bel air" "bellevue" "berkeley" "bethlehem" "billings" "birmingham" "bloomington" "boise" "boise city" "bonita springs" "boston" "boulder" "bradenton" "bremerton" "bridgeport" "brighton" "brownsville" "buffalo" "burbank" "burlington" "cambridge" "canton" "cape coral" "carrollton" "cathedral city" "cedar rapids" "champaign" "chandler" "charleston" "chattanooga" "chesapeake" "chicago" "chula vista" "cincinnati" "clarke county" "clarksville" "clearwater" "college station" "colorado springs" "concord" "coral springs" "corona" "corpus christi" "costa mesa" "daly city" "danbury" "davenport" "davidson county" "dayton" "daytona beach" "deltona" "denton" "des moines" "detroit" "downey" "duluth" "durham" "el monte" "el paso" "elk grove" "elkhart" "erie" "escondido" "evansville" "fairfield" "fargo" "fayetteville" "fitchburg" "flint" "fontana" "fort collins" "fort lauderdale" "fort smith" "fort walton beach" "fort wayne" "fort worth" "fremont" "fresno" "fullerton" "gainesville" "garden grove" "gastonia" "glendale" "grand prairie" "grand rapids" "grayslake" "green bay" "greenbay" "greensboro" "greenville" "gulfport-biloxi" "hagerstown" "hampton" "harlingen" "harrisburg" "hartford" "havre de grace" "hayward" "hemet" "henderson" "hesperia" "hialeah" "hickory" "high point" "hollywood" "honolulu" "houma" "howell" "huntington" "huntington beach" "huntsville" "independence" "indianapolis" "inglewood" "irvine" "jacksonville" "jersey city" "johnson city" "joliet" "kailua" "kalamazoo" "kaneohe" "kansas city" "kennewick" "kenosha" "killeen" "kissimmee" "knoxville" "lafayette" "lake charles" "lakeland" "lakewood" "lancaster" "lansing" "laredo" "las cruces" "las vegas" "layton" "leominster" "lewisville" "lexington" "little rock" "long beach" "lorain" "los angeles" "louisville" "lubbock" "macon" "manchester" "marysville" "mcallen" "mchenry" "medford" "melbourne" "memphis" "merced" "mesa" "mesquite" "miami" "milwaukee" "minneapolis" "miramar" "mission viejo" "mobile" "monterey" "montgomery" "moreno valley" "murfreesboro" "murrieta" "muskegon" "myrtle beach" "naperville" "naples" "nashua" "nashville" "new bedford" "new haven" "new london" "new orleans" "new york city" "newark" "newburgh" "newport news" "norfolk" "normal" "north charleston" "north las vegas" "north port" "norwalk" "norwich" "oakland" "ocala" "oceanside" "ogden" "oklahoma city" "olathe" "omaha" "ontario" "orange" "orem" "overland park" "oxnard" "palm bay" "palm springs" "palmdale" "panama city" "pasadena" "paterson" "pembroke pines" "pensacola" "peoria" "philadelphia" "phoenix" "pittsburgh" "plano" "pomona" "pompano beach" "port arthur" "port orange" "port saint lucie" "port st. lucie" "portland" "portsmouth" "poughkeepsie" "providence" "provo" "pueblo" "punta gorda" "racine" "rancho cucamonga" "reading" "redding" "reno" "richland" "richmond" "richmond county" "riverside" "roanoke" "rochester" "rockford" "roseville" "round lake beach" "sacramento" "saginaw" "saint louis" "saint paul" "saint petersburg" "salem" "salinas" "salt lake city" "san antonio" "san bernardino" "san buenaventura" "san diego" "san francisco" "san jose" "santa ana" "santa barbara" "santa clara" "santa clarita" "santa cruz" "santa maria" "santa rosa" "sarasota" "scottsdale" "scranton" "seaside" "seattle" "shreveport" "simi valley" "sioux city" "sioux falls" "south bend" "south lyon" "spartanburg" "spokane" "springdale" "springfield" "st. louis" "st. paul" "st. petersburg" "stamford" "sterling heights" "stockton" "sunnyvale" "syracuse" "tacoma" "tallahassee" "tampa" "temecula" "tempe" "thornton" "thousand oaks" "toledo" "topeka" "torrance" "tucson" "tulsa" "tuscaloosa" "utica" "vallejo" "vancouver" "vero beach" "victorville" "virginia beach" "visalia" "waco" "waterbury" "waterloo" "west covina" "west valley city" "westminster" "wichita" "wilmington" "winter haven" "worcester" "yakima" "yonkers" "york" "youngstown" "monday" "tuesday" "wednesday" "thursday" "friday" "saturday" "information" "copyright" "university" "management" "international" "development" "education" "community" "technology" "resources" "including" "directory" "government" "department" "insurance" "categories" "conditions" "accessories" "questions" "application" "financial" "equipment" "performance" "activities" "additional" "professional" "committee" "reference" "companies" "computers" "president" "discussion" "entertainment" "agreement" "marketing" "association" "collection" "solutions" "electronics" "technical" "microsoft" "conference" "environment" "statement" "downloads" "applications" "requirements" "individual" "subscribe" "production" "commercial" "advertising" "treatment" "newsletter" "knowledge" "construction" "registered" "protection" "engineering" "published" "corporate" "customers" "materials" "countries" "standards" "advertise" "environmental" "availability" "employment" "commission" "administration" "institute" "sponsored" "electronic" "effective" "organization" "selection" "corporation" "executive" "facilities" "opportunities" "statistics" "investment" "christmas" "registration" "furniture" "structure" "distribution" "industrial" "potential" "responsible" "communications" "foundation" "documents" "communication" "independent" "operating" "developed" "telephone" "population" "navigation" "operations" "understand" "publications" "worldwide" "connection" "publisher" "introduction" "properties" "accommodation" "excellent" "opportunity" "assessment" "interface" "operation" "restaurants" "beautiful" "locations" "technologies" "manufacturer" "providing" "authority" "considered" "programme" "enterprise" "educational" "employees" "alternative" "processing" "responsibility" "resolution" "publication" "relations" "photography" "components" "assistance" "completed" "organizations" "transportation" "disclaimer" "membership" "recommended" "background" "maintenance" "functions" "trademarks" "phentermine" "submitted" "television" "interested" "established" "programming" "instructions" "increased" "understanding" "associates" "instruments" "businesses" "restaurant" "procedures" "relationship" "traditional" "transport" "interesting" "evaluation" "implementation" "galleries" "references" "presented" "literature" "respective" "definition" "secretary" "networking" "australian" "magazines" "individuals" "guidelines" "installation" "attention" "difference" "regulations" "certificate" "directions" "documentation" "automotive" "successful" "communities" "situation" "publishing" "emergency" "developing" "announcements" "historical" "ringtones" "scientific" "satellite" "functional" "monitoring" "architecture" "recommend" "accounting" "manufacturing" "professor" "generally" "continued" "techniques" "permission" "generation" "component" "guarantee" "processes" "interests" "paperback" "classifieds" "supported" "competition" "providers" "characters" "thousands" "apartments" "generated" "administrative" "practices" "reporting" "essential" "affiliate" "designated" "integrated" "configuration" "comprehensive" "universal" "presentation" "languages" "compliance" "improvement" "challenge" "acceptance" "strategies" "affiliates" "multimedia" "certified" "computing" "interactive" "procedure" "leadership" "religious" "breakfast" "developer" "recommendations" "comparison" "automatically" "adventure" "institutions" "assistant" "advertisement" "headlines" "yesterday" "determined" "wholesale" "extension" "statements" "completely" "electrical" "applicable" "manufacturers" "classical" "dedicated" "direction" "basketball" "personnel" "identified" "professionals" "advantage" "newsletters" "estimated" "anonymous" "miscellaneous" "integration" "interview" "framework" "installed" "associate" "frequently" "discussions" "laboratory" "destination" "intelligence" "specifications" "tripadvisor" "residential" "decisions" "industries" "partnership" "editorial" "expression" "provisions" "principles" "suggestions" "replacement" "strategic" "economics" "compatible" "apartment" "consulting" "recreation" "participants" "favorites" "translation" "estimates" "protected" "officials" "contained" "legislation" "parameters" "relationships" "representative" "frequency" "introduced" "departments" "residents" "displayed" "performed" "administrator" "addresses" "permanent" "agriculture" "constitutes" "portfolio" "practical" "delivered" "collectibles" "infrastructure" "exclusive" "originally" "utilities" "philosophy" "regulation" "reduction" "nutrition" "recording" "secondary" "wonderful" "announced" "prevention" "mentioned" "automatic" "healthcare" "maintained" "increasing" "connected" "directors" "participation" "combination" "amendment" "guaranteed" "libraries" "distributed" "enterprises" "convention" "principal" "certification" "buildings" "household" "batteries" "positions" "subscription" "contemporary" "panasonic" "permalink" "signature" "provision" "newspaper" "liability" "trademark" "trackback" "americans" "promotion" "conversion" "reasonable" "broadband" "influence" "webmaster" "prescription" "conservation" "javascript" "marketplace" "evolution" "certificates" "objectives" "suggested" "concerned" "structures" "encyclopedia" "continuing" "interracial" "competitive" "suppliers" "preparation" "receiving" "discussed" "reservations" "playstation" "instruction" "annotation" "differences" "establish" "expressed" "mathematics" "compensation" "conducted" "percentage" "requested" "personals" "agricultural" "supporting" "collections" "participate" "specialist" "experienced" "investigation" "institution" "searching" "proceedings" "transmission" "characteristics" "experiences" "extremely" "verzeichnis" "contracts" "developers" "equivalent" "chemistry" "neighborhood" "variables" "continues" "curriculum" "psychology" "responses" "circumstances" "identification" "appliances" "elementary" "unlimited" "printable" "enforcement" "hardcover" "celebrity" "chocolate" "hampshire" "bluetooth" "controlled" "requirement" "authorities" "representatives" "pregnancy" "biography" "attractions" "transactions" "authorized" "retirement" "financing" "efficiency" "efficient" "commitment" "specialty" "interviews" "qualified" "discovery" "classified" "confidence" "lifestyle" "consistent" "clearance" "connections" "inventory" "converter" "organisation" "objective" "securities" "volunteer" "democratic" "parameter" "processor" "dimensions" "contribute" "challenges" "recognition" "submission" "encourage" "regulatory" "inspection" "consumers" "territory" "transaction" "contributions" "continuous" "initiative" "execution" "disability" "increases" "contractor" "examination" "committed" "extensive" "affordable" "candidate" "databases" "outstanding" "perspective" "messenger" "tournament" "consideration" "discounts" "catalogue" "publishers" "caribbean" "reservation" "remaining" "depending" "expansion" "purchased" "performing" "collected" "absolutely" "featuring" "implement" "scheduled" "calculator" "temporary" "sufficient" "awareness" "contribution" "measurement" "constitution" "packaging" "consultation" "northwest" "classroom" "democracy" "wallpaper" "merchandise" "resistance" "candidates" "biological" "transition" "preferences" "classification" "physician" "wikipedia" "spiritual" "photographs" "satisfaction" "represents" "preferred" "intellectual" "comfortable" "interaction" "listening" "effectively" "experimental" "revolution" "consolidation" "landscape" "dependent" "mechanical" "consultants" "applicant" "cooperation" "acquisition" "implemented" "directories" "recognized" "notification" "licensing" "textbooks" "diversity" "investments" "accessibility" "sensitive" "templates" "completion" "universities" "technique" "contractors" "subscriptions" "calculate" "broadcast" "converted" "anniversary" "improvements" "specification" "accessible" "accessory" "typically" "representation" "arrangements" "conferences" "uniprotkb" "consumption" "afternoon" "consultant" "controller" "ownership" "committees" "legislative" "researchers" "unsubscribe" "molecular" "residence" "attorneys" "operators" "sustainable" "statistical" "innovation" "employers" "definitions" "elections" "stainless" "newspapers" "hospitals" "exception" "capabilities" "recommendation" "recruitment" "organized" "improving" "expensive" "organisations" "explained" "programmes" "expertise" "mechanism" "jewellery" "eventually" "agreements" "innovative" "conclusion" "disorders" "collaboration" "detection" "formation" "engineers" "proposals" "moderator" "tutorials" "settlement" "collectables" "fantastic" "governments" "purchasing" "appointed" "operational" "descriptions" "determination" "animation" "productions" "telecommunications" "instructor" "approaches" "highlights" "designers" "scientists" "blackjack" "possibility" "commissioner" "dangerous" "reliability" "volunteers" "attachment" "appointment" "workshops" "hurricane" "represented" "mortgages" "responsibilities" "carefully" "productivity" "investors" "underground" "diagnosis" "principle" "vacations" "calculated" "appearance" "incorporated" "notebooks" "algorithm" "involving" "investing" "admission" "terrorism" "parliament" "situations" "allocated" "corrections" "structural" "municipal" "describes" "disabilities" "prohibited" "addressed" "simulation" "initiatives" "concentration" "interpretation" "bankruptcy" "optimization" "substances" "discovered" "restrictions" "participating" "exhibition" "composition" "nationwide" "existence" "commentary" "limousines" "developments" "immigration" "destinations" "attribute" "surrounding" "mountains" "popularity" "postposted" "coordinator" "fundamental" "substantial" "progressive" "championship" "impossible" "depression" "testimonials" "memorabilia" "cartridge" "explanation" "subsection" "electricity" "permitted" "workplace" "confirmed" "wallpapers" "infection" "eligibility" "involvement" "placement" "observations" "vbulletin" "subsequent" "motorcycle" "disclosure" "establishment" "presentations" "undergraduate" "occupation" "donations" "associations" "citysearch" "radiation" "pollution" "conservative" "guestbook" "effectiveness" "demonstrate" "atmosphere" "purchases" "federation" "assignment" "chemicals" "counseling" "acceptable" "satisfied" "measurements" "medication" "warehouse" "shareware" "violation" "configure" "stability" "southwest" "institutional" "expectations" "metabolism" "personally" "excellence" "attributes" "recognize" "screening" "thumbnail" "forgotten" "intelligent" "edinburgh" "obligation" "restricted" "republican" "merchants" "attendance" "arguments" "amsterdam" "adventures" "announcement" "regularly" "mechanisms" "customize" "tradition" "indicators" "emissions" "physicians" "complaint" "experiments" "scholarship" "governance" "supplements" "camcorder" "implementing" "conversation" "capability" "producing" "precision" "contributed" "reproduction" "ingredients" "franchise" "complaints" "promotions" "rehabilitation" "maintaining" "environments" "reception" "correctly" "consequences" "geography" "appearing" "integrity" "discrimination" "processed" "implications" "functionality" "intermediate" "emotional" "platforms" "overnight" "geographic" "preliminary" "districts" "introduce" "promotional" "chevrolet" "specialists" "generator" "suspension" "correction" "authentication" "communicate" "supplement" "showtimes" "promoting" "machinery" "bandwidth" "probability" "dimension" "schedules" "admissions" "quarterly" "illustrated" "continental" "alternate" "achievement" "limitations" "automated" "passenger" "convenient" "orientation" "childhood" "flexibility" "jurisdiction" "displaying" "encouraged" "cartridges" "declaration" "automation" "advantages" "preparing" "recipient" "extensions" "athletics" "southeast" "alternatives" "determining" "personalized" "conditioning" "partnerships" "destruction" "increasingly" "migration" "basically" "conventional" "applicants" "occupational" "adjustment" "treatments" "camcorders" "difficulty" "collective" "coalition" "enrollment" "producers" "collector" "interfaces" "advertisers" "representing" "observation" "restoration" "convenience" "returning" "opposition" "container" "defendant" "confirmation" "supervisor" "peripherals" "bestsellers" "departure" "interactions" "intervention" "attraction" "modification" "customized" "understood" "assurance" "happening" "amendments" "metropolitan" "compilation" "verification" "attractive" "recordings" "gardening" "obligations" "orchestra" "polyphonic" "outsourcing" "adjustable" "allocation" "discipline" "demonstrated" "identifying" "alphabetical" "dispatched" "installing" "voluntary" "photographer" "messaging" "constructed" "additions" "requiring" "engagement" "refinance" "calendars" "arrangement" "conclusions" "bibliography" "compatibility" "cooperative" "measuring" "headquarters" "transfers" "transformation" "attachments" "administrators" "personality" "facilitate" "subscriber" "priorities" "bookstore" "parenting" "incredible" "commonwealth" "pharmaceutical" "manhattan" "workforce" "organizational" "portuguese" "discharge" "halloween" "hazardous" "methodology" "housewares" "reputation" "resistant" "democrats" "recycling" "qualifications" "slideshow" "variation" "transferred" "photograph" "distributor" "underlying" "wrestling" "photoshop" "gathering" "projection" "mathematical" "specialized" "diagnostic" "corporations" "criticism" "automobile" "confidential" "statutory" "accommodations" "northeast" "downloaded" "paintings" "injection" "yorkshire" "populations" "protective" "initially" "indicator" "eliminate" "sunglasses" "preference" "threshold" "exploration" "sequences" "astronomy" "translate" "announces" "compression" "establishing" "constitutional" "perfectly" "instantly" "litigation" "submissions" "broadcasting" "horizontal" "terrorist" "informational" "ecommerce" "suffering" "prospective" "ultimately" "artificial" "spectacular" "coordination" "connector" "affiliated" "activation" "naturally" "subscribers" "mitsubishi" "underwear" "constraints" "inclusive" "dimensional" "considerable" "selecting" "processors" "pantyhose" "difficulties" "complexity" "constantly" "barcelona" "presidential" "documentary" "territories" "palestinian" "legislature" "hospitality" "procurement" "theoretical" "exercises" "surveillance" "protocols" "highlight" "substitute" "inclusion" "brilliant" "evaluated" "assignments" "termination" "households" "authentic" "architectural" "macintosh" "movements" "amenities" "virtually" "authorization" "projector" "comparative" "psychological" "surprised" "genealogy" "expenditure" "liverpool" "connectivity" "algorithms" "collaborative" "excluding" "commander" "suggestion" "spotlight" "investigate" "connecting" "logistics" "proportion" "significance" "symposium" "essentials" "protecting" "transmitted" "screenshots" "intensive" "switching" "correspondence" "supervision" "expenditures" "separation" "testimony" "celebrities" "mandatory" "boundaries" "syndication" "celebration" "filtering" "offensive" "deployment" "colleagues" "separated" "directive" "governing" "retailers" "occasionally" "attending" "recruiting" "instructional" "traveling" "permissions" "biotechnology" "prescribed" "reproduced" "calculation" "consolidated" "occasions" "equations" "exceptional" "respondents" "considerations" "queensland" "musicians" "composite" "unavailable" "essentially" "designing" "assessments" "brunswick" "sensitivity" "preservation" "streaming" "intensity" "technological" "syndicate" "antivirus" "addressing" "discounted" "constitute" "concluded" "desperate" "demonstration" "governmental" "manufactured" "graduation" "variations" "addiction" "synthesis" "undefined" "unemployment" "enhancement" "newcastle" "performances" "societies" "brazilian" "identical" "petroleum" "norwegian" "retention" "exchanges" "soundtrack" "wondering" "profession" "separately" "physiology" "collecting" "participant" "scholarships" "recreational" "dominican" "friendship" "expanding" "provincial" "investigations" "medications" "advertiser" "encryption" "downloadable" "sophisticated" "possession" "laboratories" "vegetables" "thumbnails" "stockings" "respondent" "destroyed" "manufacture" "wordpress" "vulnerability" "accountability" "celebrate" "accredited" "appliance" "compressed" "scheduling" "perspectives" "mortality" "christians" "therapeutic" "impressive" "architect" "challenging" "microwave" "accidents" "relocation" "contributors" "violations" "temperatures" "competitions" "discretion" "cosmetics" "repository" "concentrations" "christianity" "negotiations" "realistic" "generating" "congressional" "photographic" "modifications" "millennium" "achieving" "fisheries" "exceptions" "reactions" "macromedia" "companion" "divisions" "additionally" "fellowship" "victorian" "copyrights" "mastercard" "chronicles" "obtaining" "distribute" "decorative" "enlargement" "campaigns" "conjunction" "instances" "indigenous" "validation" "corruption" "incentives" "cholesterol" "differential" "scientist" "starsmerchant" "arthritis" "practitioners" "transcript" "inflation" "compounds" "contracting" "structured" "graduates" "recommends" "controlling" "distributors" "particles" "extraordinary" "indicating" "coordinate" "exclusively" "limitation" "widescreen" "illustration" "construct" "inquiries" "inspiration" "downloading" "aggregate" "forecasts" "complicated" "shopzilla" "decorating" "expressions" "shakespeare" "connectors" "conflicts" "travelers" "offerings" "incorrect" "furnishings" "perception" "renaissance" "pathology" "ordinance" "photographers" "infections" "configured" "festivals" "possibilities" "contributing" "analytical" "circulation" "assumption" "jerusalem" "transexuales" "technician" "executives" "enquiries" "cognitive" "exploring" "registrar" "supporters" "withdrawal" "predicted" "saskatchewan" "cancellation" "ministers" "veterinary" "prostores" "relevance" "incentive" "butterfly" "mechanics" "numerical" "reflection" "accompanied" "invitation" "princeton" "spirituality" "proprietary" "childrens" "thumbzilla" "porcelain" "pichunter" "translated" "columnists" "consensus" "delivering" "journalism" "intention" "undertaken" "statewide" "semiconductor" "illustrations" "happiness" "identifier" "calculations" "conducting" "accomplished" "calculators" "impression" "correlation" "fragrance" "neighbors" "transparent" "champions" "selections" "projectors" "inappropriate" "comparing" "vocational" "pharmacies" "introducing" "appreciated" "distinguished" "projected" "assumptions" "shareholders" "developmental" "regulated" "anticipated" "completing" "comparable" "confusion" "copyrighted" "warranties" "documented" "paperbacks" "keyboards" "vulnerable" "reflected" "respiratory" "notifications" "transexual" "mainstream" "evaluating" "subcommittee" "maternity" "journalists" "foundations" "volleyball" "liabilities" "decreased" "tolerance" "creativity" "describing" "lightning" "quotations" "inspector" "bookmarks" "behavioral" "bathrooms" "abilities" "initiated" "nonprofit" "suspended" "containers" "attitudes" "simultaneously" "integrate" "sociology" "screenshot" "exhibitions" "confident" "retrieved" "officially" "consortium" "recipients" "delicious" "traditions" "periodically" "hungarian" "referring" "transform" "educators" "vegetable" "humanities" "independently" "alignment" "britannica" "competitors" "visibility" "consciousness" "encounter" "resolutions" "accessing" "attempted" "witnesses" "administered" "strengthen" "aggressive" "advertisements" "sublimedirectory" "disturbed" "determines" "sculpture" "motivation" "pharmacology" "passengers" "quantities" "petersburg" "consistently" "powerpoint" "obituaries" "punishment" "appreciation" "subsequently" "restriction" "incorporate" "backgrounds" "treasurer" "lightweight" "transcription" "complications" "scripting" "remembered" "synthetic" "testament" "specifics" "partially" "wilderness" "generations" "tournaments" "sponsorship" "headphones" "proceeding" "volkswagen" "uncertainty" "breakdown" "reconstruction" "subsidiary" "strengths" "encouraging" "furnished" "terrorists" "comparisons" "beneficial" "distributions" "viewpicture" "threatened" "republicans" "discusses" "responded" "abstracts" "prediction" "pharmaceuticals" "thesaurus" "individually" "battlefield" "literally" "ecological" "appraisal" "consisting" "submitting" "citations" "geographical" "disclaimers" "championships" "sheffield" "finishing" "wellington" "prospects" "bulgarian" "aboriginal" "remarkable" "preventing" "productive" "boulevard" "compliant" "penalties" "imagination" "refurbished" "activated" "conferencing" "armstrong" "politicians" "trackbacks" "accommodate" "accepting" "precipitation" "isolation" "sustained" "approximate" "programmer" "inherited" "incomplete" "chronicle" "legitimate" "biographies" "investigator" "plaintiff" "prisoners" "mediterranean" "nightlife" "architects" "entrepreneur" "freelance" "excessive" "screensaver" "valuation" "unexpected" "cigarette" "characteristic" "metallica" "appointments" "narrative" "academics" "quantitative" "screensavers" "subdivision" "distinction" "livestock" "exemption" "sustainability" "formatting" "nutritional" "affiliation" "relatives" "satisfactory" "revolutionary" "bracelets" "telephony" "breathing" "thickness" "adjustments" "graphical" "discussing" "aerospace" "meaningful" "maintains" "shortcuts" "voyeurweb" "extending" "specifies" "accreditation" "blackberry" "meditation" "microphone" "combining" "instrumental" "organizing" "moderators" "standings" "partition" "invisible" "translations" "commodity" "kilometers" "thanksgiving" "guarantees" "indication" "congratulations" "cigarettes" "controllers" "consultancy" "conventions" "coordinates" "responding" "physically" "stakeholders" "hydrocodone" "consecutive" "attempting" "representations" "competing" "peninsula" "accurately" "considers" "ministries" "vacancies" "parliamentary" "acknowledge" "nottingham" "identifies" "questionnaire" "qualification" "modelling" "miniature" "interstate" "consequence" "systematic" "perceived" "presenting" "troubleshooting" "centuries" "magnitude" "richardson" "fragrances" "vocabulary" "earthquake" "fundraising" "geological" "assessing" "introduces" "webmasters" "computational" "acdbentity" "participated" "handhelds" "answering" "impressed" "conspiracy" "organizer" "combinations" "preceding" "cumulative" "amplifier" "arbitrary" "prominent" "contacted" "recorders" "occasional" "innovations" "postcards" "reviewing" "explicitly" "transsexual" "citizenship" "informative" "girlfriend" "bloomberg" "hierarchy" "influenced" "abandoned" "complement" "checklist" "requesting" "lauderdale" "scenarios" "extraction" "elevation" "utilization" "beverages" "calibration" "efficiently" "entertaining" "prerequisite" "hypothesis" "medicines" "regression" "enhancements" "renewable" "intersection" "passwords" "consistency" "collectors" "astrology" "occurring" "supplemental" "travelling" "induction" "precisely" "spreading" "provinces" "widespread" "incidence" "incidents" "enhancing" "interference" "palestine" "listprice" "atmospheric" "knowledgestorm" "referenced" "publicity" "proposition" "allowance" "designation" "duplicate" "criterion" "civilization" "vietnamese" "tremendous" "corrected" "encountered" "internationally" "surrounded" "creatures" "commented" "accomplish" "vegetarian" "newfoundland" "investigated" "ambassador" "contacting" "vegetation" "findarticles" "specially" "infectious" "continuity" "phenomenon" "conscious" "referrals" "differently" "integrating" "revisions" "reasoning" "charitable" "annotated" "convinced" "replacing" "researcher" "watershed" "occupations" "acknowledged" "equilibrium" "characterized" "privilege" "qualifying" "estimation" "pediatric" "techrepublic" "institutes" "brochures" "traveller" "appropriations" "suspected" "benchmark" "beginners" "instructors" "highlighted" "stationery" "unauthorized" "competent" "contributor" "demonstrates" "gradually" "desirable" "journalist" "religions" "explosion" "signatures" "disciplines" "daughters" "conversations" "simplified" "motherboard" "bibliographic" "champagne" "deviation" "superintendent" "housewives" "influences" "inspections" "irrigation" "hydraulic" "robertson" "penetration" "conviction" "omissions" "retrieval" "qualities" "prototype" "importantly" "apparatus" "explaining" "nomination" "empirical" "dependence" "sexuality" "polyester" "commitments" "suggesting" "remainder" "privileges" "televisions" "specializing" "commodities" "motorcycles" "concentrate" "reproductive" "molecules" "refrigerator" "intervals" "sentences" "exclusion" "workstation" "holocaust" "receivers" "disposition" "navigator" "investigators" "marijuana" "cathedral" "fascinating" "landscapes" "computation" "cardiovascular" "salvation" "predictions" "accompanying" "selective" "arbitration" "configuring" "editorials" "sacrifice" "removable" "convergence" "gibraltar" "anthropology" "malpractice" "reporters" "necessity" "rendering" "hepatitis" "nationally" "waterproof" "specialties" "humanitarian" "invitations" "functioning" "economies" "bacterial" "undertake" "continuously" "achievements" "convertible" "secretariat" "paragraphs" "adolescent" "nominations" "cancelled" "introductory" "reservoir" "occurrence" "demographic" "disciplinary" "respected" "portraits" "interpreted" "evaluations" "elimination" "hypothetical" "immigrants" "complimentary" "helicopter" "performer" "commissions" "powerseller" "graduated" "surprising" "unnecessary" "dramatically" "yugoslavia" "characterization" "likelihood" "fundamentals" "contamination" "endangered" "compromise" "expiration" "namespace" "peripheral" "negotiation" "opponents" "nominated" "confidentiality" "electoral" "changelog" "alternatively" "controversial" "recovered" "upgrading" "frontpage" "demanding" "defensive" "forbidden" "programmers" "monitored" "installations" "deutschland" "practitioner" "motivated" "smithsonian" "examining" "revelation" "delegation" "dictionaries" "greenhouse" "transparency" "currencies" "survivors" "positioning" "descending" "temporarily" "frequencies" "reflections" "municipality" "detective" "experiencing" "fireplace" "endorsement" "psychiatry" "persistent" "summaries" "looksmart" "magnificent" "colleague" "adaptation" "paintball" "enclosure" "supervisors" "distances" "absorption" "treasures" "transcripts" "disappointed" "continually" "communist" "collectible" "entrepreneurs" "creations" "acquisitions" "biodiversity" "excitement" "presently" "mysterious" "librarian" "subsidiaries" "stockholm" "indonesian" "therapist" "promising" "relaxation" "commissioners" "forwarding" "nightmare" "reductions" "southampton" "organisms" "telescope" "advancement" "harassment" "generators" "generates" "replication" "inexpensive" "receptors" "interventions" "internship" "aluminium" "snowboard" "beastality" "evanescence" "coordinated" "shipments" "antarctica" "chancellor" "controversy" "legendary" "beautifully" "antibodies" "examinations" "immunology" "departmental" "terminology" "gentleman" "reproduce" "convicted" "roommates" "threatening" "spokesman" "activists" "frankfurt" "encourages" "assembled" "restructuring" "terminals" "simulations" "conditional" "crossword" "conceptual" "translator" "automobiles" "longitude" "challenged" "telecharger" "insertion" "instrumentation" "constraint" "groundwater" "strengthening" "insulation" "infringement" "subjective" "varieties" "mediawiki" "configurations" "foreign" "writers" "corpora" "british" "britain" "hathi" "uk" "bloomsbury" "woolf" "soho" "hathitrust" "anglo" "oxford" "museum" "hegglund" "english" "thames" "selvon" "norton" "indian" "finally" "fiction" "asian" "afrikaans" "arabic" "bengali" "bulgarian" "catalan" "cantonese" "croatian" "czech" "danish" "dutch" "lithuanian" "malay" "malayalam" "panjabi" "tamil" "english" "finnish" "french" "german" "greek" "hebrew" "hindi" "hungarian" "indonesian" "italian" "japanese" "javanese" "korean" "norwegian" "polish" "portuguese" "romanian" "russian" "serbian" "slovak" "slovene" "spanish" "swedish" "telugu" "thai" "turkish" "ukrainian" "vietnamese" "welsh" "sign language" "algerian" "aramaic" "armenian" "berber" "burmese" "bosnian" "brazilian" "bulgarian" "cypriot" "corsica" "creole" "scottish" "egyptian" "esperanto" "estonian" "finn" "flemish" "georgian" "hawaiian" "indonesian" "inuit" "irish" "icelandic" "latin" "mandarin" "nepalese" "sanskrit" "tagalog" "tahitian" "tibetan" "gypsy" "wu" "afghan" "albanian" "algerian" "american" "andorran" "angolan" "antiguans" "argentinean" "armenian" "australian" "austrian" "azerbaijani" "bahamian" "bahraini" "bangladeshi" "barbadian" "barbudans" "batswana" "belarusian" "belgian" "belizean" "beninese" "bhutanese" "bolivian" "bosnian" "brazilian" "british" "bruneian" "bulgarian" "burkinabe" "burmese" "burundian" "cambodian" "cameroonian" "canadian" "cape verdean" "central african" "chadian" "chilean" "chinese" "colombian" "comoran" "congolese" "costa rican" "croatian" "cuban" "cypriot" "czech" "danish" "djibouti" "dominican" "dutch" "east timorese" "ecuadorean" "egyptian" "emirian" "equatorial guinean" "eritrean" "estonian" "ethiopian" "fijian" "filipino" "finnish" "french" "gabonese" "gambian" "georgian" "german" "ghanaian" "greek" "grenadian" "guatemalan" "guinea-bissauan" "guinean" "guyanese" "haitian" "herzegovinian" "honduran" "hungarian" "i-kiribati" "icelander" "indian" "indonesian" "iranian" "iraqi" "irish" "israeli" "italian" "ivorian" "jamaican" "japanese" "jordanian" "kazakhstani" "kenyan" "kittian" "nevisian" "kuwaiti" "kyrgyz" "laotian" "latvian" "lebanese" "liberian" "libyan" "liechtensteiner" "lithuanian" "luxembourger" "macedonian" "malagasy" "malawian" "malaysian" "maldivian" "malian" "maltese" "marshallese" "mauritanian" "mauritian" "mexican" "micronesian" "moldovan" "monacan" "mongolian" "moroccan" "mosotho" "motswana" "mozambican" "namibian" "nauruan" "nepalese" "new zealander" "ni-vanuatu" "nicaraguan" "nigerian" "nigerien" "north korean" "northern irish" "norwegian" "omani" "pakistani" "palauan" "panamanian" "papua new guinean" "paraguayan" "peruvian" "polish" "portuguese" "qatari" "romanian" "russian" "rwandan" "saint lucian" "salvadoran" "samoan" "san marinese" "sao tomean" "saudi" "scottish" "senegalese" "serbian" "seychellois" "sierra leonean" "singaporean" "slovakian" "slovenian" "solomon islander" "somali" "south african" "south korean" "spanish" "sri lankan" "sudanese" "surinamer" "swazi" "swedish" "swiss" "syrian" "taiwanese" "tajik" "tanzanian" "thai" "togolese" "tongan" "trinidadian" "tobagonian" "tunisian" "turkish" "tuvaluan" "ugandan" "ukrainian" "uruguayan" "uzbekistani" "venezuelan" "vietnamese" "welsh" "yemenite" "zambian" "zimbabwean" "methods" "risk" "notation" "footnote" "smallcaps" )

### Common Words		
grep -E -o '\b[[:lower:]]+\b' < ./"$baseName"/"$baseName".txt | tr -d [:punct:] | tr [:upper:] [:lower:] | tr -d '\r' | sort | uniq -c | sort -nr > ./"$baseName"/output.txt		
# grep -oP '\b\p{Ll}+\b' < ./"$baseName"/"$baseName".txt | tr -d [:punct:] | tr [:upper:] [:lower:] | tr -d '\r' | sort | uniq -c | sort -nr > ./"$baseName"/output.txt

printf "%s " "${stop_words[@]}" > ./"$baseName"/stop_words.txt

awk 'FNR==NR{for(i=1;i<=NF;i++)w[$i];next}(!($2 in w))' ./"$baseName"/stop_words.txt ./"$baseName"/output.txt > ./"$baseName"/results1.txt		

rm ./"$baseName"/output.txt

sed "s/^[ \t]*//" -i ./"$baseName"/results1.txt

# Print any common words that appear more than 45 times

perl -ae 'print if !(grep { $_ < 45 && /^\d+$/ } @F)' ./"$baseName"/results1.txt > ./"$baseName"/results2.txt

if [ -n "$error" ];
		
then

cp ./"$baseName"/results2.txt ./"$baseName"/"$baseName"_common_words.txt
		
fi

### Proper Nouns
grep -E -o '\b[[:upper:]][[:lower:]]+\b' < ./"$baseName"/"$baseName".txt | tr -d [:punct:] | tr [:upper:] [:lower:] | tr -d '\r' | sort | uniq -c | sort -nr > ./"$baseName"/output.txt
# grep -oP '\b\p{Lu}+\b' < ./"$baseName"/"$baseName".txt | tr -d [:punct:] | tr [:upper:] [:lower:] | tr -d '\r' | sort | uniq -c | sort -nr > ./"$baseName"/output.txt

awk 'FNR==NR{for(i=1;i<=NF;i++)w[$i];next}(!($2 in w))' ./"$baseName"/stop_words.txt ./"$baseName"/output.txt > ./"$baseName"/results3.txt

rm ./"$baseName"/output.txt

sed "s/^[ \t]*//" -i ./"$baseName"/results3.txt

# Print proper nouns that appear more than 10 times

perl -ae 'print if !(grep { $_ < 10 && /^\d+$/ } @F)' ./"$baseName"/results3.txt > ./"$baseName"/results4.txt

cat ./"$baseName"/results4.txt >> ./"$baseName"/results2.txt

if [ -n "$error" ];
		
then

cp ./"$baseName"/results4.txt ./"$baseName"/"$baseName"_proper_nouns.txt
		
fi

if [ -n "$error" ];
		
then

cp ./"$baseName"/results2.txt ./"$baseName"/"$baseName"_common_and_proper_nouns.txt
		
fi

# Remove word count from list of proper nouns and common words

sed -i 's/^[0-9]\+ //' ./"$baseName"/results2.txt

# Replace duplicate in proper nouns and common words lists

gawk -i inplace '!a[$0]++' ./"$baseName"/results2.txt

### 

if [[ -s ./"$baseName"/results2.txt ]]; then echo -e "These words appear frequently in \033[1;35m"$baseName".docx\033[0m:\n"; cat ./"$baseName"/results2.txt ;

read -n1 -p "`echo $'\n> '`Would you like to check the pronunciation of these words? [Y/N]?" answer

case $answer in
Y | y) 
       echo -e "\n"
	   pronunciation=yes
	   ;;
	   
N | n) 
		echo -e "\n"
		pronunciation=no
		;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n].\033[0m\n"
       ;;
 
esac

else echo -e "No words with potential mispronunciations were detected in \033[1;35m"$baseName".docx\033[0m.\n"; 

fi

if [[ "$pronunciation" == "yes" ]]; then		
		
# Create separate TXT files for each line

awk '{filename = sprintf("frequent_word%d.txt", NR); print >filename; close(filename)}' ./"$baseName"/results2.txt

if [ -f ./frequent_word1.txt ]; then

mv ./frequent_word*.txt ./"$baseName"/

fi

count=1
for x in ./"$baseName"/frequent_word*.txt; do

        basePath=${x%.*}
        Name=${basePath##*/}
		
 printf "\rProcessing frequent words in \033[1;35m$baseName.docx\033[0m... \033[1;33m'$count'\033[0m"

 sleep 1
 "C:\Program Files (x86)\Linguatec\VoiceReaderStudio15\vrs15cmd.exe" input="$x" voice=$name lang=enu speed=100 format=mp3 codepage=65001 coding=11 volume=75 output=./"$baseName"/"$Name".mp3 &>/dev/null
count=$[ $count + 1 ] ; 
done
printf "\rProcessing frequent words in \033[1;35m$baseName.docx\033[0m... \033[1;32mDone.\033[0m"


echo -e "\n"

IFS=$IFS_OLD

file="./"$baseName"/results2.txt"

count=1
IFS=$'\n' 
for word in $(cat $file); do

mpv "./"$baseName"/frequent_word$count.mp3" >/dev/null  2>&1

getfrequency() {

read -n1 -p "Was the pronunciation of $(echo -e "\033[1;44m$word\033[0m ")correct? [Y/N]? Replay it [R]?" answer

case $answer in
Y | y) 
       echo -e "\n"
	   echo -e "Speech markup for \033[1;44m$word\033[0m retained.\n"
	   sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' ./"$baseName"/frequent_word$count.txt
	   read frequent_word < ./"$baseName"/frequent_word$count.txt
	   frequent_word=(${frequent_word[@]})
	   sed -i --expression "s#$word#$frequent_word#g" ./"$baseName"/"$baseName".txt
	   upper_case_word=$( echo "${word^}" )
	   sed -i --expression "s#$upper_case_word#$frequent_word#g" ./"$baseName"/"$baseName".txt
	   return 0
	   ;;
	   
N | n) 
		echo -e "\n"
		read -p "Enter correct markup for $(echo -e "\033[1;44m$word\033[0m"): "
		echo "<TOI=LHP:\""$word"\"\/>$REPLY<TOI=ORTH\/>" > "./"$baseName"/frequent_word$count.txt"
		echo -e "\nSpeech markup for \033[1;44m$word\033[0m changed.\n"
		"C:\Program Files (x86)\Linguatec\VoiceReaderStudio15\vrs15cmd.exe" input=./"$baseName"/frequent_word$count.txt voice=$name lang=enu speed=100 format=mp3 codepage=65001 coding=11 volume=75 output=./"$baseName"/frequent_word$count.mp3 &>/dev/null
		mpv "./"$baseName"/frequent_word$count.mp3" >/dev/null  2>&1
		return 1
		;;
R | r) 
		echo -e "\n"
		mpv "./"$baseName"/frequent_word$count.mp3" >/dev/null 2>&1
		return 1
		;;
		
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n /r].\033[0m\n"
	   return 1
       ;;

	   
esac

}
until getfrequency; do : ; done
count=$[ $count + 1 ] ; 

done

IFS=$IFS_OLD

rm ./"$baseName"/frequent_word*.mp3

rm ./"$baseName"/frequent_word*.txt

fi
		
fi

if [ -f ./"$baseName"/results4.txt ]; then

rm ./"$baseName"/results4.txt

fi

if [ -f ./"$baseName"/results1.txt ]; then

rm ./"$baseName"/results1.txt

fi

if [ -f ./"$baseName"/results3.txt ]; then

rm ./"$baseName"/results3.txt

fi

if [ -f ./"$baseName"/results2.txt ]; then

rm ./"$baseName"/results2.txt

fi

if [ -f ./"$baseName"/stop_words.txt ]; then

rm ./"$baseName"/stop_words.txt

fi

fi

# Convert file to MP3

	echo -ne "Converting \033[1;35m"$baseName".docx\033[0m to MP3...\r"

	if [[ "$split" == "on" ]]; then 
	
	perl -0777 -pi -e 's/<page>/<page>\n/g' ./"$baseName"/"$baseName".txt
	
	# awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%6==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	###
	
	if [[ "$textbook" == "long" ]]; then
	
	if [[ "$speed" -ge 50 && "$speed" -le 69 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%2==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 70 && "$speed" -le 89 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%4==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 90 && "$speed" -le 109 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%6==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 110 && "$speed" -le 129 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%7==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 130 && "$speed" -le 159 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%8==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 160 && "$speed" -le 200 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%9==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi

	fi

	if [[ "$textbook" == "short" ]]; then
	
		
	if [[ "$speed" -ge 50 && "$speed" -le 69 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%3==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 70 && "$speed" -le 89 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%5==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 90 && "$speed" -le 109 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%7==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 110 && "$speed" -le 129 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%8==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 130 && "$speed" -le 159 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%9==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 160 && "$speed" -le 200 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%10==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi

	fi

	if [[ "$novel" == "on" ]]; then

	if [[ "$speed" -ge 50 && "$speed" -le 69 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%5==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 70 && "$speed" -le 89 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%7==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 90 && "$speed" -le 109 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%11==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 110 && "$speed" -le 129 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%13==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 130 && "$speed" -le 159 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%15==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 160 && "$speed" -le 200 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%17==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi

	fi
	
	###
	
	perl -0777 -pi -e 's/<split>\n/\n<split>\n<page>/g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<page>\n/<page>/g' ./"$baseName"/"$baseName".txt
	
	# Append a marker at the top of the TXT file
	sed -i '1s/^/\n<split>\n/' ./"$baseName"/"$baseName".txt
	
	csplit -k -s -n 2 -b '%d.txt' -f ./"$baseName"/"$baseName" <(echo "ENDMDL dummy, delete this file"; cat ./"$baseName"/"$baseName".txt) '/^<split>/+1' '{*}' && rm ./"$baseName"/"$baseName"0.txt
	
	perl -0777 -pi -e 's/<split>\n//g' ./"$baseName"/"$baseName"[1-9]*.txt
	
	if [ -f .headings.txt ]; then
	
	rm ./headings.txt
	
	fi
	
	count=1
	for x in ./"$baseName"/"$baseName"[1-9]*.txt; do

        basePath=${x%.*}
        Name=${basePath##*/}
		
	sleep 1

	grep -e 'heading' ./"$baseName"/"$baseName"$count.txt > ./"$baseName"/headings$count.txt

	sed -i 's/<heading[1-5]>/@@ /g' ./"$baseName"/headings$count.txt

	sed -i 's/<\/heading[1-5]>//g' ./"$baseName"/headings$count.txt

	perl -pi -e 's/\^\d+\^//g' ./"$baseName"/headings$count.txt
	perl -pi -e 's/(\[\^)(\d+)(\])(:)/$2$4/g' ./"$baseName"/headings$count.txt
	perl -pi -e 's/(\[\^)(\d+)(\])//g' ./"$baseName"/headings$count.txt
	sed -i -E 's|\^([^\^]?*)\^||g' ./"$baseName"/headings$count.txt
	
	# New
 
	sed -i ':a;$!{N;/\n@@/!{s/\n/ /;ba}};P;D' ./"$baseName"/headings$count.txt
	
	#
 
	count=$[ $count + 1 ] ; 
	done
	
	fi	
		#
	if [[ "$name" == @(Ava|Tom|Allison|Samantha|Susan) ]]; then
		
	if [[ "$split" == "on" ]]; then 
	
	count=1
	for x in ./"$baseName"/"$baseName"[1-9]*.txt; do

        basePath=${x%.*}
        Name=${basePath##*/}
		
	sleep 1
	
	# # Add pause before and after parentheses or brackets:
	
	sed -i "s/\((\)\([^)]*\)\()\)/<Pitch=END_100\/><Pause=500\/><Pitch=75\/>\1\2\3<Pitch=END_75\/><Pause=500\/><Pitch=100\/>/g"  ./"$baseName"/"$baseName"$count.txt
	
	sed -i "s/\(\[\)\([^]]*\)\(\]\)/<Pitch=END_100\/><Pause=500\/><Pitch=75\/>\1\2\3<Pitch=END_75\/><Pause=500\/><Pitch=100\/>/g" ./"$baseName"/"$baseName"$count.txt
	
	# Add pitch change for headings
	
	perl -pi -e 's/(<heading1>)(.*)(<\/heading1>)/$2<Pause=600\/>/g' ./"$baseName"/"$baseName"$count.txt
	
	perl -pi -e 's/(<heading2>)(.*)(<\/heading2>)/<Pause=600\/><Pitch=120\/>$2<Pitch=END_120\/><Pause=600\/>/g' ./"$baseName"/"$baseName"$count.txt
	
	perl -pi -e 's/(<heading3>)(.*)(<\/heading3>)/<Pause=600\/><Pitch=120\/>$2<Pitch=END_120\/><Pause=600\/>/g' ./"$baseName"/"$baseName"$count.txt
		
	perl -pi -e 's/(<heading4>)(.*)(<\/heading4>)/<Pause=600\/><Pitch=120\/>$2<Pitch=END_120\/><Pause=600\/>/g' ./"$baseName"/"$baseName"$count.txt
			
	perl -pi -e 's/(<heading5>)(.*)(<\/heading5>)/<Pause=600\/><Pitch=120\/>$2<Pitch=END_120\/><Pause=600\/>/g' ./"$baseName"/"$baseName"$count.txt
	
	# Check for broken headings (when there is a period in the middle of the line)
	
	perl -0777 -pi -e 's/<heading2>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<\/heading2>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<heading3>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<\/heading3>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<heading4>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<\/heading4>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<heading5>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<\/heading5>//g' ./"$baseName"/"$baseName"$count.txt
	
	# Add pitch change for secondary text areas
	
	sed -i 's/\(<secondary>\)\(.*\)/<Pause=600\/><Pitch=75\/>\2<Pitch=END_75\/><Pause=600\/>/g' ./"$baseName"/"$baseName"$count.txt
	
	sed -i 's/<\/secondary>//g' ./"$baseName"/"$baseName"$count.txt
	
		# Add pitch change for table captions
	
	sed -i 's/\(<table>\)\(.*\)/<Pause=600\/><Pitch=75\/>\2<Pitch=END_75\/><Pause=600\/>/g' ./"$baseName"/"$baseName"$count.txt
	
	sed -i 's/<\/table>//g' ./"$baseName"/"$baseName"$count.txt
	
		# Add pitch change for footnote text areas
	
	sed -i 's/\(<footnote>\)\(.*\)/<Pause=600\/><Pitch=75\/>\2<Pitch=END_75\/><Pause=600\/>/g' ./"$baseName"/"$baseName"$count.txt
	
    sed -i 's/<\/footnote>//g' ./"$baseName"/"$baseName"$count.txt
	
		# Add pitch change for figure caption areas
	
	sed -i 's/\(<figcaption>\)\(.*\)/<Pause=600\/><Pitch=75\/>\2<Pitch=END_75\/><Pause=600\/>/g' ./"$baseName"/"$baseName"$count.txt
	
    sed -i 's/<\/figcaption>//g' ./"$baseName"/"$baseName"$count.txt
	
	# Add pitch change for extended description areas
	
	sed -i 's/\(<description>\)\(.*\)/<Pause=600\/><Pitch=75\/>\2<Pitch=END_75\/><Pause=600\/>/g' ./"$baseName"/"$baseName"$count.txt
	
    sed -i 's/<\/description>//g' ./"$baseName"/"$baseName"$count.txt
	
	# Add pauses and pitch changes for footnote references (if they are retained)
	
	sed -i 's/<footnote_ref>/<Pause=600\/><Pitch=75\/>/g' ./"$baseName"/"$baseName"$count.txt
	
	sed -i 's/<\/footnote_ref>/<Pitch=END_75\/><Pause=600\/>/g' ./"$baseName"/"$baseName"$count.txt
	
	## Add pitch change for line numbers
	
	sed -i 's/<line>/<Pause=600\/><Pitch=70\/>/g' ./"$baseName"/"$baseName"$count.txt
	
	sed -i 's/<\/line>/<Pitch=END_70\/><Pitch=100\/>/g' ./"$baseName"/"$baseName"$count.txt
	
	# Add pitch change for page numbers
	
	perl -pi -e 's/(<page>)(.*)(<\/page>)/<Pause=600\/><Pitch=120\/>$2<Pitch=END_120\/>/g' ./"$baseName"/"$baseName"$count.txt
	
	# Fix double quote on its own line
	
	perl -0777 -pi  -e 's/\n\"\n/"\n/g' ./"$baseName"/"$baseName"$count.txt
	
	# Correct common mispronunciations
	
	sed -i "s/a priori/<TOI=LHP:\"a priori\"\/>e\&I  p\{R\+i\'OR\+a\&I<TOI=ORTH\/>/g" ./"$baseName"/"$baseName"$count.txt
	
	# Add extra pause after each line in poetry texts
	
	if [ -n "$remove" ]; then

	perl -pi -e 's/\n/<Pause=800\/>\n/g' ./"$baseName"/"$baseName"$count.txt
	
	fi
  	
		# Create MP3 using Linguatec
		
		if [ -n "$error" ]; then
		
		cp ./"$baseName"/"$baseName"$count.txt ./"$baseName"/"$baseName"$count_pre.txt
		
		fi
	
	
	count=$[ $count + 1 ] ; 
	done
		
	
	else
		
	# # Add pause before and after parentheses or brackets:
	
	sed -i "s/\((\)\([^)]*\)\()\)/<Pitch=END_100\/><Pause=500\/><Pitch=75\/>\1\2\3<Pitch=END_75\/><Pause=500\/><Pitch=100\/>/g"  ./"$baseName"/"$baseName".txt
	
	sed -i "s/\(\[\)\([^]]*\)\(\]\)/<Pitch=END_100\/><Pause=500\/><Pitch=75\/>\1\2\3<Pitch=END_75\/><Pause=500\/><Pitch=100\/>/g" ./"$baseName"/"$baseName".txt
	
	# Add pitch change for headings
	
	perl -pi -e 's/(<heading1>)(.*)(<\/heading1>)/$2<Pause=600\/>/g' ./"$baseName"/"$baseName".txt
	
	perl -pi -e 's/(<heading2>)(.*)(<\/heading2>)/<Pause=600\/><Pitch=120\/>$2<Pitch=END_120\/><Pause=600\/>/g' ./"$baseName"/"$baseName".txt
	
	perl -pi -e 's/(<heading3>)(.*)(<\/heading3>)/<Pause=600\/><Pitch=120\/>$2<Pitch=END_120\/><Pause=600\/>/g' ./"$baseName"/"$baseName".txt
		
	perl -pi -e 's/(<heading4>)(.*)(<\/heading4>)/<Pause=600\/><Pitch=120\/>$2<Pitch=END_120\/><Pause=600\/>/g' ./"$baseName"/"$baseName".txt
			
	perl -pi -e 's/(<heading5>)(.*)(<\/heading5>)/<Pause=600\/><Pitch=120\/>$2<Pitch=END_120\/><Pause=600\/>/g' ./"$baseName"/"$baseName".txt
	
		# Check for broken headings (when there is a period in the middle of the line)
	
	perl -0777 -pi -e 's/<heading2>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<\/heading2>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<heading3>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<\/heading3>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<heading4>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<\/heading4>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<heading5>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<\/heading5>//g' ./"$baseName"/"$baseName".txt
	
	# Add pitch change for secondary text areas
	
	sed -i 's/\(<secondary>\)\(.*\)/<Pause=600\/><Pitch=75\/>\2<Pitch=END_75\/><Pause=600\/>/g' ./"$baseName"/"$baseName".txt
	
	sed -i 's/<\/secondary>//g' ./"$baseName"/"$baseName".txt
	
		# Add pitch change for table captions
	
	sed -i 's/\(<table>\)\(.*\)/<Pause=600\/><Pitch=75\/>\2<Pitch=END_75\/><Pause=600\/>/g' ./"$baseName"/"$baseName".txt
	
	sed -i 's/<\/table>//g' ./"$baseName"/"$baseName".txt
	
		# Add pitch change for footnote text areas
	
	sed -i 's/\(<footnote>\)\(.*\)/<Pause=600\/><Pitch=75\/>\2<Pitch=END_75\/><Pause=600\/>/g' ./"$baseName"/"$baseName".txt
	
    sed -i 's/<\/footnote>//g' ./"$baseName"/"$baseName".txt
	
		# Add pitch change for figure caption areas
	
	sed -i 's/\(<figcaption>\)\(.*\)/<Pause=600\/><Pitch=75\/>\2<Pitch=END_75\/><Pause=600\/>/g' ./"$baseName"/"$baseName".txt
	
    sed -i 's/<\/figcaption>//g' ./"$baseName"/"$baseName".txt
	
			# Add pitch change for extended description areas
	
	sed -i 's/\(<description>\)\(.*\)/<Pause=600\/><Pitch=75\/>\2<Pitch=END_75\/><Pause=600\/>/g' ./"$baseName"/"$baseName".txt
	
    sed -i 's/<\/description>//g' ./"$baseName"/"$baseName".txt
	
	# Add pauses and pitch changes for footnote references (if they are retained)
	
	sed -i 's/<footnote_ref>/<Pause=600\/><Pitch=75\/>/g' ./"$baseName"/"$baseName".txt
	
	sed -i 's/<\/footnote_ref>/<Pitch=END_75\/><Pause=600\/>/g' ./"$baseName"/"$baseName".txt
	
	## Add pitch change for line numbers
	
	sed -i 's/<line>/<Pause=600\/><Pitch=70\/>/g' ./"$baseName"/"$baseName".txt
	
	sed -i 's/<\/line>/<Pitch=END_70\/><Pitch=100\/>/g' ./"$baseName"/"$baseName".txt
	
	# Add pitch change for page numbers
	
	perl -pi -e 's/(<page>)(.*)(<\/page>)/<Pause=600\/><Pitch=120\/>$2<Pitch=END_120\/>/g' ./"$baseName"/"$baseName".txt
	
	# Fix double quote on its own line
	
	perl -0777 -pi  -e 's/\n\"\n/"\n/g' ./"$baseName"/"$baseName".txt
	
	# Correct common mispronunciations
	
	sed -i "s/a priori/<TOI=LHP:\"a priori\"\/>e\&I  p\{R\+i\'OR\+a\&I<TOI=ORTH\/>/g" ./"$baseName"/"$baseName".txt
	
	# Add extra pause after each line in poetry texts
	
	if [ -n "$remove" ]; then

	perl -pi -e 's/\n/<Pause=800\/>\n/g' ./"$baseName"/"$baseName".txt
	
	fi
  	
		# Create MP3 using Linguatec
		
if [ -n "$error" ]; then
		
		cp ./"$baseName"/"$baseName".txt ./"$baseName"/"$baseName"_pre.txt
		
		fi
	
	fi	

	
	if [[ "$split" == "on" ]]; then 

	count=1
	for x in ./"$baseName"/"$baseName"[1-9]*.txt; do

        basePath=${x%.*}
        Name=${basePath##*/}
		
	sleep 1
	
	mv ./"$baseName"/"$baseName"$count.txt ./"$baseName"/"$baseName"_$count.txt 
	
	echo -ne "Converting \033[1;35m"$baseName".docx\033[0m to MP3... \033[1;33mTrack $count\033[0m\r"
	
	"C:\Program Files (x86)\Linguatec\VoiceReaderStudio15\vrs15cmd.exe" input=./"$baseName"/"$baseName"_$count.txt voice=$name lang=enu speed=$speed format=mp3 codepage=65001 coding=11 volume=75 output=./"$baseName"/"$baseName"_$count.mp3 &>/dev/null
 
	count=$[ $count + 1 ] ; 
	done
	
	else
		
        "C:\Program Files (x86)\Linguatec\VoiceReaderStudio15\vrs15cmd.exe" input=./"$baseName"/"$baseName".txt voice=$name lang=enu speed=$speed format=mp3 codepage=65001 coding=11 volume=75 output=./"$baseName"/"$baseName".mp3 &>/dev/null
				
		fi
		
		fi
		
		if [[ "$name" == @(Microsoft Elsa Desktop|Microsoft Hortense Desktop|Microsoft Hedda Desktop|Microsoft Helena Desktop|Microsoft Haruka Desktop|Microsoft Mark|Microsoft Hazel Desktop|Microsoft Huihui Desktop|Microsoft Irina Desktop|Microsoft Maria Desktop|Microsoft Paulina Desktop|Microsoft Sabina Desktop|Microsoft Tracy Desktop|Microsoft Naayf|Microsoft Hoda|Microsoft Ivan|Microsoft Herena|Microsoft Jakub|Microsoft Helle|Microsoft Michael|Microsoft Karsten|Microsoft Stefanos|Microsoft James|Microsoft Linda|Microsoft Ravi|Microsoft Sean|Microsoft Heidi|Microsoft Claude|Microsoft Guillaume|Microsoft Asaf|Microsoft Hemant|Microsoft Matej|Microsoft Andika|Microsoft Szabolcs|Microsoft Heami|Microsoft Rizwan|Microsoft Frank|Microsoft Bart|Microsoft Jon|Microsoft Helia|Microsoft Andrei||Microsoft Lado|Microsoft Bengt|Microsoft Valluvar|Microsoft Pattara|Microsoft Tolga|Microsoft An|Microsoft Zhiwei|IVONA \2 Joey) ]]; then
		
		if [[ "$split" == "on" ]]; then 
	
	count=1
	for x in ./"$baseName"/"$baseName"[1-9]*.txt; do

        basePath=${x%.*}
        Name=${basePath##*/}
		
	sleep 1
	
		# Add pause before and after parentheses or brackets (SAPI5 voices):
	
	sed -i "s/\((\)\([^)]*\)\()\)/<silence msec='800'\/><pitch absmiddle='-5'>\1\2\3<\/pitch><silence msec='800'\/>/g"  ./"$baseName"/"$baseName"$count.txt
	
	sed -i "s/\(\[\)\([^]]*\)\(\]\)/<silence msec='800'\/><pitch absmiddle='-5'>\1\2\3<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
	## Add pitch change for line numbers
	
	sed -i "s/<line>/<silence msec='800'\/><pitch absmiddle='-5'>/g" ./"$baseName"/"$baseName"$count.txt
	
	sed -i "s/<\/line>/<\/pitch>/g" ./"$baseName"/"$baseName"$count.txt
	
		# Add pitch change for headings
		
	perl -pi -e "s/<heading1>//g" ./"$baseName"/"$baseName"$count.txt
	
	perl -pi -e "s/<\/heading1>/<silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
	perl -pi -e "s/<heading2>/<silence msec='800'\/><pitch absmiddle='7'>/g" ./"$baseName"/"$baseName"$count.txt
	
	perl -pi -e "s/<\/heading2>/<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
		perl -pi -e "s/<heading3>/<silence msec='800'\/><pitch absmiddle='7'>/g" ./"$baseName"/"$baseName"$count.txt
	
	perl -pi -e "s/<\/heading3>/<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
		perl -pi -e "s/<heading4>/<silence msec='800'\/><pitch absmiddle='7'>/g" ./"$baseName"/"$baseName"$count.txt
	
	perl -pi -e "s/<\/heading4>/<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
		perl -pi -e "s/<heading5>/<silence msec='800'\/><pitch absmiddle='7'>/g" ./"$baseName"/"$baseName"$count.txt
	
	perl -pi -e "s/<\/heading5>/<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
		# Check for broken headings (when there is a period in the middle of the line)
	
	perl -0777 -pi -e 's/<heading2>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<\/heading2>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<heading3>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<\/heading3>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<heading4>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<\/heading4>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<heading5>//g' ./"$baseName"/"$baseName"$count.txt
	
	perl -0777 -pi -e 's/<\/heading5>//g' ./"$baseName"/"$baseName"$count.txt
	
		# Add pitch change for secondary text areas
	
	sed -i "s/\(<secondary>\)\(.*\)/<silence msec='800'\/><pitch absmiddle='-5'>\2<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
	sed -i 's/<\/secondary>//g' ./"$baseName"/"$baseName"$count.txt
	
			# Add pitch change for table captions
	
	sed -i "s/\(<table>\)\(.*\)/<silence msec='800'\/><pitch absmiddle='-5'>\2<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
	sed -i 's/<\/table>//g' ./"$baseName"/"$baseName"$count.txt
	
		# Add pitch change for footnote text areas
	
	sed -i "s/\(<footnote>\)\(.*\)/<silence msec='800'\/><pitch absmiddle='-5'>\2<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
	sed -i 's/<\/footnote>//g' ./"$baseName"/"$baseName"$count.txt
	
		# Add pitch change for figure captions
	
	sed -i "s/\(<figcaption>\)\(.*\)/<silence msec='800'\/><pitch absmiddle='-5'>\2<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
	sed -i 's/<\/figcaption>//g' ./"$baseName"/"$baseName"$count.txt
	
		# Add pitch change for extended descriptions
	
	sed -i "s/\(<description>\)\(.*\)/<silence msec='800'\/><pitch absmiddle='-5'>\2<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
	sed -i 's/<\/description>//g' ./"$baseName"/"$baseName"$count.txt
	
	# Add pauses for footnote references (if they are retained)
	
	sed -i "s/<footnote_ref>/<silence msec='800'\/><pitch absmiddle='-5'>/g" ./"$baseName"/"$baseName"$count.txt
	
	sed -i "s/<\/footnote_ref>/<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
	# Add pitch change for page numbers
		
	perl -pi -e "s/<page>/<silence msec='800'\/><pitch absmiddle='7'>/g" ./"$baseName"/"$baseName"$count.txt
	
	perl -pi -e "s/<\/page>/<\/pitch>/g" ./"$baseName"/"$baseName"$count.txt
	
	# Fix double quote on its own line
	
	perl -0777 -pi  -e 's/\n\"\n/"\n/g' ./"$baseName"/"$baseName"$count.txt
	
	# Add extra pause after each line in poetry texts
	
	if [ -n "$remove" ]; then

	perl -pi -e "s/\n/<silence msec='1000'\/>\n/g" ./"$baseName"/"$baseName"$count.txt

	fi
	
		count=$[ $count + 1 ] ; 
	done
	
	else
		
	# Add pause before and after parentheses or brackets (SAPI5 voices):
	
	sed -i "s/\((\)\([^)]*\)\()\)/<silence msec='800'\/><pitch absmiddle='-5'>\1\2\3<\/pitch><silence msec='800'\/>/g"  ./"$baseName"/"$baseName".txt
	
	sed -i "s/\(\[\)\([^]]*\)\(\]\)/<silence msec='800'\/><pitch absmiddle='-5'>\1\2\3<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
	## Add pitch change for line numbers
	
	sed -i "s/<line>/<silence msec='800'\/><pitch absmiddle='-5'>/g" ./"$baseName"/"$baseName".txt
	
	sed -i "s/<\/line>/<\/pitch>/g" ./"$baseName"/"$baseName".txt
	
		# Add pitch change for headings
		
	perl -pi -e "s/<heading1>//g" ./"$baseName"/"$baseName".txt
	
	perl -pi -e "s/<\/heading1>/<silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
	perl -pi -e "s/<heading2>/<silence msec='800'\/><pitch absmiddle='7'>/g" ./"$baseName"/"$baseName".txt
	
	perl -pi -e "s/<\/heading2>/<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
		perl -pi -e "s/<heading3>/<silence msec='800'\/><pitch absmiddle='7'>/g" ./"$baseName"/"$baseName".txt
	
	perl -pi -e "s/<\/heading3>/<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
		perl -pi -e "s/<heading4>/<silence msec='800'\/><pitch absmiddle='7'>/g" ./"$baseName"/"$baseName".txt
	
	perl -pi -e "s/<\/heading4>/<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
		perl -pi -e "s/<heading5>/<silence msec='800'\/><pitch absmiddle='7'>/g" ./"$baseName"/"$baseName".txt
	
	perl -pi -e "s/<\/heading5>/<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
			# Check for broken headings (when there is a period in the middle of the line)
	
	perl -0777 -pi -e 's/<heading2>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<\/heading2>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<heading3>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<\/heading3>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<heading4>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<\/heading4>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<heading5>//g' ./"$baseName"/"$baseName".txt
	
	perl -0777 -pi -e 's/<\/heading5>//g' ./"$baseName"/"$baseName".txt
	
		# Add pitch change for secondary text areas
	
	sed -i "s/\(<secondary>\)\(.*\)/<silence msec='800'\/><pitch absmiddle='-5'>\2<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
	sed -i 's/<\/secondary>//g' ./"$baseName"/"$baseName".txt
	
			# Add pitch change for table captions
	
	sed -i "s/\(<table>\)\(.*\)/<silence msec='800'\/><pitch absmiddle='-5'>\2<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
	sed -i 's/<\/table>//g' ./"$baseName"/"$baseName".txt
	
		# Add pitch change for footnote text areas
	
	sed -i "s/\(<footnote>\)\(.*\)/<silence msec='800'\/><pitch absmiddle='-5'>\2<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
	sed -i 's/<\/footnote>//g' ./"$baseName"/"$baseName".txt
	
		# Add pitch change for figure captions
	
	sed -i "s/\(<figcaption>\)\(.*\)/<silence msec='800'\/><pitch absmiddle='-5'>\2<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
	sed -i 's/<\/figcaption>//g' ./"$baseName"/"$baseName".txt
	
		# Add pitch change for extended descriptions
	
	sed -i "s/\(<description>\)\(.*\)/<silence msec='800'\/><pitch absmiddle='-5'>\2<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
	sed -i 's/<\/description>//g' ./"$baseName"/"$baseName".txt
	
	# Add pauses for footnote references (if they are retained)
	
	sed -i "s/<footnote_ref>/<silence msec='800'\/><pitch absmiddle='-5'>/g" ./"$baseName"/"$baseName".txt
	
	sed -i "s/<\/footnote_ref>/<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
		# Add pitch change for page numbers
		
	perl -pi -e "s/<page>/<silence msec='800'\/><pitch absmiddle='7'>/g" ./"$baseName"/"$baseName".txt
	
	perl -pi -e "s/<\/page>/<\/pitch>/g" ./"$baseName"/"$baseName".txt
	
	# Fix double quote on its own line
	
	perl -0777 -pi  -e 's/\n\"\n/"\n/g' ./"$baseName"/"$baseName".txt
	
	# Add extra pause after each line in poetry texts
	
	if [ -n "$remove" ]; then

	perl -pi -e "s/\n/<silence msec='1000'\/>\n/g" ./"$baseName"/"$baseName".txt

	fi
		
	fi
		
	if [[ "$split" == "on" ]]; then 

	count=1
	for x in ./"$baseName"/"$baseName"[1-9]*.txt; do

        basePath=${x%.*}
        Name=${basePath##*/}
		
	echo -ne "Converting \033[1;35m"$baseName".docx\033[0m to MP3... \033[1;33mTrack $count\033[0m\r"
		
	sleep 1
	# Added a patch to suppress segmentation fault error...must investigate for more serious problem
	# Need to add variable to adjust the speed in line with 50-200 speed
	
		mv ./"$baseName"/"$baseName"$count.txt ./"$baseName"/"$baseName"_$count.txt 
	
		"C:\balcon\balcon.exe" -f ./"$baseName"/"$baseName"_$count.txt -n "$name" -s "$bspeed" -v 90 -fr 22 -bt 16 -ch 1 -w ./"$baseName"/"$baseName"_$count.wav 2>/dev/null |:
		
		lame -V 5 ./"$baseName"/"$baseName"_$count.wav ./"$baseName"/"$baseName"_$count.mp3  &>/dev/null
		
		rm ./"$baseName"/"$baseName"_$count.wav &>/dev/null
 
	count=$[ $count + 1 ] ; 
	done
	
	else
		
		"C:\balcon\balcon.exe" -f ./"$baseName"/"$baseName".txt -n "$name" -s "$bspeed" -v 90 -fr 22 -bt 16 -ch 1 -w ./"$baseName"/"$baseName".wav &>/dev/null 2>/dev/null |:
		
		lame -V 5 ./"$baseName"/"$baseName".wav ./"$baseName"/"$baseName".mp3 &>/dev/null
		
		rm ./"$baseName"/"$baseName".wav
		
		fi
		
		fi
	  
		echo -ne "Converting \033[1;35m"$baseName".docx\033[0m to MP3... \033[1;32mDone.\033[0m      \r"
		
		echo -ne '\n'
		
		echo -ne "\nAdding cover image and id3 tags...\r"
		
		if [[ "$split" == "on" ]]; then 
		
		count=1
		for x in ./"$baseName"/*.mp3; do

        basePath=${x%.*}
        Name=${basePath##*/}
		
		sleep 1
		
		echo -ne "Adding cover image and id3 tags...   \033[1;33mTrack $count\033[0m\r"
		
		lame --ti "C:\MP3 Cover\UC_Berkeley_Seal.jpg" ./"$baseName"/"$baseName"_$count.mp3 &>/dev/null
		
		rm ./"$baseName"/"$baseName"_$count.mp3
		
		mv ./"$baseName"/"$baseName"_$count.mp3.mp3 ./"$baseName"/"$baseName"_$count.mp3
 
		count=$[ $count + 1 ] ; 
		done
		
		else
		
		lame --ti "C:\MP3 Cover\UC_Berkeley_Seal.jpg" ./"$baseName"/"$baseName".mp3 &>/dev/null

		rm ./"$baseName"/"$baseName".mp3
	
		mv ./"$baseName"/"$baseName".mp3.mp3 ./"$baseName"/"$baseName".mp3
		
		fi
	
	if [ -n "$language" ]; then
	
	if [[ "$split" == "on" ]]; then 
	
	count=1
	for x in ./"$baseName"/*.mp3; do

    basePath=${x%.*}
    Name=${basePath##*/}
		
	sleep 1
	
	id3 -2 -t "$baseName" -a "$author" -g Audiobooks -l "$publication" -n "$count" -c "Voice: $fullname\ | Speed: $speed\ | Term: Spring\ 2021\ | Math\ Text: $math_text\ | Footnotes:\ $footnote\ | Figure\ Captions:\ $figcaption\ | Extended\ Descriptions:\ $description\ | Secondary\ Text\ Regions:\ $secondary\ | Footnote\ Text\ Regions:\ $footnote_text\ | Table\ Captions:\ $table\ | Secondary\ Languages:\ $secondlanguage1\ $secondlanguage2\ $secondlanguage3\ $secondlanguage4\ $secondlanguage5" -y 2021 ./"$baseName"/"$baseName"_$count.mp3
 
	count=$[ $count + 1 ] ; 
	done
	
	else
	
	id3 -2 -t "$baseName" -a "$author" -g Audiobooks -l "$publication" -n "$track" -c "Voice: $fullname\ | Speed: $speed\ | Term: Spring\ 2021\ | Math\ Text: $math_text\ | Footnotes:\ $footnote\ | Figure\ Captions:\ $figcaption\ | Extended\ Descriptions:\ $description\ | Secondary\ Text\ Regions:\ $secondary\ | Footnote\ Text\ Regions:\ $footnote_text\ | Table\ Captions:\ $table\ | Secondary\ Languages:\ $secondlanguage1\ $secondlanguage2\ $secondlanguage3\ $secondlanguage4\ $secondlanguage5" -y 2021 ./"$baseName"/"$baseName".mp3
	
	fi
		
	else
	
	if [[ "$split" == "on" ]]; then 
	
	count=1
	for x in ./"$baseName"/"$baseName"*.mp3; do

    basePath=${x%.*}
    Name=${basePath##*/}
		
	sleep 1
	
			id3 -2 -t "$baseName" -a "$author" -g Audiobooks -l "$publication" -n "$count" -c "Voice: $fullname\ | Speed: $speed\ | Term: Spring\ 2021\ | Math\ Text: $math_text\ | Footnotes:\ $footnote\ | Figure\ Captions:\ $figcaption\ | Extended\ Descriptions:\ $description\ | Secondary\ Text\ Regions:\ $secondary\ | Footnote\ Text\ Regions:\ $footnote_text\ | Table\ Captions:\ $table\ | Secondary\ Languages:\ none" -y 2021 ./"$baseName"/"$baseName"_$count.mp3
 
	count=$[ $count + 1 ] ; 
	done
	
	else
	
	id3 -2 -t "$baseName" -a "$author" -g Audiobooks -l "$publication" -n "$track" -c "Voice: $fullname\ | Speed: $speed\ | Term: Spring\ 2021\ | Math\ Text: $math_text\ | Footnotes:\ $footnote\ | Figure\ Captions:\ $figcaption\ | Extended\ Descriptions:\ $description\ | Secondary\ Text\ Regions:\ $secondary\ | Footnote\ Text\ Regions:\ $footnote_text\ | Table\ Captions:\ $table\ | Secondary\ Languages:\ none" -y 2021 ./"$baseName"/"$baseName".mp3
	
	fi
	
	fi
	
		echo -ne "Adding cover image and id3 tags... \033[1;32mDone.\033[0m     \r"
		
		echo -ne '\n'
		
if [ -n "$error" ]; then
	
# # Remove voice markups (Linguatec)
	
# # Remove pause before and after parentheses or brackets:
	
	sed -i 's/<Pitch=END_100\/><Pause=500\/><Pitch=75\/>//g' ./"$baseName"/"$baseName".txt
	
	sed -i 's/<Pitch=END_75\/><Pause=500\/><Pitch=100\/>//g' ./"$baseName"/"$baseName".txt
	
	sed -i 's/<Pitch=END_100\/><Pitch=75\/><Pause=500\/>//g' ./"$baseName"/"$baseName".txt
	
# # Remove pitch changes for page numbers
	
	perl -pi -e 's/<Pitch=120\/>//g' ./"$baseName"/"$baseName".txt
	
	perl -pi -e 's/<Pitch=END_120\/>//g' ./"$baseName"/"$baseName".txt

# # Remove pitch changes for line numbers

	perl -pi -e 's/<Pause=600\/><Pitch=70\/>//g' ./"$baseName"/"$baseName".txt
	
	perl -pi -e 's/<Pitch=END_70\/><Pitch=100\/>//g' ./"$baseName"/"$baseName".txt
	
# # Remove pause in poetry files

    perl -pi -e 's/<Pause=800\/>//g' ./"$baseName"/"$baseName".txt
	
# # Remove pauses

    perl -pi -e 's/<Pause=600\/>//g' ./"$baseName"/"$baseName".txt

# # Remove voice markups (SAPI5)
	
# # Remove pause before and after parentheses or brackets:
	
	sed -i "s/<\/pitch><silence msec='800'\/><pitch absmiddle='-5'>//g" ./"$baseName"/"$baseName".txt
	
	sed -i "s/<\/pitch><silence msec='800'\/><pitch absmiddle='0'>//g" ./"$baseName"/"$baseName".txt
	
	sed -i "s/<\/pitch><pitch absmiddle='-5'><silence msec='800'\/>//g" ./"$baseName"/"$baseName".txt
	
	sed -i "s/<silence msec='800'\/>//g" ./"$baseName"/"$baseName".txt
	
	sed -i "s/<pitch absmiddle='-5'>//g" ./"$baseName"/"$baseName".txt
	
# # Remove pitch changes for page numbers
	
	perl -pi -e "s/<pitch absmiddle='7'>//g" ./"$baseName"/"$baseName".txt
	
	perl -pi -e "s/<\/pitch>//g" ./"$baseName"/"$baseName".txt

# # Remove pitch changes	for line numbers

	perl -pi -e "s/<silence msec='800'\/><pitch absmiddle='-5'>//g" ./"$baseName"/"$baseName".txt
	
	perl -pi -e "s/<\/pitch><pitch absmiddle='0'>//g" ./"$baseName"/"$baseName".txt
	
	perl -pi -e "s/<pitch absmiddle='0'>//g" ./"$baseName"/"$baseName".txt
	
# # Remove pause in poetry files

    perl -pi -e "s/<silence msec='1000'\/>//g" ./"$baseName"/"$baseName".txt
	
# # Remove pauses for headings

    perl -pi -e "s/<silence msec='800'\/>//g" ./"$baseName"/"$baseName".txt

    cp ./"$baseName"/"$baseName".txt ./"$baseName"/"$baseName"_post.txt

fi
		
if [ "$(ls -A ./"$baseName")" ]; then		
		
	find . -type f -iname \*.wav -delete
	
fi
	
if [[ "$caption" == "on" ]]; 

then 		
		
# Create a VTT file to synchronize MP3 with TXT file (Does not work with MP3 files that are over ~30 minutes long)

		# Assign proper language variable to Aeneas
		
		if [[ "$name" == @(Ava|Tom|Allison|Samantha|Susan|Microsoft David Desktop|Microsoft Hazel Desktop|Microsoft Mark|Microsoft James|Microsoft Linda|Microsoft Ravi|Microsoft Sean|IVONA \2 Joey) ]]; then
		
		lingua=eng
		
		fi 
		
		if [ "$name" == "Microsoft Elsa Desktop" ]; then
		
		lingua=ita
		
		fi 
		
		if [[ "$name" == @(Microsoft Hedda Desktop|Microsoft Michael|Microsoft Karsten) ]]; then
		
		lingua=deu
		
		fi 
		
		if [ "$name" == "Microsoft Haruka Desktop" ]; then
		
		lingua=jpn
		
		fi
		
		if [[ "$name" == @(Microsoft Helena Desktop|Microsoft Sabina Desktop) ]]; then
		
		lingua=spa
		
		fi 
		
		if [[ "$name" == @(Microsoft Hortense Desktop|Microsoft Claude|Microsoft Guillaume) ]]; then
		
		lingua=fra
		
		fi 
		
		if [[ "$name" == @(Microsoft Maria Desktop|Microsoft Helia) ]]; then
		
		lingua=por
		
		fi 
		
		if [ "$name" == "Microsoft Irina Desktop" ]; then
		
		lingua=rus
		
		fi

		if [[ "$name" == @(Microsoft Huihui Desktop|Microsoft Tracy Desktop|Microsoft Zhiwei) ]]; then
		
		lingua=cmn
		
		fi 
		
		if [ "$name" == "Microsoft Paulina Desktop" ]; then
		
		lingua=pol
		
		fi 
		
		if [[ "$name" == @(Microsoft Frank|Microsoft Bart) ]]; then
		
		lingua=nld
		
		fi 
		
		if [[ "$name" == @(Microsoft Naayf|Microsoft Hoda) ]]; then
		
		lingua=ara
		
		fi 
		
		if [ "$name" == "Microsoft An" ]; then
		
		lingua=vie
		
		fi

		if [ "$name" == "Microsoft Andika" ]; then
		
		lingua=ind
		
		fi 
		
		if [ "$name" == "Microsoft Andrei" ]; then
		
		lingua=ron
		
		fi

		if [ "$name" == "Microsoft Asaf" ]; then
		
		lingua=heb
		
		fi
		
		if [ "$name" == "Microsoft Bengt" ]; then
		
		lingua=swe
		
		fi
		
		if [ "$name" == "Microsoft Filip" ]; then
		
		lingua=slk
		
		fi 
		
		if [ "$name" == "Microsoft Heami" ]; then
		
		lingua=kor
		
		fi 
		
		if [ "$name" == "Microsoft Heidi" ]; then
		
		lingua=fin
		
		fi 
		
		if [ "$name" == "Microsoft Helle" ]; then
		
		lingua=dan
		
		fi
		
		if [ "$name" == "Microsoft Hemant" ]; then
		
		lingua=hin
		
		fi
		
		if [ "$name" == "Microsoft Herena" ]; then
		
		lingua=cat
		
		fi

		if [ "$name" == "Microsoft Ivan" ]; then
		
		lingua=bul
		
		fi
		
		if [ "$name" == "Microsoft Jakub" ]; then
		
		lingua=ces
		
		fi
		
		if [ "$name" == "Microsoft Jon" ]; then
		
		lingua=nor
		
		fi
		
		if [ "$name" == "Microsoft Lado" ]; then
		
		lingua=slv
		
		fi
		
		if [ "$name" == "Microsoft Matej" ]; then
		
		lingua=hrv
		
		fi
		
		if [ "$name" == "Microsoft Pattara" ]; then
		
		lingua=tha
		
		fi
		
		if [ "$name" == "Microsoft Rizwan" ]; then
		
		lingua=msa
		
		fi
		
		if [ "$name" == "Microsoft Stefanos" ]; then
		
		lingua=ell
		
		fi
		
		if [ "$name" == "Microsoft Szabolcs" ]; then
		
		lingua=hun
		
		fi
		
		if [ "$name" == "Microsoft Tolga" ]; then
		
		lingua=tur
		
		fi
		
		if [ "$name" == "Microsoft Valluvar" ]; then
		
		lingua=tam
		
		fi
		
		
		if [[ "$split" == "on" ]]; then 
		
		echo -ne "\nCreating caption (.vtt) files and MP3 bookmarks... \r"
		
		csplit -k -s -n 2 -b '%d.txt' -f ./"$baseName"/"$baseName"_formatted <(echo "ENDMDL dummy, delete this file"; cat ./"$baseName"/"$baseName"_formatted.txt) '/^<split>/+1' '{*}' && rm ./"$baseName"/"$baseName"_formatted0.txt
		
		perl -0777 -pi -e 's/<split>\n//g' ./"$baseName"/"$baseName"_formatted*.txt
		
		count=1
		for x in ./"$baseName"/"$baseName"_formatted[1-9]*.txt; do

		basePath=${x%.*}
		Name=${basePath##*/}
		
		echo -ne "Creating caption (.vtt) file and MP3 bookmarks... \033[1;33mTrack $count\033[0m\r"
			
		sleep 1
		
			mv ./"$baseName"/"$baseName"_formatted$count.txt ./"$baseName"/"$baseName"_formatted_$count.txt
	
			fold -w 35 -s ./"$baseName"/"$baseName"_formatted_$count.txt > ./"$baseName"/"$baseName"_segmented_$count.txt
			
			rm ./"$baseName"/"$baseName"_formatted_$count.txt
			
			mv ./"$baseName"/"$baseName"_segmented_$count.txt ./"$baseName"/"$baseName"_$count.txt
			
			perl -00 -pi -le 's/.*\n.*\n/$&\n/mg' ./"$baseName"/"$baseName"_$count.txt
			
			# Create syncmap
		
		python -m aeneas.tools.execute_task ./"$baseName"/"$baseName"_$count.mp3 ./"$baseName"/"$baseName"_$count.txt "task_language=$lingua|task_adjust_boundary_nonspeech_min=1.000|task_adjust_boundary_nonspeech_string=REMOVE|is_text_file_ignore_regex=\[YzW\]|task_adjust_boundary_algorithm=percent|task_adjust_boundary_percent_value=75|is_text_type=subtitles|os_task_file_format=vtt" ./"$baseName"/"$baseName"_$count.vtt &> /dev/null
		
		grep -B 1 -A 3 'YzW' ./"$baseName"/"$baseName"_$count.vtt > ./"$baseName"/"$baseName"_$count.chapters.txt
		
		perl -0777 -pi -e 's/YzW(.*\n)//g' ./"$baseName"/"$baseName"_$count.vtt
		
		perl -i -ne 'print if /^[0-9][0-9]:/' ./"$baseName"/"$baseName"_$count.chapters.txt
		
		sed -i 's/-->.*/\n@@/g' ./"$baseName"/"$baseName"_$count.chapters.txt
		
		mv ./"$baseName"/headings$count.txt ./
		
		# awk -v count="$count"
		
		awk -v count="$count" '
    /^@@/{                   
        getline <"./headings'$count'.txt" 
    }
    1                      
    ' ./"$baseName"/"$baseName"_$count.chapters.txt > tmp && mv tmp ./"$baseName"/"$baseName"_$count.chapters.txt
	
		perl -0777 -pi -e 's/\n@@//g' ./"$baseName"/"$baseName"_$count.chapters.txt
		
		rm ./headings$count.txt
 
		count=$[ $count + 1 ] ; 
		done
		
		echo -ne "Creating caption (.vtt) file and MP3 bookmarks... \033[1;32mDone.\033[0m     \r"
		
		echo -ne '\n'
		
		else
		
		echo -ne "\nCreating caption (.vtt) file and MP3 bookmarks... \r"
		
		# Break lines at 35 characters

		fold -w 35 -s ./"$baseName"/"$baseName"_formatted.txt > ./"$baseName"/"$baseName"_segmented.txt
		
		rm ./"$baseName"/"$baseName"_formatted.txt

		mv ./"$baseName"/"$baseName"_segmented.txt ./"$baseName"/"$baseName".txt

		perl -00 -pi -le 's/.*\n.*\n/$&\n/mg' ./"$baseName"/"$baseName".txt
		
		# Create syncmap
		
		python -m aeneas.tools.execute_task ./"$baseName"/"$baseName".mp3 ./"$baseName"/"$baseName".txt "task_language=$lingua|task_adjust_boundary_nonspeech_min=1.000|task_adjust_boundary_nonspeech_string=REMOVE|is_text_file_ignore_regex=\[YzW\]|task_adjust_boundary_algorithm=percent|task_adjust_boundary_percent_value=75|is_text_type=subtitles|os_task_file_format=vtt" ./"$baseName"/"$baseName".vtt &> /dev/null
		
		if [ ! -f ./"$baseName"/"$baseName".vtt ];
		
		then
		
		echo -e "\033[1;33mATTENTION:\033[0m \033[1;35m"$baseName".mp3\033[0m is too long for a caption file to be generated:\n"
		
		ffmpeg -i ./"$baseName"/"$baseName".mp3 2>&1 | sed -n -e 's/^  \(.*\)\(, start:\)\(.*\)$/\1/p'
		
		echo -e "\nConsider breaking up \033[1;35m"$baseName".docx\033[0m into smaller chunks."
		
		else
		
		grep -B 1 -A 3 'YzW' ./"$baseName"/"$baseName".vtt > ./"$baseName"/"$baseName".chapters.txt
		
		perl -0777 -pi -e 's/YzW(.*\n)//g' ./"$baseName"/"$baseName".vtt
		
		perl -i -ne 'print if /^[0-9][0-9]:/' ./"$baseName"/"$baseName".chapters.txt
		
		sed -i 's/-->.*/\n@@/g' ./"$baseName"/"$baseName".chapters.txt
		
		mv ./"$baseName"/headings.txt ./
		
		awk '
    /^@@/{                   
        getline <"./headings.txt" 
    }
    1                      
    ' ./"$baseName"/"$baseName".chapters.txt > tmp && mv tmp ./"$baseName"/"$baseName".chapters.txt
	
		perl -0777 -pi -e 's/\n@@//g' ./"$baseName"/"$baseName".chapters.txt

		echo -ne "Creating caption (.vtt) file and MP3 bookmarks... \033[1;32mDone.\033[0m\r"
		
		echo -ne '\n'
		
		fi
		
		fi
		
		fi
		
# Remove TXT file
		
# rm ./"$baseName"/"$baseName".txt

# Print the name of the HTML file that was converted as well as the time to the log.txt file.

echo -e "\n"$baseName".mp3 CREATED on "$TIMESTAMP"\n" >> ./Converted-DOCX-MP3/log.txt

if [[ "$split" == "on" ]]; then 

count=1
	for x in ./"$baseName"/*.mp3; do

    basePath=${x%.*}
    Name=${basePath##*/}
		
	sleep 1
	
	id3 ./"$baseName"/"$baseName"_$count.mp3 2>&1 | grep -e Artist: -e Album: -e Track: -e Comment: >> ./Converted-DOCX-MP3/log.txt
	
	ffmpeg -i ./"$baseName"/"$baseName"_$count.mp3 2>&1 | sed -n -e 's/^  \(.*\)\(, start:\)\(.*\)$/\1/p' >> ./Converted-DOCX-MP3/log.txt

	# Remove an empty line at the beginning of the log.txt file

	sed -i '1{/^$/d}' ./Converted-DOCX-MP3/log.txt
	
	rm ./"$baseName"/"$baseName"_$count.txt
 
	count=$[ $count + 1 ] ; 
	done

else
			
# Print the information about the audio file

id3 ./"$baseName"/"$baseName".mp3 2>&1 | grep -e Artist: -e Album: -e Track: -e Comment: >> ./Converted-DOCX-MP3/log.txt

rm ./"$baseName"/"$baseName".txt

fi

if [[ "$caption" == "on" ]]; then 

if [[ "$split" == "on" ]]; then 

count=1
		for x in ./"$baseName"/*.mp3; do

    basePath=${x%.*}
    Name=${basePath##*/}
		
	sleep 1
	
	mp3chaps -i ./"$baseName"/"$baseName"_$count.mp3 >/dev/null  2>&1

	rm ./"$baseName"/"$baseName"_$count.chapters.txt
	
 
	count=$[ $count + 1 ] ; 
	done
	
	rm ./"$baseName"/headings.txt
	
	rm ./"$baseName"/"$baseName".txt
	
	rm ./"$baseName"/"$baseName"_formatted.txt
	
else

mp3chaps -i ./"$baseName"/"$baseName".mp3 >/dev/null  2>&1

rm ./"$baseName"/"$baseName".chapters.txt

rm ./headings.txt

fi

fi

if [[ "$caption" == "on" ]]; then

if [[ ! "$keep" == "on" ]]; then

find ./"$baseName" -type f -name "*.vtt" -exec rm -f {} \;

fi

fi

# Grep the duration of the audio file

if [[ "$split" == "off" ]]; then 

ffmpeg -i ./"$baseName"/"$baseName".mp3 2>&1 | sed -n -e 's/^  \(.*\)\(, start:\)\(.*\)$/\1/p' >> ./Converted-DOCX-MP3/log.txt

# Remove an empty line at the beginning of the log.txt file

sed -i '1{/^$/d}' ./Converted-DOCX-MP3/log.txt

fi	

	
if [ -n "$word" ]; then

if /c/scripts/tasklist.exe //FI "IMAGENAME eq WINWORD.EXE" 2> /dev/null | grep -q "WINWORD.EXE" 2> /dev/null ; then

echo -e "\nMS Word is running... \033[1;35m"$baseName".docx\033[0m will remain in the current folder and not moved to the \033[1;44mConverted-DOCX-MP3\033[0m folder.\x1B[49m\x1B[K\n"

cp  ./"$baseName".docx ./Converted-DOCX-MP3/"$baseName"_MP3.docx 2> /dev/null

else

mv ./"$baseName".docx ./Converted-DOCX-MP3/"$baseName"_MP3.docx

echo -e "\nMoved \033[1;35m"$baseName".docx\033[0m to the \033[1;44mConverted-DOCX-MP3\033[0m folder.\x1B[49m\x1B[K\n"

fi

else 

	cp  ./"$baseName".docx ./Converted-DOCX-MP3/"$baseName"_MP3.docx 2> /dev/null
	
    echo -e "\nA copy of \033[1;35m"$baseName".docx\033[0m was moved to the \033[1;44mConverted-DOCX-MP3\033[0m folder.\x1B[49m\x1B[K\n"

fi

language=""
language1=""
language2=""
language3=""
language4=""
language5=""
language6=""
language7=""
language8=""
language9=""


done

echo -e "See \e[33mlog.txt\e[0m file for more details."

if [ -f ./tmp ] ; then

rm ./tmp

fi

if [ -f ./~ ] ; then

rm ./~

fi

exit 1
