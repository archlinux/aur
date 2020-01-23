# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmeil point com>

_name=groovy
pkgname=groovy-sdk
pkgver=2.5.9
pkgrel=1
pkgdesc='SDK for groovy language'
arch=('x86_64')
url='https://groovy-lang.org/download.html'
license=('Apache')
optdepends=("groovy: the binaries")
source=("https://dl.bintray.com/groovy/maven/apache-${pkgname}-${pkgver}.zip")
options=(!strip)
sha256sums=("6660c5e98226faea4de6c191bc3e33eb9159e8f4251d1a38de612a8e2030cae3")

package() {

    install -d "$pkgdir/usr/share/${_name}"
    cp -r "${_name}-${pkgver}/src" "$pkgdir/usr/share/${_name}"
}
