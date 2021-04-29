# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=chromium-extension-adnauseam
pkgver=3.10.3
pkgrel=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v$pkgver/adnauseam-$pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership "$srcdir/adnauseam.chromium"/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('e4c3980a10c9cac491735ece5c5e7e8f917b0a2aa1de2fb8facecf63a4315d47')
b2sums=('7d6dbcd975c829d44c8420f6b96cf884eedff7a25f63047be5ee7a9c8a3d7003b6e90cfc29e574529fb6bdcf11d8336845a08c3b24410159406aa56a89cbc3bf')
