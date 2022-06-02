# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=detect-it-easy
pkgver=3.04
pkgrel=1
pkgdesc='Detect It Easy, or abbreviated "DIE" is a program for determining types of files'
arch=(x86_64)
url="http://ntinfo.biz/index.html"
license=('MIT')
depends=('glibc')
options=('!emptydirs' '!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/horsicq/DIE-engine/releases/download/${pkgver}/die_${pkgver}_Debian_11_amd64.deb"
        "LICENSE")
sha256sums=('d67eb149342cf50f6a62f3a556750e88817cbf9093821c2114aee7b7d6edbe0c'
            'f78bf193f3aebf1225e4b5be12f7184178ca4fa3a3d3444e2ac933d86af9dc68')

package() {
    tar -xJf data.tar.xz -C "${pkgdir}"/

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
