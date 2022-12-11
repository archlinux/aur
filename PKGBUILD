# Maintainer: éclairevoyant
# Contributor: SilverMight <silver at silvermight dot com>
# Contributor: Bastian Plettner <b.pletttner at archlinux dot info>
# Contributor: thesqrtminus1  <thesqrtminus1 at gmail dot com>
# Contributor: kstolp <kevinstolp at gmail dot com>
# Contributor: kfgz <ffiasd at gmail dot com>

pkgname=y-cruncher
pkgver=0.7.10.9513
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems"
arch=('x86_64')
url="http://www.numberworld.org/$pkgname"
license=('custom')
options=('!strip')
depends=('gcc-libs')
source=("$url/$pkgname%20v$pkgver-static.tar.xz"
        "$pkgname.LICENSE"
)
b2sums=('f8e4907a47a268c19368f313973e554b0e16bfb5d2bc6a510939fb87cbdcc08f5c83c13874c6eb8859910c870b9989dfeae6e3ada461e4b2d93123a6f38e7725'
        '54566d34c40a1ce90c19df611838a54c898f530b361c83998fc68103b108b5da4a03cd5616ffcdec5185c0fea2fc837ca2db337364d0d9c783ccbc746e9d92fc')

package() {
	install -Dm755 "$pkgname v$pkgver-static/Binaries/05-A64 ~ Kasumi" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $pkgname.LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
