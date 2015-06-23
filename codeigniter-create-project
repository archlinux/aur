#!/bin/bash

function help() {
cat << EOF
Usage: $0 html_path app_path
html_path: directory, where your CodeIgniter's index.php is (e.g. ~/public_html/ci)
app_path: directory, where your CodeIgniter programs are (e.g. ~/programs/CI)
EOF
}

if [ $# -ne 2 ]; then
    help
    exit 1
fi

WEBDIR=$(realpath $1)
APPDIR=$(realpath $2)
CI_DIR=/usr/share/pear/codeigniter

echo "Create web-directory ($WEBDIR)"
install -d $WEBDIR || exit 1
echo "Copy index.php to $WEBDIR"
install $CI_DIR/index.php $WEBDIR || exit 1
sed -i "s@\$application_folder.*=.*@\$application_folder = \"$APPDIR\";@" $WEBDIR/index.php || exit 1
sed -i "59 s@\$system_path.*=.*@\$system_path = \"$CI_DIR/system\";@" $WEBDIR/index.php || exit 1

echo "Create main app directory ($APPDIR)"
install -d $APPDIR || exit 1
echo "Creating directories to app directory"
for dir in cache config controllers core errors helpers hooks language libraries logs models third_party views; do
    install -d $APPDIR/$dir || exit 1
    [ -d $CI_DIR/application/$dir ] && (cp -r -n $CI_DIR/application/$dir/* $APPDIR/$dir || exit 1)
done

echo Installation done.

