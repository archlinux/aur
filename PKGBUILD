# Maintainer: toazd <wmcdannell@gmail.com>
pkgname=selah-bin
_pkgname=selah
pkgver=0.9.5
pkgrel=1
pkgdesc="A cross-platform Bible study app using Flutter and the 1769 King James Version"
arch=('x86_64')
url="https://github.com/toazd/selah"
license=('Unlicense')
depends=('gtk3' 'glib2' 'gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/toazd/selah/releases/download/v0.9.5-build.193/selah_0.9.5_amd64.deb")
sha256sums=('7afba7963dd026bd80cfa33305ede32f24d23ac38de9cac5c4a7e94cd45a289d')

package() {
    cd "$pkgdir"
    ar p "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.deb" data.tar.gz | bsdtar -xzf -
}
