# Maintainer: erdii <me at erdii.engineering>
pkgname=netclient-bin
pkgver=0.14.3
pkgrel=1
pkgdesc="A component of netmaker"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=("custom:SSPL")
depends=('wireguard-tools')

source=("${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('9ddbb80bb15f8791aa0c9b8ae3fa71fb0b4b59ee11d28e302d4f8ba547d6571e')

package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
