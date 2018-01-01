# Maintainer: Nbiba Bedis <bedisnbiba@gmail.com>
# Contributor: Nbiba Bedis <bedisnbiba@gmail.com> 

pkgname=sane-qt
pkgver=1
pkgrel=1
pkgdesc="Simple scanner GUI (sane) made with PyQt"
arch=('any')
url="https://github.com/sigmaSd/Sane-qt"
license=('MIT')
depends=('sane' 'python' 'python-pyqt4')
makedepends=('git')
source=("$pkgname"::'git://github.com/sigmaSd/Sane-qt.git')
md5sums=('SKIP')

package() {
  mkdir -p "$pkgdir/usr/share/sane-qt"
  mkdir -p "$pkgdir/usr/bin"
  cd "$srcdir/$pkgname"
  install run_script "$pkgdir/usr/share/sane-qt/sane-qt"
  install sane-qt_start.py "$pkgdir/usr/share/sane-qt/sane-qt_start.py"
  install saneqt.py "$pkgdir/usr/share/sane-qt/saneqt.py"
  ln -sf  "$pkgdir/usr/share/sane-qt/sane-qt" "$pkgdir/usr/bin/sane-qt"
  
}

