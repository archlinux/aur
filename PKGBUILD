# Maintainer: hackia <hackia at eytukan dot com>

pkgname="wa"
pkgver=0.0.0
pkgrel=4
pkgdesc="wa"
arch=('any')
url="https://github.com/kireidowa/wa"
license=('AGPL-3.0-or-later')
depends=('cmake')
provides=('wa')
source=("https://github.com/kireidowa/wa/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('1c27ed61f553af93fa56e54b85bd2f5e45337eee5d5f885c0773821f641351584ca88535c0dc93f9c16cc48a9b5d5a59f99869c46c814fb72a1d1d5279894e75')

package() {
  cd "$pkgname-$pkgver"
  cmake . && make && sudo make install
}

