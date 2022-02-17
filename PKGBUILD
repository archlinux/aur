# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=gnome-shell-extension-hide-universal-access
pkgver=10
pkgrel=1
pkgdesc='Hide Universal Access icon from the status bar'
arch=(any)
url='https://github.com/akiirui/hide-universal-access'
license=('GPL3')
depends=('gnome-shell>=3.34')
source=("https://extensions.gnome.org/extension-data/hide-universal-accessakiirui.github.io.v${pkgver}.shell-extension.zip")
sha256sums=('122a3bbb9dd57d1a15b6fc267c33d373f72d662cc6d21574a28b2579928aff0e')

package() {
    local _uuid="hide-universal-access@akiirui.github.io"
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

    install --directory "$_destdir"
    install --target-directory "$_destdir" --mode 644 metadata.json *.js
}
