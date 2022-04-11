# Maintainer: erdii <me at erdii.engineering>
pkgname=netclient-bin
pkgver=0.12.2
pkgrel=1
pkgdesc="A component of netmaker"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=("custom:SSPL")
depends=('wireguard-tools')

source=("${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('1d0b50584ecdc03511251fbbbbb74179de06448ade5a392ffa0e8d15ecb82ef5')

package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
