# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=mounter_elite
pkgver=1.0
pkgrel=1
pkgdesc='A minimal dependancy bash based, ISO mounter and converter'
arch=('any')
url="https://github.com/siyia2/Aur/blob/main/mounter_elite.tar.gz"
license=('GPL3')
depends=('sh')
optdepends=('ccd2iso')
source=("https://github.com/siyia2/Aur/blob/main/mounter_elite.tar.gz")


package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin
	install mounter_elite.tar.gz $pkgdir/usr/bin/$pkgname
}

md5sums=('SKIP')
