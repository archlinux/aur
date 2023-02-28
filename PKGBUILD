# Maintainer: Agorgianitis Loukas <agorglouk [at] gmail [dot] com>
_pkgname=rustywind
pkgname=rustywind-bin
pkgver=0.15.4
pkgrel=1
pkgdesc="CLI for organizing Tailwind CSS classes"
arch=('x86_64')
url="https://github.com/avencera/rustywind"
license=('Apache')
provides=('rustywind' 'rustywind-bin')
conflicts=('rustywind' 'rustywind-bin')
source=("https://github.com/avencera/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
