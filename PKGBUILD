# Maintainer: iamawacko <iamawacko@protonmail.com>
#Contributor: Agorgianitis Loukas <agorglouk [at] gmail [dot] com>
_pkgname=rustywind
pkgname=rustywind-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="CLI for organizing Tailwind CSS classes"
arch=('x86_64')
url="https://github.com/avencera/rustywind"
license=('Apache')
provides=('rustywind' 'rustywind-bin')
conflicts=('rustywind' 'rustywind-bin')
source=("https://github.com/avencera/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('0cb3fc9758c6f95e159e012e706bd966e380fafca680428338c2d6e7b75db96e')

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
