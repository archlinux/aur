# Maintainer: Nico <desoxhd@gmail.com>
pkgname=charles-bin
pkgver=4.5.6
pkgrel=1
pkgdesc="Web debugging proxy application (Built using the deb package)"
arch=('x86_64')
url="http://www.charlesproxy.com"
license=('custom')
makedepends=('tar' 'xz')
depends=('hicolor-icon-theme')
source=(https://www.charlesproxy.com/packages/apt/pool/main/c/charles-proxy/charles-proxy_${pkgver}_amd64.deb)
sha256sums=('62db02441fd7cedf1ad69d85cca533a47ce763a525245330b76d6b52422ab733')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"
}
