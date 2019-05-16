# Maintainer: yurisuki
pkgname=osu-install
pkgver=2
pkgrel=3
pkgdesc="Auto-install osu! on Linux"
arch=('any')
url='https://github.com/yurisuki/osu-install'
source=("osu-install::https://raw.githubusercontent.com/yurisuki/osu-install/master/aur/osu-install")
sha512sums=('916175f12dfbf5480c7943ab7289622a8c8476048776ca9434c7d110e823b28193686dc990bb6a62a5b6675a1f96338dea303505f1b5a67923605f8dfcff5bff')
depends=('dialog' 'curl' 'bash')

package() {
install -Dm 755 "$srcdir/osu-install" "$pkgdir/usr/bin/osu-install"
}
