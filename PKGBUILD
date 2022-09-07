# Maintainer: matt kasun <matt  at gravil.com>
pkgname=netclient
pkgver=0.15.1
pkgrel=0
pkgdesc="netclient daemon - a platform for modern, blazing fast virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=("custom:SSPL")
depends=('wireguard-tools')

source=("${pkgver}-${pkgrel}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('2637d2dcf455262f32c829dfece169987a71c2e04c9a11759f5e9d364d5861d9')


package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
