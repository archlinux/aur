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
md5sums=('d3748d2546abbd1672d68a89b555021a')

package() {
    install -Dm755 "${srcdir}/larp" "${pkgdir}/usr/bin/larp"
}
