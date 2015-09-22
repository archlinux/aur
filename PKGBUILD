# Maintainer: Alexander Keller <git@nycroth.com>
pkgname=tag
pkgver=0.2
pkgrel=1
pkgdesc="Console tag based file manager"
arch=(any)
url="https://gitlab.com/Nycroth/tag"
license=('custom:unlicense')
depends=('coreutils' 'sed' 'bash')
source=("https://gitlab.com/Nycroth/tag/repository/archive.tar.gz?ref=v0.2")
md5sums=('e5128cae78d004f7d73c059bfa101a24')

package() {
    cd "${srcdir}/tag-v0.2-88bd2961339eab4f223ec1271fe7d879b65b60da/"

    make DESTDIR="${pkgdir}" install
    install -m 755  -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
