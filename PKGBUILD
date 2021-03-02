# Maintainer: Konrad Malik (https://konradmalik.github.io/)

pkgname=evernote-beta-bin
pkgver=10.7.6
buildver=2321
pkgrel=1
pkgdesc="Official Evernote client for Linux (beta, early-access)"
arch=('x86_64')
url="https://evernote.com/intl/ar/b1433t1422"
license=('custom')
provides=('evernote')
depends=()
optdepends=()
conflicts=()
replaces=()
source=("https://cdn1.evernote.com/boron/linux/builds/Evernote-${pkgver}-linux-ddl-ga-${buildver}.deb")
noextract=("Evernote-${pkgver}-linux-ddl-ga-${buildver}.deb")
sha256sums=('d335c2eafaf837e867e684c1e1c7677df79d2afd45732ac239b5196208f0f22f')

package() {
  bsdtar -O -xf "Evernote-${pkgver}-linux-ddl-ga-${buildver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
