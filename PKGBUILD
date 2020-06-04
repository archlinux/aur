# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmeil point com>

_name=groovy
pkgname=groovy-sdk
pkgver=2.5.12
pkgrel=1
pkgdesc='SDK for groovy language'
arch=('x86_64')
url='https://groovy-lang.org/download.html'
license=('Apache')
optdepends=("groovy: the binaries")
source=("https://dl.bintray.com/groovy/maven/apache-${pkgname}-${pkgver}.zip")
options=(!strip)
sha256sums=(9c876d514ccaaab350e7352038cf37c635c68fc7d0864d3676e32c04955f1fe7)

package() {

    install -d "$pkgdir/usr/share/${_name}"
    cp -r "${_name}-${pkgver}/src" "$pkgdir/usr/share/${_name}"
}
