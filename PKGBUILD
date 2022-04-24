# Maintainer: Matthieu Borde <dev at starmatt dot net>

pkgname=gnome-shell-extension-windowisready_remover
_pkgname=WindowIsReady_Remover
pkgver=18
pkgrel=2
pkgdesc='GNOME shell extension that removes the annoying "Windows is Ready" notification.'
arch=(any)
url='https://github.com/nunofarruca/WindowIsReady_Remover'
license=('Apache-2.0')
depends=('gnome-shell')
source=("https://extensions.gnome.org/extension-data/windowIsReady_Removernunofarrucagmail.com.v$pkgver.shell-extension.zip")
sha256sums=('9fecce36b6b600cae1a4d237a0c564b3c4ef4680168d173da63146998575cf33')

package() {
    _uuid="windowIsReady_Remover@nunofarruca@gmail.com"
    _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

    install --directory $_destdir
    install --target-directory "$_destdir" --mode 644 metadata.json *.js
}
