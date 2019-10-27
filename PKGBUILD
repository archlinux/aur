# Maintainer: Ke Liu <spcter119@gmail.com>
pkgname=surface-pro-2017-disable-wireless-aspm
pkgver=1.0
pkgrel=2
pkgdesc='A systemd unit to disable wireless aspm of surface pro 2017'
arch=('i686' 'x86_64')
url="https://github.com/jakeday/linux-surface/issues/572#issuecomment-542115727"
license=('GPL')
groups=('surface')
depends=('systemd' 'bash' 'bc')
provides=($pkgname)
source=(https://launchpadlibrarian.net/405591349/disable_wireless_aspm.sh
        disable-wireless-aspm.service)
md5sums=('944abcf405ee5bcba4c5774eaffbd478'
         'e1d2477943dc3ab0738117e671c50cc8')

package() {
  cd $srcdir
  install -Dm644 disable_wireless_aspm.sh "$pkgdir/usr/share/surface/disable_wireless_aspm.sh"
  install -Dm644 disable-wireless-aspm.service "$pkgdir/usr/lib/systemd/system/disable-wireless-aspm.service"
}

# vim:set ts=2 sw=2 et:
