# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=charles-bin
pkgver=4.6.4
pkgrel=1
pkgdesc="Web debugging proxy application (Built using the deb package)"
arch=('x86_64')
url="https://www.charlesproxy.com"
license=('custom')
makedepends=('tar' 'xz')
conflicts=('charles')
provides=('charles')
depends=('hicolor-icon-theme')
source=(https://www.charlesproxy.com/packages/apt/pool/main/c/charles-proxy/charles-proxy_${pkgver}_amd64.deb)
sha256sums=('1d1058958c5cd16af3aa7feaa20a61ed6fb811196fc5aa56868f66878a4f9c5f')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"
}
