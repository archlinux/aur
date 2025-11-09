# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

# Previous Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
pkgver=2025.11.08.7d7cb91
pkgrel=1
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('any')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=(phanpy-dist-$pkgver.tar.gz::"https://github.com/cheeaun/phanpy/releases/download/${pkgver}/phanpy-dist.tar.gz")
noextract=(phanpy-dist-$pkgver.tar.gz)
sha256sums=('d9ea00afdd2d298ab445cad75eecb7ba98bdc98626ab0152036200e8223bc06a')

package() {
	install -d "${pkgdir}"/usr/share/webapps/phanpy/
	tar xf phanpy-dist-$pkgver.tar.gz --no-same-owner --directory "${pkgdir}"/usr/share/webapps/phanpy/
}
