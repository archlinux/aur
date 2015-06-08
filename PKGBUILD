# Maintainer Jonne Hass <me@mrzyx.de>

pkgname=preziplayer-git
pkgver=0.33.aa07c36
pkgrel=1
pkgdesc="prezi Presentation Player for Linux"
url="https://github.com/TomFreudenberg/preziplayer"
license=('unknown')
arch=('any')
makedepends=('git')
depends=('zenity' 'zip' 'unzip' 'weborf' 'bash')
source=("$pkgname::git://github.com/TomFreudenberg/preziplayer.git")

pkgver () {
  cd "$srcdir"/$pkgname
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  cp -vr "$srcdir"/$pkgname/src/usr "$pkgdir"/
}
sha256sums=('SKIP')
