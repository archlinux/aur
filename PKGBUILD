# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
pkgname=s3s-setup
pkgver=1.0.0
pkgrel=1
pkgdesc="Setup and helper script for s3s by frozenpandaman."
arch=('any')
url="https://github.com/North-West-Wind/s3s-setup"
license=('GPL3')
depends=('python' 'jq')
optdepends=('xclip: copy gtoken instead of printing to console')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('3f3575120183efc0a9862d48f59dbc33')

package() {
	install -Dm755 ${srcdir}/${pkgname}-${pkgver}/s3s ${pkgdir}/usr/bin/s3s
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/s3s-monitor.service ${pkgdir}/usr/lib/systemd/user/s3s-monitor.service
}
