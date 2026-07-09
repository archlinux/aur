# Maintainer: codeztech <alex@dinofudge.co.uk>
pkgname=larp
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple script that displays a 'larp' ASCII image"
arch=('any')
url="https://github.com/SmoothCdoer9981/larp"
license=('MIT')
depends=('sh')
source=("larp")
md5sums=('98c7cec625c5f0ce7b8bfc9e7ee327f3902a9a5653d1d27f25902375efa05ee5')

package() {
    install -Dm755 "${srcdir}/larp" "${pkgdir}/usr/bin/larp"
}