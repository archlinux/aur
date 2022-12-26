# Maintainer: kumax <kumax2048@pm.me>
pkgname=firefox-extension-listen1
pkgver=2.27.0
pkgrel=1
pkgdesc="One for all free music in China"
arch=("any")
url="https://listen1.github.io/listen1"
_githuburl="https://github.com/windmiles/listen1_firefox_extension"
_name=${_githuburl##*/}
license=('MIT')
depends=("firefox")
noextract=("${_name}.${pkgver}.xpi")
source=("${_githuburl}/releases/download/release/${_name}.${pkgver}.xpi")
sha256sums=('841da634d315b03ad84fbbfb0109fea135e5e10c65699f07f509ea0c5d3e4c44')

package() {
    install -Dm644 ${_name}.${pkgver}.xpi ${pkgdir}/usr/lib/firefox/browser/extensions/githublisten111@gmail.com.xpi
}
