# Maintainer: Kim Desrosiers <kimdesro at gmail dot com>
pkgname=unichrom
pkgver=5.1.7.249
pkgrel=1
pkgdesc="fully automated Chromatographic Data System,
dedicated to simplify hard, routine work of Chemist,
dealing in a field of Gas and Liquid Chromatography."
arch=("x86_64")
url="http://www.unichrom.com/chrom/ucdle.php"
license=('Commercial')
source=("http://www.unichrom.com/chrom/install/uc-5.1.7.249-x86_64-linux-r11657M.zip")
md5sums=("SKIP")


package() {
	cd "$srcdir"
	install -d "$pkgdir"/{opt/$pkgname,usr/bin}
	mv "$srcdir"/* "$pkgdir"/opt/$pkgname
	install -D -m644 "$pkgdir"//opt/$pkgname/nas-uc.desktop "$pkgdir"/usr/share/applications/nas-uc.desktop
}
