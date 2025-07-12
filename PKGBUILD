# Maintainer: Sterophonick
pkgname=atapi-customizations
_pkgname='atapi-customizations'
pkgbase=atapi-mimetypes
pkgver=1
pkgrel=7
pkgdesc='Various Arch Linux customizations that I do :3'
arch=(any)
makedepends=()
source=(x-atapi-mimetypes.xml 51-dolphinbar.rules 51-gamecube-adapter.rules killsteam steam-monitor unfuck_bt pipewire.conf 30-splitlock.conf 30-vm.conf 20-net-timeout.conf hid-steaminput-preload.conf 15-proton-nice.conf memlock.conf)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm644 "$srcdir/x-atapi-mimetypes.xml" "$pkgdir/usr/share/mime/packages/x-atapi-mimetypes.xml"
  install -Dm644 "$srcdir/51-dolphinbar.rules" "$pkgdir/etc/udev/rules.d/51-dolphinbar.rules"
  install -Dm644 "$srcdir/51-gamecube-adapter.rules" "$pkgdir/etc/udev/rules.d/51-gamecube-adapter.rules"
  install -Dm755 "$srcdir/steam-monitor" "$pkgdir/usr/bin/steam-monitor"
  install -Dm755 "$srcdir/unfuck_bt" "$pkgdir/usr/bin/unfuck_bt"
  install -Dm755 "$srcdir/killsteam" "$pkgdir/usr/bin/killsteam"
  install -Dm644 "$srcdir/pipewire.conf" "$pkgdir/etc/pipewire/pipewire.conf.d/51-gamecube-adapter.rules"
  install -Dm644 "$srcdir/30-splitlock.conf" "$pkgdir/etc/sysctl.d/30-splitlock.conf"
  install -Dm644 "$srcdir/30-vm.conf" "$pkgdir/etc/sysctl.d/30-vm.conf"
  install -Dm644 "$srcdir/20-net-timeout.conf" "$pkgdir/etc/sysctl.d/20-net-timeout.conf"
  install -Dm644 "$srcdir/hid-steaminput-preload.conf" "$pkgdir/etc/modules-load.d/hid-steaminput-preload.conf"
  install -Dm644 "$srcdir/15-proton-nice.conf" "$pkgdir/etc/security/rules.d/15-proton-nice.conf"
  install -Dm644 "$srcdir/memlock.conf" "$pkgdir/etc/security/limits.d/memlock.conf"
}
