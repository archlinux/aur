# Maintainer: Ruben Gees <rubengees7@gmail.com>

pkgname=multiwerf-bin
pkgver=1.4.9
pkgrel=1
pkgdesc="multiwerf is a self-updatable werf manager with the awareness of release channels, allowed stability levels."
arch=('x86_64')
url="https://github.com/werf/multiwerf"
license=('Apache')
depends=('wget')
source=('https://storage.yandexcloud.net/multiwerf/targets/releases/v1.4.9/multiwerf-linux-amd64-v1.4.9')
md5sums=('17b1beeff6f9957929189d16c67831ce')

package() {
    install -Dm755 "${srcdir}"/multiwerf-* "${pkgdir}/usr/bin/multiwerf"
}
