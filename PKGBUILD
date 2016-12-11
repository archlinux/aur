# Maintainer: Jerry Jacques <jerry.jacques@free.f>
# Contributor: Jerry Jacques <jerry.jacques@free.f>
pkgname=tchathon
pkgver=6.58
pkgrel=1
pkgdesc="TChater et plus"
arch=(x86_64)
url="http://jerry.jacques.free.fr"
license=('GPL3')
depends=('python>=3.5', 'python-pyqt5>=5.5', 'python-psutil>=4.0')
optdepends=('python-pip: Pour rajouter des fonctionnalités au programme !')
replaces=()
install=
source=(http://jerry.jacques.free.fr/InstallerTchathonV6.tar.gz)
md5sums=('9e0372eccfdcc0f7fb1b6eb0fccd9318')

build() {
  return 0
  #cd $srcdir/$pkgname-$pkgver
}


package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
	cd "$srcdir"
	cp -R "./$pkgname/bin" "$pkgdir/usr/lib/$pkgname"
	cp "./$pkgname/README.txt" "$pkgdir/usr/lib/$pkgname"
	ln -s "$pkgdir/usr/lib/$pkgname/start.sh" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/lib/$pkgname/start.sh" 
    chmod +x "$pkgdir/usr/bin/"
	return 0
}
 
