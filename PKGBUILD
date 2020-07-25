# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=daisyduck-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A free software for playing digital audio books (Daisy 2.02)"
arch=('x86_64')
url='https://daisy.geexbox.org'
license=('GPL3' 'LGPL2.1')
provides=('daisyduck')
depends=('libx11' 'gcc-libs' 'qt4' 'vlc' 'libduck1')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://daisy.geexbox.org/releases/daisyduck_${pkgver}-1_amd64.deb")
sha256sums=('e553b1bd261c9baf8a241db702c7468e0f1d830245d814ab97e80afbf5c1da90')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  rm "${pkgdir}/usr/share/doc/daisyduck/changelog.Debian.gz"
  rm "${pkgdir}/usr/share/doc/daisyduck/copyright"
}