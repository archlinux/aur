# Maintainer: FedericoAntoniazzi <federico.antoniazzi.000@gmail.com>

pkgname=pfetch-btw
pkgver="0.7.0.1"
pkgrel=1
pkgdesc="A pretty system information tool written in POSIX sh. (Tuned for ArchLinux BTW)"
arch=('any')
url="https://github.com/FedericoAntoniazzi/$pkgname"
license=('MIT')
provides=("$pkgname")
conflicts=('pfetch-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3811b48929ac88742cff9eedcb9cdac8730be68ad8cf93ab6e332c9f90cd1c8a')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/pfetch" "$pkgdir/usr/bin/pfetch"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

