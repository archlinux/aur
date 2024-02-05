_curl(){ curl -LsS --retry 3 https://packages.ubuntu.com/$1;}
dist=`_curl gcc-9\&exact=1|grep resultlink|cut -d\" -f2|tail -1`
pkgver=`_curl $dist/gcc-9|grep Package:|sed 's/.*(//;s/)//'`
sha256sums=`for i in cpp-9 gcc-9 libgcc-9-dev g++-9 libstdc++-9-dev gfortran-9
	do _curl $dist/amd64/$i/download|grep SHA256;done|sed 's/.*<tt>/\\\n\t/;s/<.*//'|tr -d '\n'`
sed -i "/^_dist=/s/=.*/=$dist/;/^_pkgver=/s/=.*/=$pkgver/;/^sha256sums_x86_64=(/,/)/{s/(.*/($sha256sums)/p;d}" PKGBUILD
