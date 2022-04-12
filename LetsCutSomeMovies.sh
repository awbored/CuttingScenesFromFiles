#!/bin/bash

### Universal Variables
dimensions="1920x1080"
slep=180 # Seconds to rest between encodes

### Checking if export and Movies directory exists and creating if not
MOVdir="./Movies"
if [ ! -d "$MOVdir" ]
  echo "Creating directory ${MOVdir}.  Place your source videos here."
  then mkdir $MOVdir
  sleep 3
fi

EXPdir="./export"
if [ ! -d "$EXPdir" ]
  echo "Creating directory ${EXPdir}.  This folder will have finished videos."
  then mkdir $EXPdir
  sleep 3
fi

### CSV input
csvInput="./MovieList.csv" # HEADERS: NUM	MOV	SCENESTART	SCENEEND	SCENELENGTH	NEWMOVName


### Meat and Potatoes
while IFS=',' read -r NUM	MOV	SCENESTART	SCENEEND	SCENELENGTH	NEWMOVName
  do

    if [ ! -f "./${MOVdir}/${MOV}" ]
      then echo "${MOV} does not exist.  Moving on." && continue
    fi

    if [ -f "./${EXPdir}/${NEWMOVName}.mp4" ]
      then echo "${NEWMOVName} already exists.  Moving on." && continue
    fi

    ### Text header for those watching
    echo ""
    echo "NUM is $NUM"
    echo "MOV is $MOV"
    echo "Scene Start is $SCENESTART"
    echo "Scene Length is $SCENELENGTH"
    echo "New file will be $NEWMOVName"
    echo ""
    sleep 3

    ## FFMPEG encoding
    ffmpeg -ss $SCENESTART -t $SCENELENGTH -i ./${MOVdir}/"${MOV}" -s $dimensions \
      -codec:a copy ${EXPdir}/"${NEWMOVName}".mp4 < /dev/null # copy -an (to remove audio)

    ## Sleep to allow processor to cool down between encodes
    echo "Resting for $slep seconds"
    sleep ${slep}

done < $csvInput
