#!/bin/bash

# Joseph Polizzotto
# UC Berkeley
# 510-642-0329
# Version 0.2.1
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
	printf "  %-10s %-6s\n" "" "Alternative Media Unit"
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
	printf "  %-5s %-3s\n" "-i" "Inspect pronunciation of math equations and proper nouns"
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
	printf "  %-10s %-6s %-3s\n" "" "grc" "[Greek - Ancient]"
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
	printf "  %-10s %-9s %-3s\n" "" "Huihui" "[Chinese - China]"
	printf "  %-10s %-9s %-3s\n" "" "Tracy" "[Chinese - Hong Kong]"
	printf "  %-10s %-9s %-3s\n" "" "Zhiwei" "[Chinese - Taiwan]"
	printf "  %-10s %-9s %-3s\n" "" "Jakub" "[Czech]"
	printf "  %-10s %-9s %-3s\n" "" "Helle" "[Danish]"
	printf "  %-10s %-9s %-3s\n" "" "Frank" "[Dutch - Netherlands]"
	printf "  %-10s %-9s %-3s\n" "" "Bart" "[Dutch - Belgium]"
	printf "  %-10s %-9s %-3s\n" "" "James" "[English - Australia]"
	printf "  %-10s %-9s %-3s\n" "" "Linda" "[English - Canada]"
	printf "  %-10s %-9s %-3s\n" "" "Hazel" "[English - Great Britain]"
	printf "  %-10s %-9s %-3s\n" "" "Ravi" "[English - India]"
	printf "  %-10s %-9s %-3s\n" "" "Sean" "[English - Ireland]"
	printf "  %-10s %-9s %-3s\n" "" "David" "[English - United States]"
	printf "  %-10s %-9s %-3s\n" "" "Mark" "[English - United States]"
	printf "  %-10s %-9s %-3s\n" "" "Joey" "[English - United States]"
	printf "  %-10s %-9s %-3s\n" "" "Zira" "[English - United States]"
	printf "  %-10s %-9s %-3s\n" "" "Heidi" "[Finnish]"
	printf "  %-10s %-9s %-3s\n" "" "Hortense" "[French - France]"
	printf "  %-10s %-9s %-3s\n" "" "Mathieu" "[French - France]"
	printf "  %-10s %-9s %-3s\n" "" "Claude" "[French - Canada]"
	printf "  %-10s %-9s %-3s\n" "" "Guillaume" "[French - Switzerland]"
	printf "  %-10s %-9s %-3s\n" "" "Hedda" "[German - Germany]"
	printf "  %-10s %-9s %-3s\n" "" "Michael" "[German- Austria]"
	printf "  %-10s %-9s %-3s\n" "" "Karsten" "[German - Switzerland]"
	printf "  %-10s %-9s %-3s\n" "" "Stefanos" "[Greek]"
	printf "  %-10s %-9s %-3s\n" "" "AncientGr" "[Greek Ancient]"	
	printf "  %-10s %-9s %-3s\n" "" "Asaf" "[Hebrew]"
	printf "  %-10s %-9s %-3s\n" "" "Hemant" "[Hindi]"
	printf "  %-10s %-9s %-3s\n" "" "Matej" "[Croatian]"
	printf "  %-10s %-9s %-3s\n" "" "Szabolcs" "[Hungarian]"
	printf "  %-10s %-9s %-3s\n" "" "Andika" "[Indonesian]"
	printf "  %-10s %-9s %-3s\n" "" "Elsa" "[Italian]"
	printf "  %-10s %-9s %-3s\n" "" "Giorgio" "[Italian]"
	printf "  %-10s %-9s %-3s\n" "" "Haruka" "[Japanese]"
	printf "  %-10s %-9s %-3s\n" "" "Heami" "[Korean]"
	printf "  %-10s %-9s %-3s\n" "" "Rizwan" "[Malaysian]"
	printf "  %-10s %-9s %-3s\n" "" "Jon" "[Norwegian]"
	printf "  %-10s %-9s %-3s\n" "" "Paulina" "[Polish]"
	printf "  %-10s %-9s %-3s\n" "" "Helia" "[Portuguese - Portugal]"
	printf "  %-10s %-9s %-3s\n" "" "Maria" "[Portuguese - Brazil]"
	printf "  %-10s %-9s %-3s\n" "" "Andrei" "[Romanian]"
	printf "  %-10s %-9s %-3s\n" "" "Irina" "[Russian]"
	printf "  %-10s %-9s %-3s\n" "" "Filip" "[Slovak]"
	printf "  %-10s %-9s %-3s\n" "" "Lado" "[Slovenian]"
	printf "  %-10s %-9s %-3s\n" "" "Helena" "[Spanish - Spain]"
	printf "  %-10s %-9s %-3s\n" "" "Sabina" "[Spanish - Mexico]"
	printf "  %-10s %-9s %-3s\n" "" "Miguel" "[Spanish - USA]"
	printf "  %-10s %-9s %-3s\n" "" "Penelope" "[Spanish - USA]"
	printf "  %-10s %-9s %-3s\n" "" "Bengt" "[Swedish]"
	printf "  %-10s %-9s %-3s\n" "" "Valluvar" "[Tamil]"
	printf "  %-10s %-9s %-3s\n" "" "Pattara" "[Thai]"
	printf "  %-10s %-9s %-3s\n" "" "Tolga" "[Turkish]"
	printf "  %-10s %-9s %-3s\n" "" "An" "[Vietnamese]"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "David"
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
	printf "  %-10s %-6s\n" "" "-10 to 10"
	printf "  %-5s %-3s\n" "" "Default:"
	printf "  %-10s %-6s\n" "" "0"
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
    printf "\nVersion 0.2.0\n"

return 0
}

while getopts :n:s:a:p:l:mc:et:hir:w:v flag

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
		i) inspect="${flag}";;
		l) language+=("$OPTARG");;
        n) name=${OPTARG};
		if [[ ! "$name" == An && ! "$name" == Andika && ! "$name" == Andrei && ! "$name" == Asaf && ! "$name" == Bart && ! "$name" == Bengt && ! "$name" == Claude && ! "$name" == David && ! "$name" == Elsa && ! "$name" == Filip && ! "$name" == Frank && ! "$name" == Guillaume && ! "$name" == Haruka && ! "$name" == Hazel && ! "$name" == Heami && ! "$name" == Hedda && ! "$name" == Heidi && ! "$name" == Helena && ! "$name" == Helia && ! "$name" == Helle && ! "$name" == Hemant && ! "$name" == Herena && ! "$name" == Hoda && ! "$name" == Hortense && ! "$name" == Huihui && ! "$name" == Irina && ! "$name" == Ivan && ! "$name" == Jakub && ! "$name" == James && ! "$name" == Joey && ! "$name" == Jon && ! "$name" == Karsten && ! "$name" == Lado && ! "$name" == Linda && ! "$name" == Maria && ! "$name" == Mark && ! "$name" == Matej && ! "$name" == Michael && ! "$name" == Naayf && ! "$name" == Pattara && ! "$name" == Paulina && ! "$name" == Ravi && ! "$name" == Rizwan && ! "$name" == Sabina && ! "$name" == Sean && ! "$name" == Stefanos && ! "$name" == Susan && ! "$name" == Szabolcs && ! "$name" == Tolga && ! "$name" == Tracy && ! "$name" == Valluvar && ! "$name" == Zhiwei && ! "$name" == Zira && ! "$name" == AncientGr && ! "$name" == Mathieu && ! "$name" == Miguel && ! "$name" == Giorgio && ! "$name" == Penelope ]]; then 
        echo -e "\n\033[1;31mInvalid name entered for -n option (You must enter one of the following: An, Andika, Andrei, Asaf, Bart, Bengt, Claude, David, Elsa, Filip, Frank, Giorgio, Guillaume, Haruka, Hazel, Heami, Hedda, Heidi, Helena, Helia, Helle, Hemant, Herena, Hoda, Hortense, Huihui, Irina, Ivan, Jakub, James, Joey, Jon, Karsten, Lado, Linda, Maria, Mark, Matej, Mathieu, Michael, Miguel, Naayf, Pattara, Paulina, Penelope, Ravi, Rizwan, Sabina, Sean, Stefanos, Susan, Szabolcs, Tolga, Tracy, Valluvar, Zhiwei, Zira, or AncientGr ). Exiting...\033[0m"
        exit 2
        fi
        ;;
		p) publication=${OPTARG};;
        s) speed=${OPTARG};
		if ! [[ "$speed" =~ ^[\-0-9]+$ &&"$speed" -gt -11 && "$speed" -lt 11 ]] ; then 
        echo -e "\n\033[1;31mInvalid value entered for -s option (You must enter a digit from -10 to 10). Exiting...\033[0m"
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

# Check if Git for Windows is installed

if  ! command -v git >/dev/null  2>&1; then 
echo -e "\n\033[1;31mError: Git for Windows was not found, which is required for processing the commands in this script. Install Git for Windows (https://git-scm.com/download/win). Exiting....\033[0m" >&2
exit 1

fi  
  
# Check if Balabolka is installed

if [ ! -f  "C:\balcon\balcon.exe" ]; then

echo -e "\n\033[1;31mError: balcon (MP3 program used for speech synthesis) was not found. Download balcon.exe (http://www.cross-plus-a.com/bconsole.htm) and place it in the \033[1;35mC:\balcon\\033[0m directory. Exiting....\033[0m\n" >&2

exit 1

fi 

# Check if Cover Image is Found

if [ ! -f  "C:\MP3 Cover\Default_Cover.jpg" ]; then

echo -e "\033[1;31mError: No cover image found. Place Default_Cover.jpg in \033[0m\033[1;44mC:\MP3 Cover\ \033[0m\033[1;31m directory. Exiting....\033[0m\x1B[49m\x1B[K" >&2

exit 1

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

if [[ "$language" == "grc" ]]; then 

if ! "C:\balcon\balcon.exe" -l | grep -q -w 'eSpeak-grc' 2> /dev/null ; then

