# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: maz-1 <ohmygod19993 at gmail dot com>

_servicename=verify_file
pkgname=obs-service-$_servicename
pkgver=0.1.1
_pkgrel=23.1
pkgrel=1
pkgdesc='An OBS source service: verify files'
arch=(any)
url='https://github.com/openSUSE/'
license=(MIT)
depends=(obs-build)
# Sources are only available on OBS or as source rpm - unfortunately there's no github repo
source=("https://download.opensuse.org/source/distribution/openSUSE-current/repo/oss/suse/src/$pkgname-$pkgver-$_pkgrel.src.rpm")
sha512sums=('f4e466bab574ece06808b872cb2c270b22bd0809cbd14def90e6b9355e353cd31a95b1178f13a11ba26f0c92381ef5a71e28c14fa9853bac1e4f2928e6a694ae')

package() {
    install -Dm755 $_servicename "$pkgdir"/usr/lib/obs/service/$_servicename
    install -Dm644 $_servicename.service "$pkgdir"/usr/lib/obs/service/$_servicename.service
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}


