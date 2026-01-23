pkgname=just-talk-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Speech recognition app with global hotkey support"
arch=('x86_64')
url="https://github.com/whoamihappyhacking/just-talk"
license=('GPL-3.0-or-later')
depends=('fuse2')
options=('!debug' '!strip')
provides=('just-talk')
conflicts=('just-talk' 'just-talk-git')
_pkgfile="just-talk-${pkgver}-x86_64.AppImage"
source=("${_pkgfile}::https://github.com/whoamihappyhacking/just-talk/releases/download/v${pkgver}/${_pkgfile}")
sha256sums=('5b29658bec8e17dffe9791547754c7e3baea045c1a35b8ae05c530aa515fd118')

package() {
  install -Dm755 "$srcdir/${_pkgfile}" "$pkgdir/usr/bin/just-talk"
}
