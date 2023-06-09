# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
pkgname=s3s-setup
pkgver=1.0.0
pkgrel=1
pkgdesc="Setup and helper script for splatnet3statink (s3s) by frozenpandaman."
arch=('any')
url="https://github.com/North-West-Wind/s3s-setup"
license=('GPL3')
depends=('python')
optdepends=('xclip')
source=("${pkgname}::git+https://github.com/North-West-Wind/s3s-setup.git")
md5sums=('SKIP')

package() {
	install -Dm755 ${srcdir}/s3s-setup/s3s ${pkgdir}/usr/bin/s3s
	install -Dm644 ${srcdir}/s3s-setup/s3s-monitor.service ${pkgdir}/usr/lib/systemd/user/s3s-monitor.service
}
