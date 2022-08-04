# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=detect-it-easy
pkgver=3.05
pkgrel=1
pkgdesc='Detect It Easy, or abbreviated "DIE" is a program for determining types of files'
arch=(x86_64)
url="https://horsicq.github.io"
license=('MIT')
depends=('glibc')
options=('!emptydirs' '!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/horsicq/DIE-engine/releases/download/${pkgver}/die_${pkgver}_Debian_11_amd64.deb"
        "LICENSE")
sha256sums=('db494b757419e62e303086c7233f602f6aafeddbbd0e4826c9fbc158fe4f091f'
            'f78bf193f3aebf1225e4b5be12f7184178ca4fa3a3d3444e2ac933d86af9dc68')

package() {
    tar -xJf data.tar.xz -C "${pkgdir}"/

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
