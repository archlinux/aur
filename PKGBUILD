# Maintainer: WaffleFrisbee <dev@longfam.org>
pkgname=jellyfin-server-openrc
pkgver=1.0
pkgrel=2
pkgdesc="jellyfin server openrc service"
arch=('any')
url='https://aur.archlinux.org/packages/jellyfin-server-openrc'
license=('custom:WTFPL')
depends=('jellyfin-server')
optdepends=('openrc: to make use of the OpenRC initscripts')
source=(
    'jellyfind.initd'
    'LICENSE'
    'jellyfind.install'
)
sha256sums=('147073933ba5b00aac05befb7299073bcff71956824e9284e7f8d0aef3848820'
            'c843583b8a523b4172e54b53721e09d0d852d82e9a548e46fa15b8adb0edce27'
            '9c7a0dba5371f7f083aab624c1cf9920e3f7d6259a40878beddc6e9e62b45795')

package() {
  install -Dm755 ${srcdir}/jellyfind.initd "$pkgdir"/etc/init.d/jellyfind
  install=jellyfind.install
}
