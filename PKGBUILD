# Maintainer: razingfire <j2r3nkf3j@mozmail.com>
# Maintainer: Mrinmoy <mrinmoym@duck.com>
pkgname=ulaa-browser
_pkgname=Ulaa-Browser
pkgver=2.41.3
pkgrel=1
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
sha256sums_x86_64=('SKIP')
validpgpkeys=()

prepare() {
  tar -xvf data.tar.xz
}

package() {
    install -dm755 "${pkgdir}/opt"
    install -dm755 "${pkgdir}/usr"

    cp -ra ./opt ./usr "${pkgdir}"
}
