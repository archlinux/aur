# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.17.0
_pkgver=$pkgver
pkgrel=1
epoch=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v$_pkgver/adnauseam-$pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership $srcdir/adnauseam.chromium/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('040242d7879eca10ee550d960d3021f4110b5c536e3cd9ac92d1fe058c3306db')
b2sums=('f11cf63d62ea22453dd8e03187c74a25d29029fdf5e030f19841f86dd9bdfd6a8fee2f71e24b00707f84f25cfb558343f84227ee50ae2a85927eb464ee597486')
