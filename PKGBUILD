pkgname=just-talk-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Speech recognition app with global hotkey support"
arch=('x86_64')
url="https://github.com/whoamihappyhacking/just-talk"
license=('GPL-3.0-or-later')
options=('!debug')
provides=('just-talk')
conflicts=('just-talk' 'just-talk-git')
_pkgfile="just-talk-linux-x86_64-v${pkgver}.tar.zst"
source=("${_pkgfile}::https://github.com/whoamihappyhacking/just-talk/releases/download/v${pkgver}/${_pkgfile}")
sha256sums=('ef4ea13019bbe3b6a239b5aa566454194a74debc3c577e04a1e67643189369af')

package() {
  install -Dm755 "$srcdir/just-talk" "$pkgdir/usr/bin/just-talk"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/just-talk.png"
  install -Dm644 "$srcdir/just-talk.desktop" "$pkgdir/usr/share/applications/just-talk.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
