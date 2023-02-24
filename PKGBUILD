# Maintainer: erdii <me at erdii.engineering>
pkgname=netclient-bin
pkgver=0.17.1
pkgrel=2
pkgdesc="A component of netmaker"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=("custom:SSPL")
depends=('wireguard-tools')

source=("${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('be8e5fc8acc2f558d50a59a2b41ab754a3c578ca5bca22458990b0a1f9aa48f1')

package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
