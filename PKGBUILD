# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='adfind'
pkgver='1.0'
pkgrel=1
pkgdesc='Admin Panel Finder'
arch=('any')
url='https://github.com/sahakkhotsanyan/adfind'
license=('GPL')
depends=('php')
source=('https://github.com/sahakkhotsanyan/adfind/archive/master.zip')
md5sums=('c1d42e84cb061eb4f000ff2b6d108e04')

package() {
	cd "${srcdir}/${pkgname}-master"
        chmod +x "${pkgname}"
        install -dm755 "${pkgdir}/usr/bin/"
        cp "${pkgname}" "${pkgdir}/usr/bin/"
}
