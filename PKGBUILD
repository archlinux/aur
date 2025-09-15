# Maintainer: Oscar Rodriguez a.k.a mester <mester@disroot.org> 
pkgname="arashi-icon-theme"
pkgver=25.09
pkgrel=1
arch=("any")
license=('CC-BY-4.0')
pkgdesc="Arashi a smooth, modern icon set with a twist!"
url="https://github.com/0hStormy/Arashi"
provides=("arashi-icon-theme")
depends=()
options=('!strip' '!debug')

source=(Arashi-$pkgver::"$url/releases/download/$pkgver/Arashi-$pkgver.zip")

sha256sums=("20cfb7d720b0fa261f34007c1c7a56f06309798033f56cc531a474d5fbf00ac2")

package() {
	cd "${srcdir}/Arashi-$pkgver"
	rm -rf .github
	rm -rf .git
	install -d -m755 "${pkgdir}/usr/share/icons/Arashi"
	cp -a --no-preserve=ownership . "${pkgdir}/usr/share/icons/Arashi"
}
