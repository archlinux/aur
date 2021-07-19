# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=chromium-extension-adnauseam
pkgver=3.11.3_rc3
_pkgver=3.11.3
pkgrel=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v$_pkgver/adnauseam-$_pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership "$srcdir/adnauseam.chromium"/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('7fc8b66206a29eb3229a5279f91e673f0ee3278dccbbbe4f488c04237165688a')
b2sums=('b97af3f248ce9af1ef0508f48ad439f740a5de419adc83a7c6902e4498d379c57258a85e90538ec01513d76a243d8331cb1138ebe55b2dddbdd9244b9e617573')
