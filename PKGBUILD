# Maintainer: Giuseppe Sellaroli <g.sellaroli  at  yahoo  dot  it>
pkgname=scala-music-scales
pkgver=92
pkgrel=2
pkgdesc='Collection of scales designed for the Scala music software'
url='http://www.huygens-fokker.org/scala/'
optdepends=('scala-music')
arch=('any')
source=("http://www.huygens-fokker.org/docs/scales.zip")
md5sums=('2c646e41dcca700e33e37221db9f8fde')
install=$pkgname.install


package() {

	install -dm755 "${pkgdir}/opt/scala/scl"

	cd scl
	for f in *.scl
	do
		(tr -d '\r' < "$f") > "${pkgdir}/opt/scala/scl/$f"
	done
   
}

