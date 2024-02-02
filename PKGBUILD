# Maintainer: Leon G <mail+aur at leongr.nl>
pkgname=rascal
pkgver=0.33.8
pkgrel=1
pkgdesc='The one-stop shop for metaprogramming'
arch=('any')
url='https://www.rascal-mpl.org'
license=('BSD' 'EPL')
depends=('java-runtime-headless' 'sh')
makedepends=()
checkdepends=()
optdepends=()
source=("https://update.rascal-mpl.org/console/$pkgname-$pkgver.jar" 'rascal.sh')
sha512sums=('cb3794584de095f310fcdee1b5b5039f258936342be1a2f4ea41305c666b42395139c49a0cd4974fc1b3e6a20cb28b1e0e12a2c0f3a6d6413b76c7d66c958c75'
            'af6d374be381c68cd3de9103b96c1ff3076bd54c8cffdf0c0c10442154f3d102a4d0332522fb037ae674b6feb2a330268a8e58b8df9bde86f5266b2f616178f3')

package() {
	install -Dm644 "$pkgname-$pkgver.jar" -t "$pkgdir/usr/share/java/$pkgname"
	install -Dm755 "$srcdir/rascal.sh" "$pkgdir/usr/bin/rascal"
}
