# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=xinput-toggle
pkgver=1.3.0
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
md5sums=('11b9b0467f6988c8d3cc8830537b38e2')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/xinput-toggle" \
        "${pkgdir?}/usr/bin/xinput-toggle"
}
