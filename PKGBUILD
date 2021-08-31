# Maintainer: matheuz1210 <matheuz1210 at gmail dot com>

pkgname=wsid
pkgver=0.1
pkgrel=1
pkgdesc='web show image directory'
arch=(any)
url='https://github.com/matheuz1210/wsid'
license=(GPL)
depends=(
    'python>=3.9' )
makedepends=(
    git )
optdepends=(
    'python-pyqt5: for gui' )
source=(
    "${pkgname%-git}::git+${url}#tag=${pkgver}" )
b2sums=(SKIP)

package(){
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 wsid -t "${pkgdir}/usr/bin"
}
