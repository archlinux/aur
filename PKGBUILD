# Maintainer: toazd <wmcdannell@gmail.com>
pkgname=selah-bin
_pkgname=selah
pkgver=0.7.12
pkgrel=1
pkgdesc="A cross-platform Bible study app using Flutter and the 1769 King James Version"
arch=('x86_64')
url="https://github.com/toazd/selah"
license=('Unlicense')
depends=('gtk3' 'glib2' 'gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}-${pkgver}.deb::https://github.com/toazd/selah/releases/download/v0.7.12-build.134/selah_0.7.12_amd64.deb")
sha256sums=('6f6a6acc254890c52e6fe64cb0d640c112f30dee38651c6ad4d3aa7c541fa132')

package() {
    cd "$pkgdir"
    ar p "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.gz | bsdtar -xzf -
}