echo -e "\n\033[1;31mError: eSpea-grc voice not Installed. Download eSpeak and enter GRC in one of the voice fields during installation. Exiting...\033[0m" >&2

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

			if [[ ! $val == af && ! $val == ar-sa && ! $val == ar-eg && ! $val == bg && ! $val == ca && ! $val == cs && ! $val == da && ! $val == de && ! $val == de-at && ! $val == de-ch && ! $val == el && ! $val == en-au && ! $val == en-ca && ! $val == en-gb && ! $val == en-in && ! $val == en-ie && ! $val == en-us && ! $val == es && ! $val == es-mx && ! $val == et && ! $val == fa && ! $val == fi && ! $val == fr && ! $val == fr-ca && ! $val == fr-ch && ! $val == grc && ! $val == he && ! $val == hi && ! $val == hr && ! $val == hu && ! $val == id && ! $val == it && ! $val == ja && ! $val == ko && ! $val == la && ! $val == lt && ! $val == ms && ! $val == nl && ! $val == nl-be && ! $val == no && ! $val == pl && ! $val == pt && ! $val == pt-br && ! $val == ro && ! $val == ru && ! $val == sk && ! $val == sl && ! $val == sv && ! $val == ta && ! $val == th && ! $val == tr && ! $val == vi && ! $val == zh-cn && ! $val == zh-hk && ! $val == zh-tw ]]; then
            echo -e "\033[1;31mInvalid ISO value entered with -l option:\033[0m "$val" \033[1;31m(Value must be one of the following: af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw ). Exiting...\033[0m"
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

  # Make David the default voice variable when the -n option is not used

        if [[ "$name" == "" ]]; then 
		
		name="Microsoft David Desktop"

        fi
		
    if [[ "$speed" == "" ]]; then
	
	speed="0"
	
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
	
	if [[ "$name" == "Zira" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Zira' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: Microsoft Zira not installed. Follow these steps to install additional voices on your PC (https://support.microsoft.com/en-us/office/how-to-download-text-to-speech-languages-for-windows-10-d5a6b612-b3ae-423f-afa5-4f6caf1ec5d3). Exiting...\033[0m" >&2

	exit 1

	fi

	name="Microsoft Zira Desktop"
	fullname="Zira (English - United States)"

	fi
	
	if [[ "$name" == "AncientGr" ]]; then 

	if ! "C:\balcon\balcon.exe" -l | grep -q -w 'eSpeak-grc' 2> /dev/null ; then

	echo -e "\n\033[1;31mError: eSpeak-grc voice not installed. Download and install Espeak and enter GRC in one of the voice fields during installation. Exiting...\033[0m" >&2

	exit 1

	fi

	name="eSpeak-grc"
	fullname="Ancient Greek (eSpeak - Ancient Greek)"

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
		
# Make Ivona 2 Mathieu  the voice variable when Mathieu is selected for the -n option

        if [[ "$name" == "Mathieu" ]]; then 
		
		if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Mathieu' 2> /dev/null ; then

		echo -e "\033[1;31mError: Mathieu not installed. Go to the HARPO website to install additional SAPI 5 voices on your PC (https://harposoftware.com/en/). Exiting...\033[0m" >&2

		exit 1

		fi
		
        name="IVONA 2 Mathieu"
		fullname="Mathieu (French - France)"
        
		fi

# Make Ivona 2 Giorgio  the voice variable when Giorgio is selected for the -n option

        if [[ "$name" == "Giorgio" ]]; then 
		
		if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Giorgio' 2> /dev/null ; then

		echo -e "\033[1;31mError: Giorgio not installed. Go to the HARPO website to install additional SAPI 5 voices on your PC (https://harposoftware.com/en/). Exiting...\033[0m" >&2

		exit 1

		fi
		
        name="IVONA 2 Giorgio"
		fullname="Giorgio (Italian)"
        
		fi

# Make Ivona 2 Miguel  the voice variable when Miguel is selected for the -n option

        if [[ "$name" == "Miguel" ]]; then 
		
		if ! "C:\balcon\balcon.exe" -l | grep -q -w 'Miguel' 2> /dev/null ; then

		echo -e "\033[1;31mError: Miguel not installed. Go to the HARPO website to install additional SAPI 5 voices on your PC (https://harposoftware.com/en/). Exiting...\033[0m" >&2

		exit 1

		fi
		
        name="IVONA 2 Miguel"
		fullname="Miguel (Spanish - USA)"
        
		fi

# Make Ivona 2 Penélope  the voice variable when Penélope is selected for the -n option

        if [[ "$name" == "Penelope" ]]; then 
		
		if ! "C:\balcon\balcon.exe" -l | grep -q -w 'lope' 2> /dev/null ; then

		echo -e "\033[1;31mError: Penélope not installed. Go to the HARPO website to install additional SAPI 5 voices on your PC (https://harposoftware.com/en/). Exiting...\033[0m" >&2

		exit 1

		fi
		
        name="IVONA 2 Penélope"
		fullname="Penélope (Spanish - USA)"
        
		fi				
		
# Turn on Language Switch if language dependencies are met

	if [ -n "$language" ]; then
	language=on
	fi
		
# Make UCB Alternative Media Department the default author variable when the -a option is not used

        if [[ "$author" == "" ]]; then 
         author="Alternative Media Unit"        
        fi
		
# Make 100 the default speed variable when the -s option is not used

        if [[ "$speed" == "" ]]; then 
         speed=0        
        fi

# Make 1 the default track variable when the -t option is not used

        if [[ "$track" == "" ]]; then 
         track=1        
        fi			
		
# Check if Pandoc is installed; if not, exit the script.

if ! [ -x "$(command -v pandoc)" ]; then

echo -e "\n\033[1;31mError: Pandoc (https://pandoc.org/installing.html)is not installed. This program is used for converting the DOCX to a TXT file before speech synthesis. Exiting...\033[0m" >&2

exit 1

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
echo -e "\n\033[1;31mError: Python was not found, which is required for running Aeneas, the syncmap aligner used in MP3 bookmark creation. Use the Aeneas installer (https://github.com/sillsdev/aeneas-installer/releases) to install Python. Will not create MP3 bookmarks or a caption file....\033[0m" >&2
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
echo -e "\n\033[1;31mCould not locate \033[1;35msentence-boundary-original.pl.\033[0m\033[1;31m Place \033[1;35msentence-boundary-original.pl\033[0m\033[1;31m in \033[0m\033[1;44mC:\scripts\ \033[0m\033[1;31mfolder and run the script again. Will not create MP3 bookmarks or a caption file....\033[0m\n" >&2
caption="off"
fi
fi

if [ "$caption" == "on" ];

then
if [ ! -f  "/c/scripts/HONORIFICS" ]; then 
echo -e "\033[1;31mCould not locate \033[1;35mHONORIFICS\033[0m\033[1;31m file. Place \033[1;35mHONORIFICS\033[0m\033[1;31m in \033[0m\033[1;44mC:\scripts\ \033[0m\033[1;31mfolder. Will not create MP3 bookmarks or a caption file....\033[0m\n" >&2
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

# Turn on Inspect if MS Edge is installed

if [ -n "$inspect" ]; then
inspect=on
nounphrase=on
fi

# Check if Python is installed

if [ "$nounphrase" == "on" ];

then
if  ! command -v python >/dev/null  2>&1; then 
echo -e "\n\033[1;31mError: Python was not found, which is required for running lexconvert.py and nounphrase.py to process proper nouns. Use the Aeneas installer (https://github.com/sillsdev/aeneas-installer/releases) included in this repository to install Python. Will not process proper nouns....\033[0m" >&2
nounphrase="off"
fi
fi

if [ "$nounphrase" == "on" ];

then
if [ ! -f  "/c/scripts/noun_phrases.py" ]; then 
echo -e "\033[1;31mCould not locate \033[1;35mnoun_phrases.py\033[0m\033[1;31m file. Place \033[1;35mnoun_phrases.py\033[0m\033[1;31m in \033[0m\033[1;44mC:\scripts\ \033[0m\033[1;31mfolder. Will not process proper nouns....\033[0m\n" >&2
nounphrase=off
fi
fi

if [ "$nounphrase" == "on" ];

then
if  ! command -v python import nltk >/dev/null  2>&1; then 
echo -e "\n\033[1;31mError: Python NLTK package was not found, which is required for running noun_phrases.py, the python script used in processing proper nouns. Type 'pip install --user -U nltk' to install NLTK. Will not process proper nouns....\033[0m" >&2
nounphrase=off
fi
fi

if [ "$nounphrase" == "on" ];

then
if [ ! -f  "/c/scripts/lexconvert.py" ]; then 
echo -e "\033[1;31mCould not locate \033[1;35mlexconvert.py\033[0m\033[1;31m file. Place \033[1;35mlexconvert.py\033[0m\033[1;31m in \033[0m\033[1;44mC:\scripts\ \033[0m\033[1;31mfolder. Will not process proper nouns....\033[0m\n" >&2
nounphrase=off
fi
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

read -n1 -s -r -p $'Press ANY key to continue...\r' key

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
perl -0777 -pi -e 's/(\n)(##### )/$1<heading5>/g' ./"$baseName"/"$baseName".txt
sed -i 's/\(<heading5>\)\(.*\)/\1\2<\/heading5>/g' ./"$baseName"/"$baseName".txt

# perl -0777 -pi -e 's/(\n)(#### )/$1/g' ./"$baseName"/"$baseName".txt
perl -0777 -pi -e 's/(\n)(#### )/$1<heading4>/g' ./"$baseName"/"$baseName".txt
sed -i 's/\(<heading4>\)\(.*\)/\1\2<\/heading4>/g' ./"$baseName"/"$baseName".txt

# perl -0777 -pi -e 's/(\n)(### )/$1/g' ./"$baseName"/"$baseName".txt
perl -0777 -pi -e 's/(\n)(### )/$1<heading3>/g' ./"$baseName"/"$baseName".txt
sed -i 's/\(<heading3>\)\(.*\)/\1\2<\/heading3>/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(\n)(## )/$1<heading2>/g' ./"$baseName"/"$baseName".txt
sed -i 's/\(<heading2>\)\(.*\)/\1\2<\/heading2>/g' ./"$baseName"/"$baseName".txt

sed -i '1!b;s/# /<heading1>/g' ./"$baseName"/"$baseName".txt
perl -0777 -pi -e 's/(\n)(# )/$1<heading1>/g' ./"$baseName"/"$baseName".txt
sed -i 's/\(<heading1>\)\(.*\)/\1\2<\/heading1>/g' ./"$baseName"/"$baseName".txt

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

# New in 1.0.8 (see further code)

# Add XML tags for Footer text regions if present

sed -i 's/Footer Begin:/<footer>/g' ./"$baseName"/"$baseName".txt

sed -i 's/Footer End./<\/footer>/g' ./"$baseName"/"$baseName".txt

#

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
	   echo -e "Table captions retained in \033[1;35m"$baseName".docx\033[0m.\n"
	   break
	   ;;
N | n) 
		echo -e "\n"
		table="no"
		perl -0777 -pi -e 's/\h*<table>[^<]*<\/table>//g' ./"$baseName"/"$baseName".txt
		awk '/<footer>/{p=1;print}/<\/footer>/{p=0}!p' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
		perl -0777 -pi -e 's/<footer>\n<\/footer>\n\n//g' ./"$baseName"/"$baseName".txt
		echo -e "Table captions removed from \033[1;35m"$baseName".docx\033[0m.\n" 
		break
		;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n ].\033[0m\n"
       ;;
	   
     
esac

done

fi

	if [[ "$table" == "" ]]; then 
         table="no"        
    fi

if grep -q '<footer>' ./"$baseName"/"$baseName".txt ; then

while true; do

echo -e "\033[1;33mATTENTION:\033[0m It looks like there are table footers in \033[1;35m"$baseName".docx\033[0m.\n"

read -n1 -p "Do you wish to keep the table footers [Y/N]?" answer
case $answer in
Y | y) 
       echo -e "\n"
	   sed -i 's/<footer>/<footer>Table Footer/g' ./"$baseName"/"$baseName".txt
	   perl -0777 -pi -e 's/(Table Footer\n\n)(\d+% )/$1/g' ./"$baseName"/"$baseName".txt
	   echo -e "Table footers retained in \033[1;35m"$baseName".docx\033[0m.\n"
	   break
	   ;;
