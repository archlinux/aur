## Package Maintainer: Karl-K


pkgname=virtualshield-openrc
pkgver=1.0
pkgrel=1
pkgdesc="You have the right to remain private! VirtualShield VPN"
arch=('any')
license=('https://virtualshield.com/legal/eula/')
url="https://virtualshield.com/"
depends=('virtualshield')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/karl-k/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('6a5bb36f14c1cef5c2cef363548d9e531409067274895fed6309b8e63010af1e515730ebc60c0053aa1330464d07b848675a769d3015a87e9d1c7ad5a399e2cf')

## SysV

package() {
cd "${srcdir}/${pkgname}-${pkgver}"

       install -D -m755 "virtualshield-svc" "${pkgdir}/etc/init.d/virtualshield-svc"
}
