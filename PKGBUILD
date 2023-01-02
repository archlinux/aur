# Maintainer: éclairevoyant
# Contributor: SilverMight <silver at silvermight dot com>
# Contributor: Bastian Plettner <b.pletttner at archlinux dot info>
# Contributor: thesqrtminus1  <thesqrtminus1 at gmail dot com>
# Contributor: kstolp <kevinstolp at gmail dot com>
# Contributor: kfgz <ffiasd at gmail dot com>

pkgname=y-cruncher
pkgver=0.7.10.9513
pkgrel=2
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems"
arch=('x86_64')
url="http://www.numberworld.org/$pkgname"
license=('custom')
options=('!strip')
depends=('gcc-libs' 'numactl' 'tbb')
source=("$url/$pkgname%20v$pkgver-dynamic.tar.xz"
        "$pkgname.LICENSE"
)
b2sums=('6812bfefc3ea0645c36588338d8887c48e03f74f86f7c73824d76a908048e52762083d37d0e364d0dc73e2cbddc9717e6ea0f39a5e76c56ea567484430d6f291'
        '54566d34c40a1ce90c19df611838a54c898f530b361c83998fc68103b108b5da4a03cd5616ffcdec5185c0fea2fc837ca2db337364d0d9c783ccbc746e9d92fc')

package() {
	install -Dm755 "$pkgname v$pkgver-dynamic/Binaries/05-A64 ~ Kasumi" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $pkgname.LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
