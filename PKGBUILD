# Maintainer: polyzen <polycitizen@gmail.com>
# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

pkgbase=heavything-bin
pkgname=('rwasa-bin' 'webslap-bin' 'hnwatch-bin'
         'dhtool-bin' 'sshtalk-bin')
pkgver=1.13
pkgrel=2
pkgdesc='A General purpose x64 Asm library for 2ton products'
arch=('x86_64')
url='https://2ton.com.au/HeavyThing'
license=('GPL3')
source=("$url-$pkgver.tar.gz")
sha256sums=('95e46bcaef8a90257ae2d81330700d72da0bb633c4ff38fbfeaded30c4f106c6')

package_rwasa-bin () {
  pkgdesc='a full featured web server that eclipses nginx'
  url='https://2ton.com.au/rwasa/'
  cd HeavyThing-$pkgver/rwasa
  install -Dm755 rwasa "$pkgdir"/usr/bin/rwasa
}

package_webslap-bin () {
  pkgdesc='A website quality assurance reporting tool'
  url='https://2ton.com.au/webslap/'
  cd HeavyThing-$pkgver/webslap
  install -Dm755 webslap "$pkgdir"/usr/bin/webslap
}

package_hnwatch-bin () {
  pkgdesc='A HackerNews API realtime terminal watch/reader'
  url='https://2ton.com.au/hnwatch/'
  cd HeavyThing-$pkgver/hnwatch
  install -Dm755 hnwatch "$pkgdir"/usr/bin/hnwatch
}

package_dhtool-bin () {
  pkgdesc='A Diffie-Hellman parameter generator/verifier/converter'
  url='https://2ton.com.au/dhtool/'
  cd HeavyThing-$pkgver/dhtool
  install -Dm755 dhtool "$pkgdir"/usr/bin/dhtool
}

package_sshtalk-bin () {
  pkgdesc='An ephemeral multi-person SSH chat'
  url='https://2ton.com.au/sshtalk/'
  cd HeavyThing-$pkgver/sshtalk
  install -Dm755 sshtalk "$pkgdir"/usr/bin/sshtalk
}

# vim:set ts=2 sw=2 et:
