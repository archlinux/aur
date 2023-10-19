# Maintainer: Murli Tawari <kraanzu@gmail.com>

pkgname=dooit
_pkgname=${pkgname}
pkgver=2.1.0
pkgrel=1
pkgdesc="A todo manager that you didn't ask for, but needed!"
url="https://github.com/kraanzu/dooit"
arch=('any')
license=('MIT')
depends=('python' 'git' 'xclip')
makedepends=()
conflicts=("dooit-git")
source=("https://github.com/kraanzu/dooit/releases/download/v${pkgver}/linux-dooit")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"
    chmod +x linux-dooit
    mv linux-dooit dooit
}

package() {
    install -Dm0755 "$pkgname" "$pkgdir/usr/bin/dooit"
}
