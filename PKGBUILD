# Maintainer: Daniel Roe <daniel@roe.dev>
pkgname=guijs
pkgver=0.1.0
pkgrel=0
pkgdesc="The app that makes your #devlife easier."
arch=('x86_64')
url="https://github.com/Akryum/guijs"
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/Akryum/guijs/releases/download/v${pkgver}-tauri/guijs_${pkgver}_amd64.deb")
sha1sums=('fc914c1ea8fee83c63113cc86e22bfb3d1c8121a')

package() {
    # extract package data
    tar xf data.tar.gz -C "${pkgdir}"
    # fix permissions
    chmod 755 $(find "${pkgdir}" -type d);
}
