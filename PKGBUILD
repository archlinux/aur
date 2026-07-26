# Maintainer: nyq <batasignal@proton.me>
pkgname=nyqfetch
pkgver=1.0.1
pkgrel=1
pkgdesc="A tuff custom system fetch utility written in Python"
arch=('any')
url="https://archlinux.org"
license=('MIT')
depends=('python' 'python-psutil')
source=('nyqfetch')
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/nyqfetch" "${pkgdir}/usr/bin/nyqfetch"
}
