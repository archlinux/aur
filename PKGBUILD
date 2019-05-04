# Maintainer: yurisuki
pkgname=osu-install
pkgver=2
pkgrel=1
pkgdesc="Auto-install osu! on Linux"
arch=('any')
url='https://github.com/yurisuki/osu-install'
source=("osu-install::https://raw.githubusercontent.com/yurisuki/osu-install/master/aur/osu-install")
sha512sums=('560c61ec4a46ca478046106dd89701dcf63e57f7c9ae1d5826b5d01a3e7fb2214f3cdf04fddb9c2e704c96f90fcb43ce8871af551ffa75321f91acb95e3041fd')
depends=('dialog' 'curl' 'bash')

package() {
install -Dm 755 "$srcdir/osu-install" "$pkgdir/usr/bin/osu-install"
}
