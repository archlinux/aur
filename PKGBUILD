# Maintainer: Pritam Behera <thelearn-tech@proton.me>
pkgname=lsize
pkgver=0.3
_commit="f10106b309fd4e3943ab4b67a9fead73a8c521c6"
pkgrel=1
pkgdesc="A fast CLI tool to print file & DIR size in a Tree like output and more"
arch=('any')
url="https://github.com/thelearn-tech/lsize"
license=('GPL-3.0')	
depends=('python')

source=("${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${_commit}"
    install -Dm755 "lsize.py" "${pkgdir}/usr/bin/${pkgname}"
}
