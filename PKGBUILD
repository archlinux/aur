# Maintainer: Samiul Quoreshi Sourav <sourav at l3v11.eu.org>

pkgname=enum4linux-ng
pkgver=1.3.10
pkgrel=1
pkgdesc="Next-generation version of enum4linux for enumerating Windows and Samba systems"
arch=('any')
url="https://github.com/cddmp/enum4linux-ng"
license=('GPL3')
depends=(
    'smbclient'
    'python'
    'python-ldap3'
    'python-yaml'
    'impacket'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('563235acd56278dbcc405e436d78cf29eaa55dc83b11b6c38d46077198f6a427')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 enum4linux-ng.py "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
