##################################
# Please run this script as root #
##################################

tar -xzvf source.gz
cd ./src-vendor/ee/1.5.2
sed -i 's/SIGUNUSED/24/g' ee.c
make
make install
