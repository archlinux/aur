#!/bin/bash

outDir=${1:-''}
if [[ $outDir == '' ]]; then
  echo "Give Output Directory"
  exit 1
fi

for mdInFile in Tutorial*.md; do

  mkdir -p ${outDir}

  htmlOutFile=$(basename ${mdInFile} .md)".html"
  echo "Processing ${mdInFile} -> ${htmlOutFile}"
cat <<EOF > ${outDir}/${htmlOutFile}
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>${mdInFile}</title>
    <link href="default.css" type="text/css" rel="stylesheet" />
  </head>
  <body>
EOF

markdown -f +fencedcode ${mdInFile} >> ${outDir}/${htmlOutFile}

cat <<EOF >> ${outDir}/${htmlOutFile}
  </body>
</html>
EOF

sed -i -E 's/href="Tutorial(.+?)"/href="Tutorial\1.html"/g' ${outDir}/${htmlOutFile}

done
