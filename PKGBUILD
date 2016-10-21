# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yubikey-toggle
pkgver=1.0.0
pkgrel=1
pkgdesc='Yubikey enable/disable toggler'
url='http://github.com/cdown/yubikey-toggle'
arch=('any')
license=('Public domain')
depends=(xorg-xinput)
optdepends=('libnotify: --notify support')

source=("https://github.com/cdown/yubikey-toggle/archive/${pkgver}.zip")
md5sums=('3d68cf1f992fc4081b40583cedf56cb8')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/yubikey-toggle" \
        "${pkgdir?}/usr/bin/yubikey-toggle"
}
