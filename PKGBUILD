# Maintainer: yurisuki
pkgname=osu-install
pkgver=2
pkgrel=1
pkgdesc="Auto-install osu! on Linux"
arch=('any')
url='https://github.com/yurisuki/osu-install'
source=("osu-install::https://raw.githubusercontent.com/yurisuki/osu-install/master/aur/osu-install")
sha512sums=('91da88f02d5c0e696dfc51ddf47995236730e093c6edc6007a02bdbda0b7247173667f2ca88bd9741ee4bf652585b8848e432e1f7ee925ba5f490719e2d0eb66')
depends=('dialog' 'curl' 'bash')

package() {
install -Dm 755 "$srcdir/osu-install" "$pkgdir/usr/bin/osu-install"
}
