# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Maintainer: polyzen <polycitizen@gmail.com>

pkgbase=heavything-bin
pkgname=('rwasa-bin' 'webslap-bin' 'hnwatch-bin'
         'dhtool-bin' 'sshtalk-bin' 'toplip-bin')
pkgver=1.13
pkgrel=1
pkgdesc='A General purpose x64 Asm library for 2ton products'
arch=('x86_64')
url='https://2ton.com.au/HeavyThing'
license=('GPL3')
source=("$url-$pkgver.tar.gz")
sha256sums=('95e46bcaef8a90257ae2d81330700d72da0bb633c4ff38fbfeaded30c4f106c6')

package_rwasa-bin () {
  cd HeavyThing-$pkgver/rwasa
  install -Dm755 rwasa "$pkgdir"/usr/bin/rwasa
}

package_webslap-bin () {
  cd HeavyThing-$pkgver/webslap
  install -Dm755 webslap "$pkgdir"/usr/bin/webslap
}

package_hnwatch-bin () {
  cd HeavyThing-$pkgver/hnwatch
  install -Dm755 hnwatch "$pkgdir"/usr/bin/hnwatch
}

package_dhtool-bin () {
  cd HeavyThing-$pkgver/dhtool
  install -Dm755 dhtool "$pkgdir"/usr/bin/dhtool
}

package_sshtalk-bin () {
  cd HeavyThing-$pkgver/sshtalk
  install -Dm755 sshtalk "$pkgdir"/usr/bin/sshtalk
}

package_toplip-bin () {
  cd HeavyThing-$pkgver/toplip
  install -Dm755 toplip "$pkgdir"/usr/bin/toplip
}

# vim:set ts=2 sw=2 et:
