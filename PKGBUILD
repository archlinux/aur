# Maintainer: razingfire <j2r3nkf3j@mozmail.com>
# Maintainer: Mrinmoy <mrinmoym@duck.com>
pkgname=ulaa-browser
_pkgname=Ulaa-Browser
pkgver=2.41.5
pkgrel=2
pkgdesc="The web browser from Zoho. Ulaa combines minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=(x86_64)
url="https://ulaa.com"
license=()
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(ulaa-browser-stable)
conflicts=(ulaa-browser-stable)
replaces=()
backup=()
options=(!debug)
install=
changelog=Changelog
source_x86_64=(${pkgname}-${pkgver}-${pkgrel}.deb::https://ulaa.zoho.com/release/linux/stable/${_pkgname}-v${pkgver}-amd64.deb)
noextract=()
sha256sums_x86_64=('51b8548750978c3f6a0cd998b09e29018840df7286dc2c434d47029aa785d5bd')
validpgpkeys=()

prepare() {
  tar -xvf data.tar.xz
}

package() {
    install -dm755 "${pkgdir}/opt"
    install -dm755 "${pkgdir}/usr"

    cp -ra ./opt ./usr "${pkgdir}"
}
