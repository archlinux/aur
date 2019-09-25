# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: maz-1 <ohmygod19993 at gmail dot com>

_servicename=verify_file
pkgname=obs-service-$_servicename
pkgver=0.1.1
_pkgrel=2.8
pkgrel=2
pkgdesc='An OBS source service: verify files'
arch=(any)
url='https://github.com/openSUSE/'
license=(MIT)
depends=(obs-build)
# Sources are only available on OBS or as source rpm - unfortunately there's no github repo
source=("http://download.opensuse.org/repositories/openSUSE:/Factory/standard/src/$pkgname-$pkgver-$_pkgrel.src.rpm")
sha512sums=('1bfd6a8c8638224e5fdb44651f451886cc30f91f37818e1e1a0f4a4d17d758131d0d9a2ddb670946efa5882ba10d1c2c0d045a73cd623c63b843324332a7213c')

package() {
    install -Dm755 $_servicename "$pkgdir"/usr/lib/obs/service/$_servicename
    install -Dm644 $_servicename.service "$pkgdir"/usr/lib/obs/service/$_servicename.service
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}


