# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname='getdepends'
pkgver=1.0
pkgrel=1
arch=('any')
url='https://gitlab.com/molaeiali/getdepends'
depends=('pkgfile')
license=('CC-BY-SA-4.0')
pkgdesc="A script that gets a binary and give it's dependencies on Arch Linux using ldd."
source=("https://gitlab.com/molaeiali/getdepends/-/archive/$pkgver/getdepends-$pkgver.zip")
sha256sums=('e4475012cf99dd2bbb12669afb07805977a7d350fecceb60a861ae3e9c7fe2ef')

package() {
  install -D -m644 "$srcdir/$pkgname-$pkgver/getdepends" "$pkgdir/usr/bin/getdepends"
  install -D -m644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/getdepends/README.md"
  install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/getdepends/LICENSE"

  chmod +x "$pkgdir/usr/bin/getdepends"
}

