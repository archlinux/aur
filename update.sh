web=https://packages.debian.org
curl=`curl -LsS $web/src:linux\&exact=1`
pkgver=`echo "$curl"|grep resultlink|sed 's/.*: //;s/ .*//'|sort|tail -1`
dist=`echo "$curl"|grep resultlink.*$pkgver|sed 's/.*">//;s/<.*//'`
url=$web/source/$dist/linux
_pkgver=`curl -sS $url|grep [0-9]-amd64-unsigned|sed s/.*linux-image-//\;s/-amd64.*//|sort -V|tail -1`
sed -i /^url=/s,=.*,=$url,\;/^_pkgver=/s/=.*/=$_pkgver/ PKGBUILD
. <(grep ^pkgver= PKGBUILD)
for i in x86_64 aarch64
	do arch=${i/x86_/amd} arch=${arch/arch/rm} x=-1 sha256sums=
	for j in linux-{image-$_pkgver-$arch-unsigned,headers-$_pkgver-{$arch,common:all},kbuild-$_pkgver}
		do ((x++))
		[[ $i != x86_64 && ${j/*:} = all ]] && sha256sums=$sha256sums'\n\t'\${sha256sums_x86_64[$x]} || {
			curl=`curl -sS $web/$dist/$arch/${j/:*}/download`
			[ $i = x86_64 ] && source=$source'\n\t'`grep ftp.debian.org<<<$curl|sed 's/">.*//;s,.*/,$_url/,'`
			sha256sums=$sha256sums'\n\t'`grep SHA256<<<$curl|sed 's/.*<tt>//;s/<.*//'`
		}
	done
	pkgver2=`cut -d_ -f3<<<$source|tr - _`
	sed -i "/^pkgver=/s/=.*/=$pkgver2/`[ $pkgver = $pkgver2 ] || echo \;/^pkgrel=/s/=.*/=1/`;/^source_x86_64=(/,/)/{s,(.*,($source),p;d}
		/^sha256sums_$i=(/,/)/{s/(.*/($sha256sums)/p;d}" PKGBUILD
done
sed s/%KVER%/$_pkgver-arm64/ linux.install>linux2.install
