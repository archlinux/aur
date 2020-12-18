# Maintainer: Giuseppe Sellaroli <g.sellaroli  at  yahoo  dot  it>
pkgname=scala-music-scales
pkgver=90
pkgrel=1
pkgdesc='Collection of scales to be used with the Scala music software'
url='http://www.huygens-fokker.org/scala/'
arch=('any')
source=("http://www.huygens-fokker.org/docs/scales.zip")
depends=('scala-music')
md5sums=('529136bbbf911912fb3619e87b97cdb8')
install=$pkgname.install


package() {

	install -dm755 "${pkgdir}/opt/scala/scl"

	cd scl
	for f in *.scl
	do
		(tr -d '\r' < "$f") > "${pkgdir}/opt/scala/scl/$f"
	done
   
}

