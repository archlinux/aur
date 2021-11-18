# Maintainer: Matthieu Borde <dev at starmatt dot net>

pkgname=gnome-shell-extension-windowisready_remover
_pkgname=WindowIsReady_Remover
pkgver=13
pkgrel=1
pkgdesc='GNOME shell extension that removes the annoying "Windows is Ready" notification.'
arch=(any)
url='https://github.com/nunofarruca/WindowIsReady_Remover'
license=('unknown')
depends=('gnome-shell')
source=("https://extensions.gnome.org/extension-data/windowIsReady_Removernunofarrucagmail.com.v$pkgver.shell-extension.zip")
sha256sums=('14bad4c48061bdafbe2ca9938befc1daab9d21d305ebfe27059128cf37763d61')

package() {
    _uuid="windowIsReady_Remover@nunofarruca@gmail.com"
    _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

    install --directory "$_destdir/schemas"
    install --target-directory "$_destdir" --mode 644 metadata.json *.js
    install --target-directory "$_destdir/schemas" --mode 644 schemas/*
}
