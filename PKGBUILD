# Maintainer: Baron Hou <houbaron@gmail.com>

pkgname=gvm
pkgver=r617.6ecd46d
pkgrel=1
pkgdesc="Go Version Manager"
url="https://github.com/moovweb/gvm"
arch=('any')
license=('MIT')
depends=('bash')
makedepends=('git')

package() {
    rm -rf "${srcdir}/${pkgname}/"
    git clone "https://github.com/moovweb/gvm"
    cd "${srcdir}/${pkgname}/binscripts/"
    bash < gvm-installer
}