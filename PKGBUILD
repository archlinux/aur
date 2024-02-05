# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=fav-bin
_pkgname=fav
pkgver=0.1.9
pkgrel=1
pkgdesc='Back up your favorite bilibili resources with CLI'
arch=('x86_64')
url="https://github.com/kingwingfly/${_pkgname}"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("${_pkgname}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('2142746e9354cab316ccaf50120b73ee7b3732b8b5244baf20a0f09ebf35b875')

package() {
	install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}
