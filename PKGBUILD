# Maintainer: Leon G <mail+aur at leongr.nl>
pkgname=rascal
pkgver=0.28.2
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
sha512sums=('113cf9ef91c2c211e9e18503e589fac3d3752c8bafc1231cc403eefefdc8fa7bc32761efc599ceef3db06ae2f89e2ca371415d01c63494679cf0b2fcdd81e0c7'
            '26d8048b1711cf92e2e59499cbb82fe6daac106928f72ddba1b5c26163bc5d894aa1d6174b40e74d7a247482d63d1183675848fbd6a8fcfa0bd0230ed74d1521')

package() {
	install -Dm644 "$pkgname-$pkgver.jar" -t "$pkgdir/usr/share/java/$pkgname"
	install -Dm755 "$srcdir/rascal.sh" "$pkgdir/usr/bin/rascal"
}
