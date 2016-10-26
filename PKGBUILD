# Maintainer: Alexej Magura <alexej@Aya.localdomain>
pkgname=lockrun
pkgver=0.6.2
_pkgver=20110613-163042
pkgrel=2
pkgdesc="Exclusively run things via lock files"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/hilbix/lockrun"
license=('GPL')
depends=('glibc')
source=("http://scylla-charybdis.com/download/$pkgname-$pkgver-20110613-163042.tar.gz")
md5sums=('304146202b9972ae9cb3afa37fe16c51')

build() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgver"

  install -Dm 755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

# vim:set ts=2 sw=2 et:
