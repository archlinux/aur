# Maintainer: toazd <wmcdannell@gmail.com>
pkgname=selah-bin
_pkgname=selah
pkgver=1.1.6
pkgrel=5
pkgdesc="A cross-platform Bible study app using Flutter and the 1769 King James Version"
arch=('x86_64')
url="https://github.com/toazd/selah"
license=('Unlicense')
depends=('gtk3' 'glib2' 'gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/toazd/selah/releases/download/v1.1.6-build.236/selah_1.1.6_amd64.deb")
sha256sums=('9db71e0322c77eeda437de3cbd351795e295480cc4eb7cb34e89e85fba2db2c6')

package() {
    cd "$pkgdir"
    ar p "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.deb" data.tar.gz | bsdtar -xzf -
}
