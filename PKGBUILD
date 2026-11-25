# Maintainer: eusouobn <eusouobn@users.noreply.github.com>
pkgname=pysensor-qt
pkgver=0.12.0
pkgrel=1
pkgdesc="Compact Qt sensor monitor with short names, favorites and hardware sorting"
arch=('any')
url="https://github.com/eusouobn/pysensor-qt"
license=('GPL-3.0-only')
depends=('python' 'python-pyqt6' 'lm_sensors' 'pciutils')
optdepends=('nvidia-utils: NVIDIA GPU readings via nvidia-smi')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c25a8ba1c014745a49348d89d74e49aa2151cf494a2f3ffdf89670ec3320cff4')

package() {
  install -Dm755 "$srcdir/pysensor-qt-$pkgver/pysensor-qt" "$pkgdir/usr/bin/pysensor-qt"
  install -Dm644 "$srcdir/pysensor-qt-$pkgver/pysensor-qt.desktop" "$pkgdir/usr/share/applications/pysensor-qt.desktop"
}