N | n) 
		echo -e "\n"
		awk '/<footer>/{p=1;print}/<\/footer>/{p=0}!p' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
		perl -0777 -pi -e 's/<footer>\n<\/footer>\n\n//g' ./"$baseName"/"$baseName".txt
		echo -e "Table footers removed from \033[1;35m"$baseName".docx\033[0m.\n" 
		break
		;;
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n ].\033[0m\n"
       ;;
	   
     
esac

done

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
       #echo -e "Mathspeak flag turned on.\n"
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

# New in 0.1.9

perl -0777 -pi -e 's/\\\\\n/\\\\ /g' ./"$baseName"/"$baseName".txt

# add <equation> to opening $$

perl -0777 -pi -e 's/(\n)(\$\$)/$1<equation>\n/g' ./"$baseName"/"$baseName".txt

# add </equation> to closing $$

perl -0777 -pi -e 's/\$\$\n/\n<\/equation>\n/g' ./"$baseName"/"$baseName".txt

# join lines in between  $$

awk '/^<equation>/{a=1;b="$$";next}/^<\/equation>/{a=0;print"$$";next}a{printf b$0;b="";next}1' ./"$baseName"/"$baseName".txt > tmp 2> /dev/null && mv tmp ./"$baseName"/"$baseName".txt

sed -i -E 's|\\\\\\\$|LITDOL|g;s|\$([^$]*)\$|<equation>\1</equation>|g;s|LITDOL|\\\\\\\$|g' ./"$baseName"/"$baseName".txt

# sed -i -E 's|\$([^$]*)\$|<equation>\1</equation>|g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(<equation>)/\n$1\n/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(<\/equation>)/\n$1\n/g' ./"$baseName"/"$baseName".txt

awk '/^<equation>/{a=1;b="$$";next}/^<\/equation>/{a=0;print"$$";next}a{printf b$0;b="";next}1' ./"$baseName"/"$baseName".txt > tmp 2> /dev/null && mv tmp ./"$baseName"/"$baseName".txt

# New in 0.2.0
# Catch equations that were not captured by the last command

sed -zi 's/\n<equation>\n/\n$$/g' ./"$baseName"/"$baseName".txt

sed -zi 's/\n<\/equation>\n/$$\n/g' ./"$baseName"/"$baseName".txt

#

perl -0777 -pi -e 's/(\n\n)(\$\$\$\$\n)(.*)/$1\$\$$3/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(.*)(\n\$\$\$\$)(\n\n)/$1\$\$\n\n/g' ./"$baseName"/"$baseName".txt

if [ -n "$error" ];
		
then

cp ./"$baseName"/"$baseName".txt ./"$baseName"/"$baseName"_equation.txt
		
fi

###

# New in 0.2.0

sed -zi 's/\n$$\n/$$\n/g' ./"$baseName"/"$baseName".txt

sed -zi 's/\n$$\n/\n$$/g' ./"$baseName"/"$baseName".txt
		
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

# New in 0.1.9

perl -0777 -pi -e 's/\\\\\n/\\\\ /g' ./"$baseName"/"$baseName".txt

# add <equation> to opening $$

perl -0777 -pi -e 's/(\n)(\$\$)/$1<equation>\n/g' ./"$baseName"/"$baseName".txt

# add </equation> to closing $$

perl -0777 -pi -e 's/\$\$\n/\n<\/equation>\n/g' ./"$baseName"/"$baseName".txt

# join lines in between  $$

awk '/^<equation>/{a=1;b="$$";next}/^<\/equation>/{a=0;print"$$";next}a{printf b$0;b="";next}1' ./"$baseName"/"$baseName".txt > tmp 2> /dev/null && mv tmp ./"$baseName"/"$baseName".txt

sed -i -E 's|\\\\\\\$|LITDOL|g;s|\$([^$]*)\$|<equation>\1</equation>|g;s|LITDOL|\\\\\\\$|g' ./"$baseName"/"$baseName".txt

# sed -i -E 's|\$([^$]*)\$|<equation>\1</equation>|g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(<equation>)/\n$1\n/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(<\/equation>)/\n$1\n/g' ./"$baseName"/"$baseName".txt

awk '/^<equation>/{a=1;b="$$";next}/^<\/equation>/{a=0;print"$$";next}a{printf b$0;b="";next}1' ./"$baseName"/"$baseName".txt > tmp 2> /dev/null && mv tmp ./"$baseName"/"$baseName".txt

# New in 0.2.0
# Catch equations that were not captured by the last command

sed -zi 's/\n<equation>\n/\n$$/g' ./"$baseName"/"$baseName".txt

sed -zi 's/\n<\/equation>\n/$$\n/g' ./"$baseName"/"$baseName".txt

#

perl -0777 -pi -e 's/(\n\n)(\$\$\$\$\n)(.*)/$1\$\$$3/g' ./"$baseName"/"$baseName".txt

perl -0777 -pi -e 's/(.*)(\n\$\$\$\$)(\n\n)/$1\$\$\n\n/g' ./"$baseName"/"$baseName".txt

if [ -n "$error" ];
		
then

cp ./"$baseName"/"$baseName".txt ./"$baseName"/"$baseName"_equation.txt
		
fi

###

# New in 0.2.0

sed -zi 's/\n$$\n/$$\n/g' ./"$baseName"/"$baseName".txt

sed -zi 's/\n$$\n/\n$$/g' ./"$baseName"/"$baseName".txt

#

# Extract display equations
sed -n 's/\(\$\$\)\(.*\)\(\$\$\)/\2/p' ./"$baseName"/"$baseName".txt > ./"$baseName"/display-log.txt

# Place spacein front of minus sign if it begins the LaTeX equation (causes a LaTeX parsing error)

sed -i 's/^-/ -/g' ./"$baseName"/display-log.txt

## New in 0.1.9

# Remove comma within equations

perl -pi -e 's/&lt;/\\lt/g' ./"$baseName"/display-log.txt

perl -pi -e 's/\\&amp;/\\ & /g' ./"$baseName"/display-log.txt

perl -pi -e 's/&amp;/&/g' ./"$baseName"/display-log.txt

perl -pi -e 's/\\\&/\&/g' ./"$baseName"/display-log.txt

perl -pi -e 's/∰/\\iiint\\limits/g' ./"$baseName"/display-log.txt

perl -pi -e 's/,//g' ./"$baseName"/display-log.txt

## New in 0.1.7

sed -i 's/~/ /g' ./"$baseName"/display-log.txt

sed -i '/\\text/ s/^/"/' ./"$baseName"/display-log.txt

sed -i '/^"/ s/$/"/' ./"$baseName"/display-log.txt

##

# Insert place marker for display equations

sed -i 's/\(\$\$\)\(.*\)\(\$\$\)/@@ \2/g' ./"$baseName"/"$baseName".txt

# Delete Empty lines

sed -i '/^\s*$/d' ./"$baseName"/display-log.txt 

# New in 0.1.7

sed -i 's/~/ /g' ./"$baseName"/display-log.txt

sed -i 's/"//g'  ./"$baseName"/display-log.txt

# New in 0.2.0
# Remove backslash SPACE if it exists within \text commands

perl -0777 -i -wpe's{(\\text\{ (?:(?!\\text\{|\}).)*? \})}{ $1 =~ s/\\ / /gr }egmsx' ./"$baseName"/display-log.txt

# Remove zero-width spaces from math text

sed -i 's/\xe2\x80\x8b//g' ./"$baseName"/display-log.txt 

sed -i 's/\xe2\x80\x8d//g' ./"$baseName"/display-log.txt 

#

sed -i 's/\\%/%/g'  ./"$baseName"/display-log.txt

touch ./"$baseName"/display-log2.txt

##################

# New in 0.2.0

if [[ "$inspect" == "on" ]]; then 

cp ./"$baseName"/display-log.txt ./"$baseName"/latex_full.txt

count=1
while IFS="" read -r p || [ -n "$p" ] ; do echo -ne "Processing equations... \033[1;33m$count\033[0m\r" ; tex2svg "$p" >> ./"$baseName"/display-log2.txt  ; count=$[ $count + 1 ] ; done <./"$baseName"/display-log.txt 

count=$[ $count - 1 ]

cp ./"$baseName"/display-log2.txt ./"$baseName"/svg_full.txt

sed -i -n 's/.*1-Title">//p' ./"$baseName"/display-log2.txt

IFS=$IFS_OLD

# Remove txt files

rm ./"$baseName"/display-log.txt 

# Delete Empty lines

sed -i '/^\s*$/d' ./"$baseName"/display-log2.txt 

# Remove <\/title>

sed -i 's/<\/title>//g' ./"$baseName"/display-log2.txt 

# Correct speech markup

# Remove "reverse solidus" text within equations that have text style

sed -i -e 's/ reverse-solidus//g' ./"$baseName"/display-log2.txt 


### Add More Corrections Here #####

# sed -i -e 's/ reverse-solidus//g' ./"$baseName"/display-log2.txt 

# 

# Add String to beginning of each line

sed -i -e 's/^/@@ /' ./"$baseName"/display-log2.txt 

cp ./"$baseName"/display-log2.txt ./"$baseName"/TTS_full.txt

	#### New in 0.1.7
	
	# Make Corrections
	
sed -i 's/ quotation-mark//g' ./"$baseName"/TTS_full.txt	

sed -i 's/ slash/ divided by/g' ./"$baseName"/TTS_full.txt

sed -i 's/ percent-sign/ percent/g' ./"$baseName"/TTS_full.txt

sed -i 's/ StartFraction/ /g' ./"$baseName"/TTS_full.txt

sed -i 's/ EndFraction/ /g' ./"$baseName"/TTS_full.txt

sed -i 's/ upper/ /g' ./"$baseName"/TTS_full.txt

sed -i 's/ left-parenthesis/ /g' ./"$baseName"/TTS_full.txt

sed -i 's/ right-parenthesis/ /g' ./"$baseName"/TTS_full.txt

sed -i 's/ right-parenthesis/ /g' ./"$baseName"/TTS_full.txt

sed -i 's/ comma //g' ./"$baseName"/TTS_full.txt

####

touch ./"$baseName"/math_equations.html

echo -e "<!DOCTYPE html>\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en">\n<head>\n<title>"$baseName" - Review Equations</title>\n<style>\n</style>\n</head>\n<body>\n<main>\n<h1>"$baseName" - Review Equations</h1>" | cat - ./"$baseName"/math_equations.html > temp && mv temp ./"$baseName"/math_equations.html

COUNTER=1
eval MAX=$count
Headers="<h2>Equation</h2>"

while (( $COUNTER <= $MAX )); do
        echo -e "<div>\n<h2>"$COUNTER"</h2>\n<p><textarea id=\"equation_"$COUNTER"\">\n@@\n</textarea></p>\n</div>" >> ./"$baseName"/math_equations.html
        let COUNTER=$COUNTER+1
done

#

sed -i -e 's/src=/src="/g' ./"$baseName"/math_equations.html

sed -i -e 's/ type=/" type="/g' ./"$baseName"/math_equations.html

sed -i -e 's/\/wav>/\/wav">/g' ./"$baseName"/math_equations.html

echo -e "</main>\n<footer>\n<p role=\"contentinfo\">This document was created by the Alternative Media Unit of the Disabled Students' Program at UC Berkeley. For questions or concerns about this document, please contact us at dspamc@berkeley.edu.</p>\n</footer>\n</main>\n</body>\n</html>" >> ./"$baseName"/math_equations.html

perl -pi -e 's/<\/h2>/<\/h2>\n<p><code>\n##\n<\/code><\/p>\n<p>\n%%\n<\/p>/g' ./"$baseName"/math_equations.html

sed -i -e 's/^/## /g' ./"$baseName"/latex_full.txt

# Add line marker before SVG line

perl -0777 -pi -e 's/<svg /&&&\n<svg /g' ./"$baseName"/svg_full.txt

# Move SVG components onto the same line

awk '/^&&&/{a=1;b="";next}/^<\/svg>/{a=0;print"</svg>";next}a{printf b$0;b="";next}1' ./"$baseName"/svg_full.txt > tmp && mv tmp ./"$baseName"/svg_full.txt

# Correct the IDs for each SVG to make them distinct

sed -i 's/aria-labelledby="MathJax-SVG-1-Title"/aria-labelledby="svg_title_~~~"/g' ./"$baseName"/svg_full.txt

sed -i 's/title id="MathJax-SVG-1-Title"/title id="svg_title_%%%"/g' ./"$baseName"/svg_full.txt

awk '{for(x=1;x<=NF;x++)if($x~/~~~/){sub(/~~~/,++i)}}1' ./"$baseName"/svg_full.txt > tmp && mv tmp ./"$baseName"/svg_full.txt

awk '{for(x=1;x<=NF;x++)if($x~/%%%/){sub(/%%%/,++i)}}1' ./"$baseName"/svg_full.txt > tmp && mv tmp ./"$baseName"/svg_full.txt

# Add math class to SVG files

sed -i -e 's/<svg /<svg class="math" /g' ./"$baseName"/svg_full.txt

# Add String to beginning of each line

sed -i -e 's/^/%% /' ./"$baseName"/svg_full.txt

mv ./"$baseName"/latex_full.txt ./

mv ./"$baseName"/svg_full.txt ./

mv ./"$baseName"/TTS_full.txt ./

awk '
    /^##/{                   
        getline <"./latex_full.txt" 
    }
    1                      
    ' ./"$baseName"/math_equations.html > tmp && mv tmp ./"$baseName"/math_equations.html
	
