#!/bin/bash
# Sample bash scripts - progress bar
# bash debugging
# -v verbose mode prints piut everything
# -x  
# set -x

echo "$0 starting.."
echo "argc = $#" 

VERSION_STRING="0.1.0"

VERSBOSE_MODE=0

# help screen 
help_screen() {
  echo "$0: progress bar"
  echo "options:"
  echo "h | --help          Help screen        "
  echo "v | --verbose       enable verbose mode"
  echo "V | --Version       version string     "
}

# command line processing
while [[ $# -gt 0 ]]
do
  case "$1" in
    -h|--help) 
      help_screen
      exit 0;;
    -v|--verbose)
      VERSBOSE_MODE=1
      ;;
    -V|--version)
      echo $VERSION_STRING
      exit 0;;
     *) 
      echo "[ERROR] $1 is not a valid option" 
      exit 1;;
  esac
  shift   
done

echo "Verbose Mode       $VERSBOSE_MODE  "

function ProgressBar {
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")
        # Progress : [########################################] 100%
        printf "\rProgress : [${_fill// /\#}${_empty// /-}] ${_progress}%%"
}

#ProgressBar 10 100
#ProgressBar 100 100

progress=1

while [ $progress -le 100 ] 
do
        ProgressBar ${progress} 100
        let progress=progress+1
        sleep 0.1
done