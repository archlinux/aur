# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=charles-bin
pkgver=4.6.3
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
sha256sums=('0e3b0f0e8361add3fd2730f56a800d7b22c3e3e04bcc651130f70d3cf9bc328e')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"
}
