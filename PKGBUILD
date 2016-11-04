# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=nota
pkgver=0.1.0
pkgrel=1
# shellcheck disable=SC2016
pkgdesc='Simple note taking using your $EDITOR and git'
url='http://github.com/cdown/nota'
arch=('any')
license=('Public domain')

source=("https://github.com/cdown/nota/archive/${pkgver}.zip")
md5sums=('163224750d817ced34b280ddf76178a1')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/nota" \
        "${pkgdir?}/usr/bin/nota"
}
