links=$(sed -e "s|github.com|raw.fastgit.org|g" -e "s|/blob||g" $1)
echo $links
wget -c -q $links
