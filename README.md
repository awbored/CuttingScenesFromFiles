# CuttingScenesFromFiles
ffmpeg script to serial cut large video files into smaller chunks

Requirements
 - ffmpeg
 - bash/linux terminal
 - OpenOffice

I'm mainly backing this up here, since it's a linux bash script.

I may eventually update to Python (meh?!)

Steps:
1. Run LetsCutSomeMovies.sh once to create folders (Make executable if needed: 'chmod +x LetsCutSomeMovies.sh')
2. Drop movie files into ./Movies
3. Update ods file with file name, start and end times of desired portion of video to clip.
4. Do not update Columns A, E, F
5. Save file as csv
6. Run script

To keep the CPU from overheating, I have a 3 minute timer in between each encode.
