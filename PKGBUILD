pkgname=keepass-plugin-keecloud
pkgver=1.2.0.1
pkgrel=1
pkgdesc="Adds support to several online file services to the built in URL file access in KeePass."
license=('MIT')
depends=('keepass')
arch=('any')
url='https://bitbucket.org/devinmartin/keecloud/overview'
_plgname='KeeCloud.plgx'
source=("${_plgname}::https://bitbucket.org/devinmartin/keecloud/downloads/KeeCloud-${pkgver}.plgx")
noextract=($_plgname)
sha256sums=('84b65e32027cf12ace7bf504041065c03675b9acbfca8e26e294a17ac4c6420c')

package() {
  install -Dm644 "${srcdir}/${_plgname}" "${pkgdir}/usr/share/keepass/plugins/${_plgname}"
}
