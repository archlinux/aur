# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.15.2b2_rc2
_pkgver=3.15.2.2
pkgrel=1
epoch=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v${pkgver%_*}/adnauseam-$_pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership $srcdir/adnauseam.chromium/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('a7e49b6c2a7537fe572497745bb4ef3891329639309128e8126b1b0d85f506b2')
b2sums=('6f7b649b62e5367e10137c95112630da3520007e3a10201f00f08e770b3cb01e7c2727a4bfc6d03927e4510d5c3dd6338224e75ee087c622b9e9e3a1bb26870e')
