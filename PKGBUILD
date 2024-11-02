# Maintainer: corysanin@artixlinux.org

pkgname=uinput-openrc
pkgver=20241102
pkgrel=1
pkgdesc="OpenRC modprobe uinput init script"
arch=('any')
url="https://artixlinux.org"
license=('MIT')
depends=('kmod' 'openrc')
source=("uinput.initd")
sha256sums=('052574ba0930539b64ded240009608c3b3fa8bec36e8c4f33bcc3e4d72547df2')

package() {
    install -Dm755 "$srcdir/uinput.initd" "$pkgdir/etc/init.d/uinput"
}
