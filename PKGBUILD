# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.17.3.1
_pkgver=3.17.3b1
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
sha256sums=('249e314fea7218dad251fbcb721d6f085b4a524197b4de201427b5d3e3957335')
b2sums=('ed57da7f315f1db70d99cff66168114a4e85ef3e618c5aace1f683c076bc116a557757afcfddf0ad6103fda69f4b54b4375860d84b61ebe35e24be4c4cc34810')
