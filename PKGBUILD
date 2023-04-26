# Maintainer: khaithang Haokip <charlie39 at duck.com>
_pkgname=bito-linux-x86
pkgname=bito-cli
pkgver=3.0
pkgrel=1
pkgdesc="Bito AI - AI assistance for programming"
arch=('x86_64')
url="https://bito.ai/"
license=('custom')
provides=('bito')
source=("$_pkgname::https://raw.githubusercontent.com/gitbito/CLI/main/version-$pkgver/$_pkgname"
        "LICENSE.md::https://raw.githubusercontent.com/gitbito/CLI/main/LICENSE.md")
md5sums=('37ffac6517f8dcceee86f9926182721c'
         '218321b50fc8be292c4fe6199f62c46b')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/bito"
    install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
