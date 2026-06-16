# Maintainer: toazd <wmcdannell@gmail.com>
pkgname=selah-bin
_pkgname=selah
pkgver=0.7.9
pkgrel=1
pkgdesc="A cross-platform Bible study app using Flutter and the 1769 King James Version"
arch=('x86_64')
url="https://github.com/toazd/selah"
license=('Unlicense')
depends=('gtk3' 'glib2' 'gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}-${pkgver}.deb::https://github.com/toazd/selah/releases/download/v0.7.9-build.123/selah_0.7.9_amd64.deb")
sha256sums=('46f1e9bc6439e05cbb8c2d337ecd7fd8bc51f213c1f84d304830c94550792c18')

package() {
    cd "$pkgdir"
    ar p "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.gz | bsdtar -xzf -
}
