# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=charles-bin
pkgver=4.6
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
sha256sums=('400128666f4a628c06197c8cfe64f961ce86af0270ba3b69252fd3e568fc600a')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"
}
