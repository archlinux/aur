pkgname=sprout-git
pkgdesc="C++11/14 constexpr based Containers, Algorithms, Random numbers, Parsing, Ray tracing, Synthesizer, and others."
pkgver=20141113
pkgver() {
    cd "${pkgname}"
    git describe --tags | sed 's/-/.g/'
}
pkgrel=2
license=('custom:boost')
arch=('i686' 'x86_64')
url="http://github.com/bolero-MURAKAMI/Sprout"
depends=('boost')
makedepends=('git')
optdepends=('opencv')
source=('sprout-git::git+http://github.com/bolero-MURAKAMI/Sprout.git')
md5sums=('SKIP')

package() {
    mkdir -p "${pkgdir}/usr/include/"
    cp -r "${pkgname}/sprout" "${pkgdir}/usr/include/sprout" 
}
