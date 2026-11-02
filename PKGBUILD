# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=lunii-qt-bin
pkgver=3.1.4
pkgrel=1
pkgdesc="GUI to manage Lunii Storyteller devices - pre-built binary"
arch=(x86_64)
url="https://github.com/o-daneel/Lunii.QT"
license=('GPL-3.0-or-later')
depends=('glibc' 'zlib')
provides=('lunii-qt')
conflicts=('lunii-qt')
source=("https://github.com/o-daneel/Lunii.QT/releases/download/v${pkgver}/Lunii.Qt-v${pkgver}-Linux-x86_64.zip")
b2sums=('da944e51f5ef9dce3cf6767f1b79eec067a65f58c5c2350a52759845c6fb6cac9ec351d49313c71eb5e03fb6f4dc3a4b9195e2c913386a52991c2a22fb793743')
sha256sums=('218dd1c01aaf75af8d7afb71cf2b2d4aa6e8c1994320c610caf989da1ea5efca')

package() {
  install -Dm755 "$srcdir/lunii-qt" "$pkgdir/usr/bin/lunii-qt"
}
