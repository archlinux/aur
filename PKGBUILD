# Maintainer: Agorgianitis Loukas <agorglouk [at] gmail [dot] com>
pkgname=rustywind
pkgver=0.8.1
pkgrel=1
pkgdesc="CLI for organizing Tailwind CSS classes"
arch=('x86_64')
url="https://github.com/avencera/rustywind"
license=('Apache')
provides=('rustywind')
conflicts=('rustywind')
source=("https://github.com/avencera/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 $pkgname "${pkgdir}/usr/bin/$pkgname"
}