awk '
    /^%%/{                   
        getline <"./svg_full.txt" 
    }
    1                      
    ' ./"$baseName"/math_equations.html > tmp && mv tmp ./"$baseName"/math_equations.html
	
awk '
    /^@@/{                   
        getline <"./TTS_full.txt" 
    }
    1                      
    ' ./"$baseName"/math_equations.html > tmp && mv tmp ./"$baseName"/math_equations.html
	
rm ./latex_full.txt

rm ./svg_full.txt
	
sed -i 's/^\(## \)*//g' ./"$baseName"/math_equations.html

sed -i 's/^\(%% \)*//g' ./"$baseName"/math_equations.html

sed -i 's/^\(@@ \)*//g'	./"$baseName"/math_equations.html

sed -zi 's/\(id="equation_[[:digit:]]\+>\)\(\n\)/\1/g' ./"$baseName"/math_equations.html

sed -i "s/<svg /<svg class="math" /g"	./"$baseName"/math_equations.html

perl -pi -e 's/<style>/<style>\n.math {\nbackground-color: #E7FFE7 ;\ndisplay: inline-block\n}\n/g' ./"$baseName"/math_equations.html

perl -pi -e 's/<style>/<style>\ncode {\nbackground: #f4f4f4;background: #f4f4f4;\n}\n/g' ./"$baseName"/math_equations.html

perl -pi -e 's/<style>/<style>\n.alt-text {\nbackground-color: #E6E6FA ;\ndisplay: inline-block\n}\n/g' ./"$baseName"/math_equations.html

#perl -pi -e 's/<style>/<style>\nh2 {\ncolor:blue;text-align:center;;\n}\n/g' ./"$baseName"/math_equations.html

perl -pi -e 's/<style>/<style>\nh2 {\ncolor:blue;\n}\n/g' ./"$baseName"/math_equations.html

#sed -i 's/<div>/<div style="text-align:center;">/g' ./"$baseName"/math_equations.html

perl -pi -e 's/(id="equation.*)(\n)/$1/g' ./"$baseName"/math_equations.html

cp ./TTS_full.txt ./"$baseName"/TTS_full_2.txt

rm ./TTS_full.txt 

sed -i 's/^\(@@ \)*//g'	./"$baseName"/TTS_full_2.txt

awk '{filename = sprintf("equation_%d.txt", NR); print >filename; close(filename)}' ./"$baseName"/TTS_full_2.txt

mv ./equation_*.txt ./"$baseName"/

rm ./"$baseName"/TTS_full_2.txt

echo -ne 'Processing equations... \033[1;32mDone.\033[0m\r'

echo -ne '\n\n'

echo -ne 'Opening MS Edge...'

echo -ne '\n\n'

cwd=$(pwd)

start msedge "$cwd/$baseName/math_equations.html"

while true; do

