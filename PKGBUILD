# Maintainer: Aquib Javed <aquibjavedt007@gmail.com>
pkgname=veldora
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="A rust program to bruteforce zips, pdfs and some popular hashes."
arch=('x86_64' 'i686')
url="https://github.com/tamton-aquib/veldora"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("veldora.zip::https://github.com/tamton-aquib/veldora/releases/download/v${pkgver}/veldora-x86_64-unknown-linux-gnu.tar.gz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
    install -Dm755 "${srcdir}/veldora" "${pkgdir}/usr/bin/veldora"
}
