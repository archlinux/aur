# Maintainer: Giuseppe Sellaroli <g.sellaroli  at  yahoo  dot  it>
pkgname=scala-music-scales
pkgver=89
pkgrel=1
pkgdesc='Collection of scales to be used with the Scala music software'
url='http://www.huygens-fokker.org/scala/'
arch=('any')
source=("http://www.huygens-fokker.org/docs/scales.zip")
depends=('scala-music')
md5sums=('f683e27256f1d6baca0dc4c1bf2364f0')
install=$pkgname.install


package() {

	install -dm755 "${pkgdir}/opt/scala/scl"

	cd scl
	for f in *.scl
	do
		(tr -d '\r' < "$f") > "${pkgdir}/opt/scala/scl/$f"
	done
   
}

