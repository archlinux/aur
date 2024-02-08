web=https://packages.debian.org
dist=`curl -LsS $web/src:linux\&exact=1|grep resultlink|sed 's/.*">//;s/<.*//'|tail -1`
url=$web/source/$dist/linux
pkgver=`curl -sS $url|grep [0-9]-amd64-unsigned|sed s/.*linux-image-//\;s/-amd64.*//|sort -V|tail -1`
sed -i /^url=/s,=.*,=$url,\;/^_pkgver=/s/=.*/=$pkgver/ PKGBUILD
for i in x86_64 aarch64;do
	arch=${i/x86_/amd};arch=${arch/arch/rm}
	for j in linux-{image-$pkgver-$arch-unsigned,headers-$pkgver-{$arch,common:all},kbuild-$pkgver}
		do ((x++))
		[[ $i != x86_64 && ${j/*:} = all ]] && sha256sums=$sha256sums'\n\t'$(echo ${sha256sums_x86_64/'\n\t'}|sed 's/\\n\\t/\n/g'|sed $x\!d) || {
			curl=`curl -sS $web/$dist/$arch/${j/:*}/download`
			[ $i = x86_64 ] && source=$source'\n\t'`echo "$curl"|grep ftp.debian.org|sed 's/">.*//;s,.*/,$_url/,'`
			sha256sums=$sha256sums'\n\t'`echo "$curl"|grep SHA256|sed 's/.*<tt>//;s/<.*//'`
		}
	done
	sed -i "/^source_x86_64=(/,/)/{s,(.*,($source),p;d};/^sha256sums_$i=(/,/)/{s/(.*/($sha256sums)/p;d}" PKGBUILD
	export sha256sums_$i=$sha256sums
	sha256sums= x=
done
sed s/%KVER%/$pkgver-arm64/ linux.install>linux2.install
