# Maintainer: matt kasun <matt  at gravil.com>
pkgname=netclient
pkgver=0.14.6
pkgrel=0
pkgdesc="netclient daemon - a platform for modern, blazing fast virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=("custom:SSPL")
depends=('wireguard-tools')

source=("${pkgver}-${pkgrel}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('59116715abef8afacda5ba46b2003a45919da01e6af2e9d932a8c995053b66bf')


package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
