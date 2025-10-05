# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

# Previous Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
pkgver=2025.09.17.03ce4c6
pkgrel=1
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('any')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=(phanpy-dist-$pkgver.tar.gz::"https://github.com/cheeaun/phanpy/releases/download/${pkgver}/phanpy-dist.tar.gz")
noextract=(phanpy-dist-$pkgver.tar.gz)
sha256sums=('3f3b135976dba07c11673d4d3ac2ea7d1d7c534270efa564ede7d7c3d4f0bfb0')

package() {
	install -d "${pkgdir}"/usr/share/webapps/phanpy/
	tar xf phanpy-dist-$pkgver.tar.gz --no-same-owner --directory "${pkgdir}"/usr/share/webapps/phanpy/
}
