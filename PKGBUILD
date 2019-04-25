# Maintainer: yurisuki
pkgname=osu-install
pkgver=2
pkgrel=0
pkgdesc="Auto-install osu! on Linux"
arch=('any')
url='https://github.com/yurisuki/osu-install'
source=("osu-install::https://raw.githubusercontent.com/yurisuki/osu-install/master/aur/osu-install")
sha512sums=('3e65bb57a4ff568d021b88a89f36eb1603abb750c748d0a0a84b4d1d96f0d4f6c0e4dfdb00b6c3c2e08fada29ce934889b767a7234f4ad06ca1d66f376d7af53')
depends=('dialog' 'curl' 'bash')

package() {
install -Dm 755 "$srcdir/osu-install" "$pkgdir/usr/bin/osu-install"
}
