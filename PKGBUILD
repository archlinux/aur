# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=xinput-toggle
pkgver=1.2.0
pkgrel=1
pkgdesc='xinput enable/disable toggler'
url='http://github.com/cdown/xinput-toggle'
arch=('any')
license=('Public domain')
depends=(xorg-xinput)
optdepends=('libnotify: --notify support')
replaces=(yubikey-toggle)
provides=(yubikey-toggle)
conflicts=(yubikey-toggle)

source=("https://github.com/cdown/xinput-toggle/archive/${pkgver}.zip")
md5sums=('eae088a29b226d190ce67c2c6a0cce7f')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/xinput-toggle" \
        "${pkgdir?}/usr/bin/xinput-toggle"
}
