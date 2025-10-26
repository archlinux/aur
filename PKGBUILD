# Maintainer: Thomas Jost <schnouki@schnouki.net>

pkgname=lunii-qt-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="GUI to manage Lunii Storyteller devices - pre-built binary"
arch=(x86_64)
url="https://github.com/o-daneel/Lunii.QT"
license=('GPL-3.0-or-later')
depends=('glibc' 'zlib')
provides=('lunii-qt')
conflicts=('lunii-qt')
source=("https://github.com/o-daneel/Lunii.QT/releases/download/v${pkgver}/Lunii.Qt-v${pkgver}-Linux-x86_64.zip")
sha256sums=('576262a8c21ef62c3093efd67177592f1aee90873750dc6c9d529716f3e2fe44')

package() {
  install -Dm755 "$srcdir/lunii-qt" "$pkgdir/usr/bin/lunii-qt"
}
