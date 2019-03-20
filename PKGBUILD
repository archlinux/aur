# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=nota
pkgver=1.5.3
pkgrel=1
# shellcheck disable=SC2016
pkgdesc='Simple note taking using your $EDITOR and git'
url='http://github.com/cdown/nota'
arch=('any')
license=('Public domain')

source=("https://github.com/cdown/nota/archive/${pkgver}.zip")
md5sums=('51211dff66fc890d2c0240b620b876b0')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/nota" \
        "${pkgdir?}/usr/bin/nota"
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/nota-todo-reminder" \
        "${pkgdir?}/usr/bin/nota-todo-reminder"
}
