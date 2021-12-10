# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=detect-it-easy
pkgver=3.03
pkgrel=1
pkgdesc="Detect It Easy is a packer identifier"
arch=(x86_64)
url="http://ntinfo.biz/index.html"
license=('MIT')
depends=('glibc')
options=('!emptydirs' '!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/horsicq/DIE-engine/releases/download/${pkgver}/die_3.03_Debian_10_amd64.deb"
        "LICENSE")
sha256sums=('5b64063e5a4950144b731224c87d20a57be5bf6759e5c708775676d4fe56e630'
            'f78bf193f3aebf1225e4b5be12f7184178ca4fa3a3d3444e2ac933d86af9dc68')

package() {
    tar -xJf data.tar.xz -C "${pkgdir}"/

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
