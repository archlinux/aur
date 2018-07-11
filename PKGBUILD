## Package Maintainer: wchurch58


pkgname=virtualshield-openrc
pkgver=1.0
pkgrel=1
pkgdesc="You have the right to remain private! VirtualShield VPN"
arch=('any')
license=('https://virtualshield.com/legal/eula/')
url="https://virtualshield.com/"
depends=('virtualshield')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/wchurch58/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7d47be177ff5e0165370239491fa10bf166187899341a3e32baf537344936d6874b3fc6568b9ec7f55a7edd2082b978586b9b49cd9544ade04ae14c474817c51')

## SysV

package() {
cd "${srcdir}/${pkgname}-${pkgver}"

       install -D -m755 "virtualshield-svc" "${pkgdir}/etc/init.d/virtualshield-svc"
}