read -n1 -p "Would you like to correct the alternative text of math equations in $(echo -e "\033[1;44m$baseName.mp3\033[0m\x1B[49m\x1B[K")? [Y/N]?" answer

case $answer in
Y | y) 
	   echo -e "\n"
	   correct=on
	   break
	   ;;
	   
N | n) 
	   echo -e "\n"
	   correct=off
	   break
	   ;;	
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n].\033[0m\n"
	   ;;

	   
esac

done

if [[ "$correct" == "on" ]]; then 

function alt_text_math {
if [ ! -f  "./$baseName/equation_new_$CHOICE.txt" ]; then 

sed -i -e 's/^## //' ./"$baseName"/equation_$CHOICE.txt

touch ./"$baseName"/equation_new_$CHOICE.txt

cp ./"$baseName"/equation_$CHOICE.txt ./"$baseName"/equation_new_$CHOICE.txt

"C:\balcon\balcon.exe" -f ./"$baseName"/equation_new_$CHOICE.txt -n "$name" -s 1 -v 100 -fr 22 -bt 16 -ch 1 -w ./"$baseName"/equation_$CHOICE.wav 2> /dev/null

perl -pi -e 's/(equation_'$CHOICE'">.*\n)/$1<\/textarea><\/p>\n<p>\n<audio controls>\n<source src=".\/equation_'$CHOICE'.wav" type="audio\/wav">\n <\/audio>\n<\/p>/' ./"$baseName"/math_equations.html

sed -i -e 's/^/%% /g' ./"$baseName"/equation_new_$CHOICE.txt

cp ./"$baseName"/equation_new_$CHOICE.txt ./pronunciation.txt

awk '
    /^%%/{                   
        getline <"./pronunciation.txt" 
    }
    1                      
    ' ./"$baseName"/math_equations.html > tmp && mv tmp ./"$baseName"/math_equations.html

sed -i 's/^\(%% \)*//g'	./"$baseName"/math_equations.html

rm ./pronunciation.txt

echo -ne '\n'

echo -e "Refresh MS Edge browser (CTRL +R) to hear the pronuncation of $(echo -e "\033[1;44mequation $CHOICE\033[0m\x1B[49m\x1B[K")."

fi

}

function equation_pronunciation {

echo -ne '\n'

read -p "Enter the correct pronunciation for $(echo -e "\033[1;44mequation $CHOICE\033[0m\x1B[49m\x1B[K"):" value

echo "$value" > ./"$baseName"/equation_new_$CHOICE.txt

"C:\balcon\balcon.exe" -f ./"$baseName"/equation_new_$CHOICE.txt -n "$name" -s 1 -v 100 -fr 22 -bt 16 -ch 1 -w ./"$baseName"/equation_$CHOICE.wav 2> /dev/null

perl -pi -e 's|(id="equation_'$CHOICE'">)(.*\n)|$1\n%%\n|g' ./"$baseName"/math_equations.html

perl -pi -e 's|^%%.*|%% |g' ./"$baseName"/math_equations.html

sed -i -e 's/^/%% /g' ./"$baseName"/equation_new_$CHOICE.txt

cp ./"$baseName"/equation_new_$CHOICE.txt ./pronunciation.txt

awk '
    /^%%/{                   
        getline <"./pronunciation.txt" 
    }
    1                      
    ' ./"$baseName"/math_equations.html > tmp && mv tmp ./"$baseName"/math_equations.html

sed -i 's/^\(%% \)*//g'	./"$baseName"/math_equations.html

perl -pi -e 's|(id="equation_'$CHOICE'">.*)(\n)|$1|g' ./"$baseName"/math_equations.html

rm ./pronunciation.txt

echo -ne '\n'

echo -ne "Pronunciation for $(echo -e "\033[1;44mequation $CHOICE\033[0m\x1B[49m\x1B[K") changed. Refresh MS Edge browser (CTRL +R) to see and hear changes."

echo -ne '\n\n'

}

while :; do

	read -p "Enter the equation number $(echo -e "\033[1;44m(1-$MAX)\033[0m\x1B[49m\x1B[K"), or $(echo -e "\033[1;44mq\033[0m\x1B[49m\x1B[K") to exit:" CHOICE
    
	if [[ "$CHOICE" == "q" ]] ; then
	
	break;
	
	fi;
	
	if [[ "$CHOICE" -le "$MAX" ]] ; then
	
	alt_text_math
	
	equation_pronunciation
	
	else
	
	echo -e "\n\033[1;31mError: Invalid number\033[0m "$CHOICE". \033[1;31mYou must enter a number between\033[0m 1 \033[1;31mand\033[0m" $MAX"\033[1;31m.\033[0m\n"
	
	fi;
	
	done
	
	echo -ne '\n'

fi

touch ./"$baseName"/all.txt

counter_math=1
for x in ./"$baseName"/equation_*.txt; do

        basePath=${x%.*}
        Name=${basePath##*/}

if [ -f ./"$baseName"/equation_new_$counter_math.txt ]; then

perl -pi -e 's|^%% ||g' ./"$baseName"/equation_new_$counter_math.txt

cat ./"$baseName"/equation_new_$counter_math.txt > ./"$baseName"/equation_$counter_math.txt		
		
fi

if [ -f ./"$baseName"/equation_$counter_math.txt ]; then	

cat ./"$baseName"/equation_$counter_math.txt >> ./"$baseName"/all.txt

fi

counter_math=$[ $counter_math + 1 ] ; 
done

rm ./"$baseName"/equation_*.txt
sed -i -e 's/^/@@ /' ./"$baseName"/all.txt 
mv ./"$baseName"/all.txt ./"$baseName"/display-log2.txt
rm ./"$baseName"/math_equations.html

while true; do

read -n1 -p "Would you like to perform find and replace functions for the alternative text of math equations in $(echo -e "\033[1;44m$baseName.mp3\033[0m\x1B[49m\x1B[K")? [Y/N]?" answer

case $answer in
Y | y) 
	   echo -e "\n"
	   replace_correct=on
	   break
	   ;;
	   
N | n) 
	   echo -e "\n"
	   replace_correct=off
	   break
	   ;;	
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n].\033[0m\n"
	   ;;

	   
esac

done

function replace_pronunciation {

while :; do

	read -p "Enter the word(s) that you wish to replace (type q and press Enter to exit):" find
	
	if [[ "$find" == "q" ]] ; then
	
	break;
	
	fi;

	echo -e "\n"

read -p "Enter the word(s) that you wish to use instead of $(echo -e "\033[1;44m$find\033[0m\x1B[49m\x1B[K") (press enter to replace with NOTHING):" replace

sed -i "s/$find/$replace/gI" ./"$baseName"/display-log2.txt

if [[ ! $replace ]] ; then

echo -e "\n\033[1;44m$find\033[0m\x1B[49m\x1B[K removed.\n"

else 

echo -e "\n\033[1;44m$find\033[0m\x1B[49m\x1B[K changed to \033[1;44m$replace\033[0m\x1B[49m\x1B[K.\n"

fi
	
done

echo -e "\n"

}

if [[ "$replace_correct" == "on" ]]; then 

replace_pronunciation

fi

# End New in 0.2.0

else

count=1
while IFS="" read -r p || [ -n "$p" ] ; do echo -ne "Processing equations... \033[1;33m$count\033[0m\r" ; tex2svg "$p" | sed -n 's/.*1-Title">//p' >> ./"$baseName"/display-log2.txt  ; count=$[ $count + 1 ] ; done <./"$baseName"/display-log.txt 

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

### Add More Corrections Here #####

# 

sed -i '/@@/s/\ quotation-mark//g' ./"$baseName"/display-log2.txt 

sed -i '/@@/s/\ slash/\ divided by/g' ./"$baseName"/display-log2.txt 

sed -i '/@@/s/ percent-sign/ percent/g' ./"$baseName"/display-log2.txt 

sed -i '/@@/s/ StartFraction/ /g' ./"$baseName"/display-log2.txt 

sed -i '/@@/s/ EndFraction/ /g' ./"$baseName"/display-log2.txt 

sed -i '/@@/s/ upper/ /g' ./"$baseName"/display-log2.txt 

sed -i '/@@/s/ left-parenthesis/ /g' ./"$baseName"/display-log2.txt 

sed -i '/@@/s/ right-parenthesis/ /g' ./"$baseName"/display-log2.txt 

sed -i '/@@/s/ right-parenthesis/ /g' ./"$baseName"/display-log2.txt 

#

fi

##################

# Insert equations into txt file

# Replace display equations with lines from display-log2.txt

mv ./"$baseName"/display-log2.txt ./

awk '
    /^@@/{                   
        getline <"./display-log2.txt" 
    }
    1                      
    ' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
       
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

#

if [[ "$nounphrase" == "on" ]]; then 

#echo -e "\rCollecting the proper nouns...\r"

cp ./"$baseName"/"$baseName".txt ./noun_phrases_raw.txt

# Remove XML tags for headings if present

sed -i 's/<heading1>//g' ./noun_phrases_raw.txt
sed -i 's/<heading2>//g' ./noun_phrases_raw.txt
sed -i 's/<heading3>//g' ./noun_phrases_raw.txt
sed -i 's/<heading4>//g' ./noun_phrases_raw.txt
sed -i 's/<heading5>//g' ./noun_phrases_raw.txt
sed -i 's/<\/heading1>//g' ./noun_phrases_raw.txt
sed -i 's/<\/heading2>//g' ./noun_phrases_raw.txt
sed -i 's/<\/heading3>//g' ./noun_phrases_raw.txt
sed -i 's/<\/heading4>//g' ./noun_phrases_raw.txt
sed -i 's/<\/heading5>//g' ./noun_phrases_raw.txt

sed -i 's/<line>//g' ./noun_phrases_raw.txt
sed -i 's/<\/line>//g' ./noun_phrases_raw.txt

sed -i 's/<page>//g' ./noun_phrases_raw.txt
sed -i 's/<\/page>//g' ./noun_phrases_raw.txt

# Remove XML tags for secondary text regions if present

sed -i 's/<secondary>//g' ./noun_phrases_raw.txt

sed -i 's/<\/secondary>//g' ./noun_phrases_raw.txt

# Remove XML tags for footnote text regions if present

sed -i 's/<footnote>//g' ./noun_phrases_raw.txt

sed -i 's/<\/footnote>//g' ./noun_phrases_raw.txt

# Remove XML tags for figcaption text regions if present

sed -i 's/<figcaption>//g' ./noun_phrases_raw.txt

sed -i 's/<\/figcaption>//g' ./noun_phrases_raw.txt

# Remove XML tags for Description text regions if present

sed -i 's/<description>//g' ./noun_phrases_raw.txt

sed -i 's/<\/description>//g' ./noun_phrases_raw.txt

# Remove XML tags for Description text regions if present

sed -i 's/<table>//g' ./noun_phrases_raw.txt

sed -i 's/<\/table>//g' ./noun_phrases_raw.txt

# Remove XML tags for Footer text regions if present

sed -i 's/<footer>//g' ./noun_phrases_raw.txt

sed -i 's/<\/footer>//g' ./noun_phrases_raw.txt

sed -i 's/ \[ //g' ./noun_phrases_raw.txt

sed -i 's/\[ //g' ./noun_phrases_raw.txt

sed -i 's/ \[//g' ./noun_phrases_raw.txt

sed -i 's/\[//g' ./noun_phrases_raw.txt

sed -i 's/ \] //g' ./noun_phrases_raw.txt

sed -i 's/ \]//g' ./noun_phrases_raw.txt

sed -i 's/\] //g' ./noun_phrases_raw.txt

sed -i 's/\]//g' ./noun_phrases_raw.txt

python "C:\scripts\noun_phrases.py"

rm ./noun_phrases_raw.txt

mv ./Noun_Phrases.txt ./"$baseName"/

perl -pi -e 's/,/\n/g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/ =+//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/\^\d+\^//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/'\\\\'.*//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/.*footnote begin.*\n//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/.*footnote end.*\n//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/\* //g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e "s/.*\'\*.*\n//g" ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/}//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/{//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e "s/'//g" ./"$baseName"/Noun_Phrases.txt

perl -pi -e "s/\"//g" ./"$baseName"/Noun_Phrases.txt

perl -pi -e "s/[a-z]\n//g" ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/[^\x0-\xB1]//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/^\:.*\n//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/^a:.*\n//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/^x:.*\n//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/^\^:.*\n//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/^\+:.*\n//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/^x \+:.*\n//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/^<:.*\n//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/^>:.*\n//g' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/.*page.*\n//g' ./"$baseName"/Noun_Phrases.txt

sed -i '/^\s*$/d' ./"$baseName"/Noun_Phrases.txt

perl -pi -e 's/^\s+//' ./"$baseName"/Noun_Phrases.txt

# Create HTML document

cp ./"$baseName"/Noun_Phrases.txt ./"$baseName"/Noun_Phrases_word.txt

cp ./"$baseName"/Noun_Phrases.txt ./"$baseName"/Noun_Phrases_number.txt

wc -l ./"$baseName"/Noun_Phrases.txt | sed 's/ .*//g' > ./"$baseName"/numbers.txt

noun_phrase_max=`cat ./"$baseName"/numbers.txt`

perl -pi -e 's/:.*\n/\n/g' ./"$baseName"/Noun_Phrases_word.txt

perl -pi -e 's/: \d//g' ./"$baseName"/Noun_Phrases_word.txt

perl -pi -e 's/.*://g' ./"$baseName"/Noun_Phrases_number.txt

touch ./"$baseName"/noun_phrases.html

echo -e "<!DOCTYPE html>\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en">\n<head>\n<title>"$baseName" - Review Proper Nouns</title>\n<style>\n</style>\n</head>\n<body>\n<main>\n<h1>"$baseName" - Review Proper Nouns</h1>" | cat - ./"$baseName"/noun_phrases.html > temp && mv temp ./"$baseName"/noun_phrases.html

noun_phrase_max=$[ $noun_phrase_max + 1 ] ;

COUNTER=1
eval MAX=$noun_phrase_max

while (( $COUNTER <= $MAX )); do
        echo -e "<div>\n<h2>"$COUNTER"</h2>\n<code id=\"phrase_"$COUNTER"\"> \n@@\n</code></p>\n</div>" >> ./"$baseName"/noun_phrases.html
        let COUNTER=$COUNTER+1
done

echo -e "</main>\n<footer>\n<p role=\"contentinfo\">This document was created by the Alternative Media Unit of the Disabled Students' Program at UC Berkeley. For questions or concerns about this document, please contact us at dspamc@berkeley.edu.</p>\n</footer>\n</main>\n</body>\n</html>" >> ./"$baseName"/noun_phrases.html

perl -pi -e 's/<\/h2>/<\/h2>\n<p><code>\n##\n<\/code>/g' ./"$baseName"/noun_phrases.html

sed -i -e 's/^/## /g' ./"$baseName"/Noun_Phrases_word.txt

sed -i -e 's/^/@@ /g' ./"$baseName"/Noun_Phrases_number.txt

mv ./"$baseName"/Noun_Phrases_word.txt ./

mv ./"$baseName"/Noun_Phrases_number.txt ./


awk '
    /^@@/{                   
        getline <"./Noun_Phrases_number.txt" 
    }
    1                      
    ' ./"$baseName"/noun_phrases.html > tmp && mv tmp ./"$baseName"/noun_phrases.html
	
awk '
    /^##/{                   
        getline <"./Noun_Phrases_word.txt" 
    }
    1                      
    ' ./"$baseName"/noun_phrases.html > tmp && mv tmp ./"$baseName"/noun_phrases.html

mv ./Noun_Phrases_word.txt ./"$baseName"/

rm ./Noun_Phrases_number.txt

sed -i 's/^\(## \)*//g' ./"$baseName"/noun_phrases.html

sed -i 's/^\(@@ \)*//g'	./"$baseName"/noun_phrases.html

perl -pi -e 's/<style>/<style>\ncode {\nbackground: #f4f4f4;background: #f4f4f4;\n}\n/g' ./"$baseName"/noun_phrases.html

perl -pi -e 's/<style>/<style>\n.non-code {\nbackground-color: #FFFFFF;\n}\n/g' ./"$baseName"/noun_phrases.html

perl -pi -e 's/<style>/<style>\nh2 {\ncolor:blue;;\n}\n/g' ./"$baseName"/noun_phrases.html

perl -pi -e 's/(id="noun_phrase_.*)(\n)/$1/g' ./"$baseName"/noun_phrases.html

sed -zi 's/\n<\/code><\/p>/<\/code><\/p>/g' ./"$baseName"/noun_phrases.html

perl -pi -e 's/(phrase_)(.*)(\n)/$1$2/g' ./"$baseName"/noun_phrases.html

sed -i 's/^\(@@ \)*//g' ./"$baseName"/Noun_Phrases_word.txt

awk '{filename = sprintf("phrase_%d.txt", NR); print >filename; close(filename)}' ./"$baseName"/Noun_Phrases_word.txt

mv ./phrase_*.txt ./"$baseName"/ 

rm ./"$baseName"/Noun_Phrases.txt
	
echo -ne 'Opening MS Edge...'

echo -ne '\n\n'

cwd=$(pwd)

start msedge "$cwd/$baseName/noun_phrases.html"

while true; do

read -n1 -p "Would you like to check the pronunciation of proper nouns in $(echo -e "\033[1;44m$baseName.mp3\033[0m\x1B[49m\x1B[K")? [Y/N]?" answer

case $answer in
Y | y) 
	   echo -e "\n"
	   correct=on
	   break
	   ;;
	   
N | n) 
	   echo -e "\n"
	   correct=off
	   break
	   ;;	
	*)
	   echo -e "\n"
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ y / n].\033[0m\n"
	   ;;

	   
esac

done

if [[ "$correct" == "on" ]]; then 

function generate_UPS_prounciation {

if [ ! -f  "./$baseName/phrase_new_$CHOICE.txt" ]; then 

sed -i -e 's/^## //' ./"$baseName"/phrase_$CHOICE.txt

python "C:\scripts\lexconvert.py" --phones sapi < ./"$baseName"/phrase_$CHOICE.txt > ./"$baseName"/phrase_new_$CHOICE.txt

"C:\balcon\balcon.exe" -f ./"$baseName"/phrase_new_$CHOICE.txt -n "$name" -s 1 -v 100 -fr 22 -bt 16 -ch 1 -w ./"$baseName"/phrase_$CHOICE.wav 2> /dev/null

perl -pi -e 's/(_'$CHOICE'">)(.*)(<\/p>)/$1$2$3\n<p>\n<audio controls>\n<source src=".\/phrase_'$CHOICE'.wav" type="audio\/wav">\n <\/audio>\n<\/p>/g' ./"$baseName"/noun_phrases.html

sed -i -e 's/^/%% /g' ./"$baseName"/phrase_new_$CHOICE.txt

perl -pi -e 's/(_'$CHOICE'\">)(.*)(<\/p>)/$1$2$3\n<p><textarea id=\"pronunciation_'$CHOICE'\" style=\"border:none;\">\n%%\n<\/textarea><\/p>/g' ./"$baseName"/noun_phrases.html

cp ./"$baseName"/phrase_new_$CHOICE.txt ./pronunciation.txt

awk '
    /^%%/{                   
        getline <"./pronunciation.txt" 
    }
    1                      
    ' ./"$baseName"/noun_phrases.html > tmp && mv tmp ./"$baseName"/noun_phrases.html

sed -i 's/^\(%% \)*//g'	./"$baseName"/noun_phrases.html

rm ./pronunciation.txt

echo -ne '\n'

echo -e "Refresh MS Edge browser (CTRL +R) to hear the pronuncation of $(echo -e "\033[1;44mproper noun $CHOICE\033[0m\x1B[49m\x1B[K")."

fi

}

function noun_phrase_pronunciation {

echo -ne '\n'

read -p "Enter the correct pronunciation for $(echo -e "\033[1;44mproper noun $CHOICE\033[0m\x1B[49m\x1B[K"):" value

echo "$value" > ./"$baseName"/phrase_new_$CHOICE.txt

"C:\balcon\balcon.exe" -f ./"$baseName"/phrase_new_$CHOICE.txt -n "$name" -s 1 -v 100 -fr 22 -bt 16 -ch 1 -w ./"$baseName"/phrase_$CHOICE.wav 2> /dev/null

perl -pi -e 's|(id="pronunciation_'$CHOICE'".*)(\n)|$1\n%%|g' ./"$baseName"/noun_phrases.html

perl -pi -e 's|^%%.*|%% |g' ./"$baseName"/noun_phrases.html

sed -i -e 's/^/%% /g' ./"$baseName"/phrase_new_$CHOICE.txt

cp ./"$baseName"/phrase_new_$CHOICE.txt ./pronunciation.txt

awk '
    /^%%/{                   
        getline <"./pronunciation.txt" 
    }
    1                      
    ' ./"$baseName"/noun_phrases.html > tmp && mv tmp ./"$baseName"/noun_phrases.html

sed -i 's/^\(%% \)*//g'	./"$baseName"/noun_phrases.html

rm ./pronunciation.txt

echo -ne '\n'

echo -ne "Pronunciation for $(echo -e "\033[1;44mproper noun $CHOICE\033[0m\x1B[49m\x1B[K") changed. Refresh MS Edge browser (CTRL +R) to see and hear changes."

echo -ne '\n\n'

}

while :; do

	read -p "Enter the proper noun number $(echo -e "\033[1;44m(1-$MAX)\033[0m\x1B[49m\x1B[K"), or $(echo -e "\033[1;44mq\033[0m\x1B[49m\x1B[K") to exit:" CHOICE
    
	if [[ "$CHOICE" == "q" ]] ; then
	
	break;
	
	fi;
	
	if [[ "$CHOICE" -le "$MAX" ]] ; then
	
	generate_UPS_prounciation

	noun_phrase_pronunciation

	else
	
	echo -e "\n\033[1;31mError: Invalid number\033[0m "$CHOICE". \033[1;31mYou must enter a number between\033[0m 1 \033[1;31mand\033[0m" $MAX"\033[1;31m.\033[0m\n"
	
	fi;
	
	done

	echo -ne '\n'

touch ./"$baseName"/phrases_all.txt

counter_phrase=1
for x in ./"$baseName"/phrase_*.txt; do

        basePath=${x%.*}
        Name=${basePath##*/}

if [ -f ./"$baseName"/phrase_new_$counter_phrase.txt ]; then
	
   sed -i -e 's/^/s\//' ./"$baseName"/phrase_$counter_phrase.txt
   
   sed -i -e 's/^/\//' ./"$baseName"/phrase_$counter_phrase.txt
   
   sed -i -e 's/%% /\//' ./"$baseName"/phrase_new_$counter_phrase.txt
	
   cat ./"$baseName"/phrase_new_$counter_phrase.txt >> ./"$baseName"/phrase_$counter_phrase.txt
   
   perl -pi -e 's/\n//g' ./"$baseName"/phrase_$counter_phrase.txt
   
   perl -pi -e 's/\/>/\\\/>/g' ./"$baseName"/phrase_$counter_phrase.txt
   
   perl -pi -e 's/\/>$/\/>\/gI/g' ./"$baseName"/phrase_$counter_phrase.txt
   
   perl -pi -e 's/\/s/s/' ./"$baseName"/phrase_$counter_phrase.txt
   
   rm ./"$baseName"/phrase_new_$counter_phrase.txt
   
   cat ./"$baseName"/phrase_$counter_phrase.txt >> ./"$baseName"/phrases_all.txt
   
   sed -i -e '$a\' ./"$baseName"/phrases_all.txt
   
fi

counter_phrase=$[ $counter_phrase + 1 ] ; 
done

mv ./"$baseName"/phrases_all.txt ./"$baseName"/phrases_all.sed
####

#rm ./"$baseName"/noun_phrases.html

fi

rm ./"$baseName"/phrase_*.txt

rm ./"$baseName"/noun_phrases.html

fi

#

### Count the number characters and decide whether to split

word_count="$(wc -l ./"$baseName"/"$baseName".txt | sed -r  's/^[^0-9]*([0-9]+).*/\1/')"

if (( $word_count > 70 )); 

then 

if grep -q '<page>' ./"$baseName"/"$baseName".txt ;

then

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

#

if [[ "$correct" == "on" ]]; then

sed -i -f ./"$baseName"/phrases_all.sed ./"$baseName"/"$baseName".txt

rm ./"$baseName"/phrases_all.sed

fi 

# 

if [[ "$split" == "on" ]]; then 

# Add a split tag before every pages

perl -0777 -pi -e 's/<page>/<page>\n/g' ./"$baseName"/"$baseName"_formatted.txt

####
	
if [[ "$textbook" == "long" ]]; then
	
	if [[ "$speed" -ge -10 && "$speed" -le -8 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%2==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge -7 && "$speed" -le -5 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%3==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge -4 && "$speed" -le -2 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%4==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge -1 && "$speed" -le 1 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%6==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 2 && "$speed" -le 4 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%7==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 5 && "$speed" -le 7 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%8==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 8 && "$speed" -le 10 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%9==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi

	fi

	if [[ "$textbook" == "short" ]]; then
	
		
	if [[ "$speed" -ge -10 && "$speed" -le -8 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%3==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge -7 && "$speed" -le -5 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%4==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge -4 && "$speed" -le -2 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%5==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge -1 && "$speed" -le 1 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%7==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 2 && "$speed" -le 4 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%8==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 5 && "$speed" -le 7 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%9==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 8 && "$speed" -le 10 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%10==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi

	fi

	if [[ "$novel" == "on" ]]; then

	if [[ "$speed" -ge -10 && "$speed" -le -8 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%5==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge -7 && "$speed" -le -5 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%6==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge -4 && "$speed" -le -2 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%7==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge -1 && "$speed" -le 1 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%11==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 2 && "$speed" -le 4 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%13==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 5 && "$speed" -le 7 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%15==0) $i="<split>"}1' ./"$baseName"/"$baseName"_formatted.txt > tmp && mv tmp ./"$baseName"/"$baseName"_formatted.txt
	
	fi
	
	if [[ "$speed" -ge 8 && "$speed" -le 10 ]]; then 
	
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

sed -i 's/<footer>//g' ./"$baseName"/"$baseName"_formatted.txt

sed -i 's/<\/footer>//g' ./"$baseName"/"$baseName"_formatted.txt

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

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
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
GRC | grc) 
	   language1=grc
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"grc"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###1\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage1="Ancient Greek"
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
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
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

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
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
GRC | grc) 
	   language2=grc
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"grc"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###2\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage2="Ancient Greek"
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
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
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

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
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
GRC | grc) 
	   language3=grc
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"grc"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###3\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage3="Ancient Greek"
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
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
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

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
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
GRC | grc) 
	   language4=grc
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"grc"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###4\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage4="Ancient Greek"
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
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
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

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
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
GRC | grc) 
	   language5=grc
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"grc"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###5\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage5="Ancient Greek"
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
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
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

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
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
GRC | grc) 
	   language6=grc
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"grc"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###6\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage6="Ancient Greek"
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
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
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

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
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
GRC | grc) 
	   language7=grc
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"grc"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###7\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage7="Ancient Greek"
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
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
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

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
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
GRC | grc) 
	   language8=grc
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"grc"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###8\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage8="Ancient Greek"
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
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
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

read -n5 -p "Please enter the two letter value to assign to this secondary language in $(echo -e "\033[1;35m"$baseName".docx\033[0m") [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ]." answer
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
GRC | grc) 
	   language9=grc
       echo -e "\n"
       echo -e "Value of \033[1;45m\033[1;39m"grc"\033[0m\033[0m assigned to \033[1;45m\033[1;39m###9\033[0m\033[0m in \033[1;35m"$baseName".docx\033[0m.\n"
       secondlanguage9="Ancient Greek"
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
       echo -e "\033[1;31mError: Invalid entry\033[0m "$answer". \033[1;31mYou must enter one of the following values: [ af / ar-sa / ar-eg / bg / ca / cs / da / de / de-at / de-ch / el / en-au / en-ca / en-gb / en-in / en-ie / en-us / es / es-mx / et / fa / fi / fr / fr-ca / fr-ch / grc / he / hi / hr / hu / id / it / ja / ko / la / lt / ms / nl / nl-be / no / pl / pt / pt-br / ro / ru / sk / sl / sv / ta / th / tr / vi / zh-cn / zh-hk / zh-tw / rm (REMOVE) ].\033[0m\n"
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

if [[ "$language1" == "grc" ]] || [[ "$language2" == "grc" ]] ||  [[ "$language3" == "grc" ]] ||  [[ "$language4" == "grc" ]] ||  [[ "$language5" == "grc" ]] ||  [[ "$language6" == "grc" ]] ||  [[ "$language7" == "grc" ]] ||  [[ "$language8" == "grc" ]] ||  [[ "$language9" == "grc" ]] ; then 

if ! "C:\balcon\balcon.exe" -l 2> /dev/null | grep -q -w 'Ancient' 2> /dev/null ; then

echo -e "\n\033[1;31mError: eSpeak NG - Greek Ancient voice not installed. Will not remove Ancient Greek text...\033[0m" >&2

if [[ "$language1" == "grc" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage1="Ancient Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###1/ {:a; $!N; s/###1.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language2" == "grc" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage2="Ancient Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###2/ {:a; $!N; s/###2.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language3" == "grc" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage3="Ancient Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###3/ {:a; $!N; s/###3.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language4" == "grc" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage4="Ancient Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###4/ {:a; $!N; s/###4.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language5" == "grc" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage5="Ancient Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###5/ {:a; $!N; s/###5.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language6" == "grc" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage6="Ancient Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###6/ {:a; $!N; s/###6.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language7" == "grc" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage7="Ancient Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###7/ {:a; $!N; s/###7.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language8" == "grc" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage8="Ancient Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###8/ {:a; $!N; s/###8.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

if [[ "$language9" == "grc" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName".txt

secondlanguage9="Ancient Greek - removed"

if [[ "$caption" == "on" ]]; then

sed -i '/###9/ {:a; $!N; s/###9.*%%%//; t; ba}' ./"$baseName"/"$baseName"_formatted.txt

fi

fi

fi

fi

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

sed -i 's/Microsoft grc/eSpeak-grc/g' ./"$baseName"/"$baseName".txt

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

# Reformatting the document for conversion

# Add an extra line after each new line

sed -i 's/$/\n/' ./"$baseName"/"$baseName".txt
	
# Put sentences on their own lines

perl '/c/scripts/sentence-boundary-original.pl' -d /c/scripts/HONORIFICS -i ./"$baseName"/"$baseName".txt -o ./"$baseName"/"$baseName"_segmented.txt

mv ./"$baseName"/"$baseName"_segmented.txt ./"$baseName"/"$baseName".txt

# Remove empty lines

perl -0777 -pi -e 's/(\n)(\n)/$1/g' ./"$baseName"/"$baseName".txt

# Convert file to MP3

	echo -ne "Converting \033[1;35m"$baseName".docx\033[0m to MP3...\r"

	if [[ "$split" == "on" ]]; then 
	
	perl -0777 -pi -e 's/<page>/<page>\n/g' ./"$baseName"/"$baseName".txt
	
	# awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%6==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	###
	
	if [[ "$textbook" == "long" ]]; then
	
	if [[ "$speed" -ge -10 && "$speed" -le -8 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%2==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge -7 && "$speed" -le -5 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%3==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge -4 && "$speed" -le -2 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%4==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge -1 && "$speed" -le 1 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%6==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 2 && "$speed" -le 4 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%7==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 5 && "$speed" -le 7 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%8==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 8 && "$speed" -le 10 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%9==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi

	fi

	if [[ "$textbook" == "short" ]]; then
	
		
	if [[ "$speed" -ge -10 && "$speed" -le -8 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%3==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge -7 && "$speed" -le -5 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%4==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge -4 && "$speed" -le -2 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%5==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge -1 && "$speed" -le 1 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%7==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 2 && "$speed" -le 4 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%8==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 5 && "$speed" -le 7 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%9==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 8 && "$speed" -le 10 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%10==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi

	fi

	if [[ "$novel" == "on" ]]; then

	if [[ "$speed" -ge -10 && "$speed" -le -8 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%5==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge -7 && "$speed" -le -5 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%6==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge -4 && "$speed" -le -2 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%7==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge -1 && "$speed" -le 1 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%11==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 2 && "$speed" -le 4 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%13==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 5 && "$speed" -le 7 ]]; then 
	
	awk '{for(i=1; i<=NF; i++) if($i=="<page>") if(++count%15==0) $i="<split>"}1' ./"$baseName"/"$baseName".txt > tmp && mv tmp ./"$baseName"/"$baseName".txt
	
	fi
	
	if [[ "$speed" -ge 8 && "$speed" -le 10 ]]; then 
	
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
	
	if [ -f ./headings.txt ]; then
	
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

	# Generate the MP3

		
		if [[ "$name" == @(Microsoft David Desktop|Microsoft Zira Desktop|Microsoft Elsa Desktop|Microsoft Hortense Desktop|Microsoft Hedda Desktop|Microsoft Helena Desktop|Microsoft Haruka Desktop|Microsoft Mark|Microsoft Hazel Desktop|Microsoft Huihui Desktop|Microsoft Irina Desktop|Microsoft Maria Desktop|Microsoft Paulina Desktop|Microsoft Sabina Desktop|Microsoft Tracy Desktop|Microsoft Naayf|Microsoft Hoda|Microsoft Ivan|Microsoft Herena|Microsoft Jakub|Microsoft Helle|Microsoft Michael|Microsoft Karsten|Microsoft Stefanos|Microsoft James|Microsoft Linda|Microsoft Ravi|Microsoft Sean|Microsoft Heidi|Microsoft Claude|Microsoft Guillaume|Microsoft Asaf|Microsoft Hemant|Microsoft Matej|Microsoft Andika|Microsoft Szabolcs|Microsoft Heami|Microsoft Rizwan|Microsoft Frank|Microsoft Bart|Microsoft Jon|Microsoft Helia|Microsoft Andrei|Microsoft Lado|Microsoft Bengt|Microsoft Valluvar|Microsoft Pattara|Microsoft Tolga|Microsoft An|Microsoft Zhiwei|IVONA \2 Joey|IVONA \2 Mathieu|IVONA \2 Miguel|IVONA \2 Giorgio|IVONA \2 Penélope|eSpeak-grc) ]]; then
		
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
	
				# Add pitch change for table footer
	
	sed -i "s/\(<footer>\)\(.*\)/<silence msec='800'\/><pitch absmiddle='-5'>\2<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName"$count.txt
	
	sed -i 's/<\/footer>//g' ./"$baseName"/"$baseName"$count.txt
	
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
	
				# Add pitch change for table footer
	
	sed -i "s/\(<footer>\)\(.*\)/<silence msec='800'\/><pitch absmiddle='-5'>\2<\/pitch><silence msec='800'\/>/g" ./"$baseName"/"$baseName".txt
	
	sed -i 's/<\/footer>//g' ./"$baseName"/"$baseName".txt
	
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
	
		"C:\balcon\balcon.exe" -f ./"$baseName"/"$baseName"_$count.txt -n "$name" -s "$speed" -v 90 -fr 22 -bt 16 -ch 1 -w ./"$baseName"/"$baseName"_$count.wav 2>/dev/null |:
		
		lame -V 5 ./"$baseName"/"$baseName"_$count.wav ./"$baseName"/"$baseName"_$count.mp3  &>/dev/null
		
		rm ./"$baseName"/"$baseName"_$count.wav &>/dev/null
 
	count=$[ $count + 1 ] ; 
	done
	
	else
		
		"C:\balcon\balcon.exe" -f ./"$baseName"/"$baseName".txt -n "$name" -s "$speed" -v 90 -fr 22 -bt 16 -ch 1 -w ./"$baseName"/"$baseName".wav &>/dev/null 2>/dev/null |:
		
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
		
		lame --ti "C:\MP3 Cover\Default_Cover.jpg" ./"$baseName"/"$baseName"_$count.mp3 &>/dev/null
		
		rm ./"$baseName"/"$baseName"_$count.mp3
		
		mv ./"$baseName"/"$baseName"_$count.mp3.mp3 ./"$baseName"/"$baseName"_$count.mp3
 
		count=$[ $count + 1 ] ; 
		done
		
		else
		
		lame --ti "C:\MP3 Cover\Default_Cover.jpg" ./"$baseName"/"$baseName".mp3 &>/dev/null

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
		
		if [[ "$name" == @(Microsoft David Desktop|Microsoft Zira Desktop|Microsoft Hazel Desktop|Microsoft Mark|Microsoft James|Microsoft Linda|Microsoft Ravi|Microsoft Sean|IVONA \2 Joey) ]]; then
		
		lingua=eng
		
		fi 
		
		if [[ "$name" == @(Microsoft Elsa Desktop|IVONA \2 Giorgio) ]]; then
		
		lingua=ita
		
		fi 
		
		if [[ "$name" == @(Microsoft Hedda Desktop|Microsoft Michael|Microsoft Karsten) ]]; then
		
		lingua=deu
		
		fi 
		
		if [ "$name" == "Microsoft Haruka Desktop" ]; then
		
		lingua=jpn
		
		fi
		
		if [[ "$name" == @(Microsoft Helena Desktop|Microsoft Sabina Desktop|IVONA \2 Miguel|IVONA \2 Penélope) ]]; then
		
		lingua=spa
		
		fi 
		
		if [[ "$name" == @(Microsoft Hortense Desktop|Microsoft Claude|Microsoft Guillaume|IVONA \2 Mathieu) ]]; then
		
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
		
		if [[ "$name" == @(Microsoft Stefanos|eSpeak-grc) ]]; then
		
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
			
#
ffmpeg -i ./"$baseName"/"$baseName"_$count.mp3 2>&1 | sed -n -e 's/^  \(.*\)\(, start:\)\(.*\)$/\1/p' > ./"$baseName"/time_$count.txt

perl -pi -e 's/Duration: \d+://g' ./"$baseName"/time_$count.txt

perl -pi -e 's/:.*\n//g' ./"$baseName"/time_$count.txt

perl -pi -e 's/^0//g' ./"$baseName"/time_$count.txt

read -r firstline<./"$baseName"/time_$count.txt

if [[ "$firstline" -le 32 ]]; then
		
		
		# Create syncmap
		
		python -m aeneas.tools.execute_task ./"$baseName"/"$baseName"_$count.mp3 ./"$baseName"/"$baseName"_$count.txt "task_language=$lingua|task_adjust_boundary_nonspeech_min=1.000|task_adjust_boundary_nonspeech_string=REMOVE|is_text_file_ignore_regex=\[YzW\]|task_adjust_boundary_algorithm=percent|task_adjust_boundary_percent_value=75|is_text_type=subtitles|os_task_file_format=vtt" ./"$baseName"/"$baseName"_$count.vtt >/dev/null 2>&1
		
		grep -B 1 -A 3 'YzW' ./"$baseName"/"$baseName"_$count.vtt > ./"$baseName"/"$baseName"_$count.chapters.txt
		
		rm ./"$baseName"/time_$count.txt
		
		perl -0777 -pi -e 's/YzW(.*\n)//g' ./"$baseName"/"$baseName"_$count.vtt &> /dev/null
		
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
	
	perl -0777 -pi -e 's/00:00:00.000.*\n.*@@/00:00:00.000 /g' ./"$baseName"/"$baseName"_$count.chapters.txt
	
	rm ./headings$count.txt
			
	else

	echo -e "\n"$baseName"_"$count".mp3" > ./"$baseName"/time_$count.txt

	sed -i '/^$/d' ./"$baseName"/time_$count.txt
	
	rm ./"$baseName"/headings$count.txt
		
	fi
		
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
		
		ffmpeg -i ./"$baseName"/"$baseName".mp3 2>&1 | sed -n -e 's/^  \(.*\)\(, start:\)\(.*\)$/\1/p' > ./"$baseName"/time_1.txt

		perl -pi -e 's/Duration: \d+://g' ./"$baseName"/time_1.txt

		perl -pi -e 's/:.*\n//g' ./"$baseName"/time_1.txt
		
		perl -pi -e 's/^0//g' ./"$baseName"/time_1.txt

		read -r firstline<./"$baseName"/time_1.txt

		if [[ "$firstline" -le 32 ]]; then
		
		# Create syncmap
		
		python -m aeneas.tools.execute_task ./"$baseName"/"$baseName".mp3 ./"$baseName"/"$baseName".txt "task_language=$lingua|task_adjust_boundary_nonspeech_min=1.000|task_adjust_boundary_nonspeech_string=REMOVE|is_text_file_ignore_regex=\[YzW\]|task_adjust_boundary_algorithm=percent|task_adjust_boundary_percent_value=75|is_text_type=subtitles|os_task_file_format=vtt" ./"$baseName"/"$baseName".vtt &> /dev/null
		
		grep -B 1 -A 3 'YzW' ./"$baseName"/"$baseName".vtt > ./"$baseName"/"$baseName".chapters.txt
		
		rm ./"$baseName"/time_1.txt
		
		perl -0777 -pi -e 's/YzW(.*\n)//g' ./"$baseName"/"$baseName".vtt &> /dev/null
		
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
		
		perl -0777 -pi -e 's/00:00:00.000.*\n.*@@/00:00:00.000 /g' ./"$baseName"/"$baseName".chapters.txt
		
		else

		echo -e "\n"$baseName".mp3" > ./"$baseName"/time_1.txt

		sed -i '/^$/d' ./"$baseName"/time_1.txt
	
		rm ./"$baseName"/headings.txt
		
		fi
		
		if [ ! -f ./"$baseName"/"$baseName".vtt ];
		
		then
		
		echo -e "\033[1;33mATTENTION:\033[0m \033[1;35m"$baseName".mp3\033[0m is too long for a caption file to be generated:\n"
		
		ffmpeg -i ./"$baseName"/"$baseName".mp3 2>&1 | sed -n -e 's/^  \(.*\)\(, start:\)\(.*\)$/\1/p'
		
		echo -e "\nConsider breaking up \033[1;35m"$baseName".docx\033[0m into smaller chunks."
		
		else

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

	rm ./"$baseName"/"$baseName"_$count.chapters.txt &> /dev/null
	
 
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

#

if [ -f ./"$baseName"/time_*.txt ] ; then

cat ./"$baseName"/time_*.txt > ./"$baseName"/time_total.txt

time_total=`cat ./"$baseName"/time_total.txt`

echo -e "\n\033[1;33mATTENTION:\033[0m One or more files was longer than ~32 minutes:\n \033[1;35m"$time_total"\033[0m\n No bookmarks were added to this file(s)."

rm ./"$baseName"/time_*.txt

fi

#
	
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

# New in 0.2.0

find ./"$baseName"/ -type f -iname \*.txt -delete

#

exit 1
