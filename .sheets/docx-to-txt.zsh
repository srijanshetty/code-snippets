#!/usr/bin/zsh -e

for file in ls *.docx; do
    filename=$(echo $file | sed 's/.docx//')
    unzip -p $file word/document.xml | sed -e 's/<[^>]\{1,\}>//g; s/[^[:print:]]\{1,\}//g' > ${filename}.txt
done
