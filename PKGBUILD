# Maintainer: iamawacko <iamawacko@protonmail.com>
#Contributor: Agorgianitis Loukas <agorglouk [at] gmail [dot] com>
_pkgname=rustywind
pkgname=rustywind-bin
pkgver=0.24.3
pkgrel=1
pkgdesc="CLI for organizing Tailwind CSS classes"
arch=('x86_64')
url="https://github.com/avencera/rustywind"
license=('Apache')
provides=('rustywind' 'rustywind-bin')
conflicts=('rustywind' 'rustywind-bin')
source=("https://github.com/avencera/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('926d346e8314f07c14b3f2e33dbacc67198c69aae5648b6074485715996a0e85')

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
