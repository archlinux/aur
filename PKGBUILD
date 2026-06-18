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
source=("${pkgname}-${pkgver}.deb::https://github.com/toazd/selah/releases/download/v0.7.12-build.132/selah_0.7.12_amd64.deb")
sha256sums=('9b1001297f83fbba2929d59cde96fed6f63cbe4a827436752b3dfdc7374106b6')

package() {
    cd "$pkgdir"
    ar p "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.gz | bsdtar -xzf -
}
