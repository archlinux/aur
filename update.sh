web=https://packages.debian.org
dist=`curl -LsS $web/src:linux\&exact=1|grep resultlink|sed 's/.*">//;s/<.*//'|tail -1`
url=$web/source/$dist/linux
_pkgver=`curl -sS $url|grep [0-9]-amd64-unsigned|sed s/.*linux-image-//\;s/-amd64.*//|sort -V|tail -1`
sed -i /^url=/s,=.*,=$url,\;/^_pkgver=/s/=.*/=$_pkgver/ PKGBUILD
for i in x86_64 aarch64;do
	arch=${i/x86_/amd};arch=${arch/arch/rm}
	for j in linux-{image-$_pkgver-$arch-unsigned,headers-$_pkgver-{$arch,common:all},kbuild-$_pkgver}
		do ((x++))
		[[ $i != x86_64 && ${j/*:} = all ]] && sha256sums=$sha256sums'\n\t'$(sed 's/\\n\\t/\n/g'<<<${sha256sums_x86_64/'\n\t'}|sed $x\!d) || {
			curl=`curl -sS $web/$dist/$arch/${j/:*}/download`
			[ $i = x86_64 ] && source=$source'\n\t'`grep ftp.debian.org<<<$curl|sed 's/">.*//;s,.*/,$_url/,'`
			sha256sums=$sha256sums'\n\t'`grep SHA256<<<$curl|sed 's/.*<tt>//;s/<.*//'`
		}
	done
	pkgver2=`cut -d_ -f3<<<$source|tr - _`
	sed -i "/^pkgver=/s/=.*/=$pkgver2/;/^source_x86_64=(/,/)/{s,(.*,($source),p;d};/^sha256sums_$i=(/,/)/{s/(.*/($sha256sums)/p;d}" PKGBUILD
	export sha256sums_$i=$sha256sums
	sha256sums= x=
done
. <(grep ^pkgver= PKGBUILD)
[ $pkgver = $pkgver2 ] || sed -i /^pkgrel=/s/=.*/=1/ PKGBUILD
sed s/%KVER%/$_pkgver-arm64/ linux.install>linux2.install
