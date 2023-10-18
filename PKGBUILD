# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=charles-bin
pkgver=4.6.5
pkgrel=2
pkgdesc="Web debugging proxy application (Standalone version using bundled Java)"
arch=('x86_64')
url="https://www.charlesproxy.com"
license=('custom')
makedepends=('tar' 'zstd')
conflicts=('charles')
provides=('charles')
depends=('hicolor-icon-theme')
source=(https://www.charlesproxy.com/packages/apt/pool/main/c/charles-proxy/charles-proxy_${pkgver}_amd64.deb)
sha256sums=('ce7c761ace2144b950ddb935ffff088e2126ab723be404ca9eaf1c46824a1233')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.zst"
}
