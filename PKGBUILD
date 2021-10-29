# Maintainer: Xavier Saliniere <xavier.saliniere@pm.me>

_pkgname='opentapes'
_upkgname='Opentapes'
pkgname="${_pkgname}-bin"
pkgver=0.1.0
pkgrel=1
pkgdesc="A convergent/adaptive app for streaming Hip-Hop mixtapes. Made with Vue.js & Tauri."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/xaviers/Opentapes"
license=('GPL3')
depends=('gtk3' 'webkit2gtk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}_${pkgver}_amd64.deb"::"https://codeberg.org/attachments/c8877719-f904-4b0e-a7ff-5e0ae5ebc0fe")
source_aarch64=("${_pkgname}_${pkgver}_aarch64.deb"::"https://codeberg.org/attachments/18c2e29f-7c91-4466-9da0-313306886bef")

package() {
    bsdtar -xzf 'data.tar.gz' -C "${pkgdir}"
    install -d "${pkgdir}/usr/bin"
}

md5sums_x86_64=('b94299b7cfae153ab464224cafeb043d')
md5sums_aarch64=('00120573481fd5f7f117570bd3fdfed5')
