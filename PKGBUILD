# Maintainer: yurisuki
pkgname=osu-install
pkgver=2
pkgrel=01
pkgdesc="Auto-install osu! on Linux"
arch=('any')
url='https://github.com/yurisuki/osu-install'
source=("osu-install::https://raw.githubusercontent.com/yurisuki/osu-install/master/aur/osu-install")
sha512sums=('09d6c562f5a00137c2769d01ab6230e8d3c9ce0619adba7b182ba3eb8d28fd057b4b7560ab9c59a2b706aaebd02add2acd5632db7dc9f231056cb016ad5dcdd8')
depends=('dialog' 'curl' 'bash')

package() {
install -Dm 755 "$srcdir/osu-install" "$pkgdir/usr/bin/osu-install"
}
