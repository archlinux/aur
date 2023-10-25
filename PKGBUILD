# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=mounter_elite
pkgver=1.0
pkgrel=1
pkgdesc='Minimal dependancy bash based ISO mounter and converter'
arch=('any')
url='https://github.com/siyia2/Aur/blob/main/mounter_elite'
license=('GPL3')
depends=('sh')
optdepends=('ccd2iso')
source=("https://github.com/siyia2/Aur/blob/main/mounter_elite")
sha256sums=('67729cd60f2e28e5cea876421f7567080acbda2360571fbfefef270c5b218d66')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin
	install mounter_elite $pkgdir/usr/bin/$pkgname
}

