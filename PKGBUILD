# Maintainer: Peter Reschenhofer < peterreschenhofer at gmail dot com >
# Maintainer: gaelic < gaelic at luchmhor dot net>
pkgname=gams
pkgver=26.1.0
pkgrel=1
pkgdesc="The General Algebraic Modeling System (GAMS) is a high-level modeling system for mathematical optimization."
arch=('x86_64')
license=('custom')
url="http://www.gams.com/"
depends=()
conflicts=()

source=("https://d37drm4t2jghv5.cloudfront.net/distributions/${pkgver}/linux/linux_x64_64_sfx.exe")

sha256sums=("1eb8d551ce3489cb10e062566f9b3da7e1e98079d75c692540ff41101c7c024c")

package() {
    install -d ${pkgdir}/{opt/gams,usr/bin}
    cp -r ${srcdir}/gams*_linux_x64_64_sfx/* ${pkgdir}/opt/gams/
    ln -s "/opt/gams/gams" "$pkgdir/usr/bin/gams"
}
