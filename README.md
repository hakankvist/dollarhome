# dollarhome
My configuration files and list of good commands to remember.
Feel free to be inspired

# Jpeg images
## Scaling down
Reduce resolution by 50% and store in sub directory:
     for i in $(*.JPG); do djpeg -scale 1&2|cjpeg > outdir/$i; done
## Rename according to EXIF timestamp
    exiftool -ext jpg '-FileName<CreateDate' -d %Y_%m_%d__%H_%M_%S%%-c.%%e .

# PDF manipulation
## Create booklet
Assuming that margin is included in the original documnent.
    pdfbook2 --inner-margin=0 --paper=a4papper pdf_file.pdf

# Video manipulation
## Remove audio and speed up the video
    ffmpeg -i ../MOV_0533.mp4 -filter:v setpts=0.5*PTS -an MOV_0533.mp4

# codepage conversion
iconv -f ISO-8859-1 -t UTF8 create_list.pl  -o create_list2.pl

