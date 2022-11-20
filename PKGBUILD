# Maintainer: matt kasun <matt  at gravil.com>
pkgname=netclient
pkgver=0.16.3
pkgrel=1
pkgdesc="netclient daemon - a platform for modern, blazing fast wireguard virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=("custom:SSPL")
depends=('wireguard-tools')

source=("${pkgver}-${pkgrel}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('a80ca86150c3c5dca87d2b7b7dce55a167ea43624ad54cfb8a5377dde9440118')


package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
