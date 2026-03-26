# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>

pkgname=cockpit-session-recording
pkgver=21
pkgrel=1
pkgdesc='Cockpit UI for session recording'
arch=('any')
url='https://github.com/Scribery/cockpit-session-recording'
license=(LGPL-2.1-or-later)
depends=(cockpit tlog)
source=("https://github.com/Scribery/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('bb7cd0002d2ff4a2a7b9c14028eb7d788c3d3711d7250196420f0ebd15daf34a')

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

