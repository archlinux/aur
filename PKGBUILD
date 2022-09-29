# Maintainer: IgnusG <6438760+IgnusG@users.noreply.github.com>

pkgname='trunk-check'
pkgver='0.18.1_beta'
pkgrel=1
url='https://trunk.io/'
arch=('x86_64')
license=('unknown')
install=trunk.install
pkgdesc='Trunk is a blazingly fast meta code checker and formatter'
source=("https://trunk.io/releases/trunk-${pkgver//_/-}.linux.tar.gz")
sha512sums=('6ae1ce9b3db64588569a8dc74a945d6506cd110c02fada36edba45ab6ea1a61dfa4e7c0bcac9126b7c8487ed0b427b376869359d355ad7632c678626764aacc4')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m 755 "$srcdir/trunk" "$pkgdir/usr/bin/trunk"
}

