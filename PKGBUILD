# Maintainer: Daniel Roe <daniel@roe.dev>
pkgname=guijs
pkgver=0.1.19
pkgrel=0
pkgdesc="The app that makes your #devlife easier."
arch=('x86_64')
licence=MIT
url="https://github.com/Akryum/guijs"
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/Akryum/guijs/releases/download/v${pkgver}/guijs_0.1.0_amd64.deb")
sha1sums=('7e8f252e3c65bc8fb514e51924053cbbc3e8ba47')

package() {
    # extract package data
    tar xf data.tar.gz -C "${pkgdir}"
    # fix permissions
    chmod 755 $(find "${pkgdir}" -type d)
}
