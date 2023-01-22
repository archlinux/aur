# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=detect-it-easy
pkgver=3.07
pkgrel=1
pkgdesc='Detect It Easy, or abbreviated "DIE" is a program for determining types of files'
arch=(x86_64)
url="https://horsicq.github.io"
license=('MIT')
depends=('glibc')
options=('!emptydirs' '!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/horsicq/DIE-engine/releases/download/${pkgver}/die_${pkgver}_Debian_11_amd64.deb"
        "LICENSE")
sha256sums=('31fae699450cce6f64f3ddf340f7adebe7344358701a87e80352cea5a7b3c33d'
            'f78bf193f3aebf1225e4b5be12f7184178ca4fa3a3d3444e2ac933d86af9dc68')

package() {
    tar -xJf data.tar.xz -C "${pkgdir}"/

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
