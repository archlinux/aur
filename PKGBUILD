# Contributor: polyzen <polycitizen@gmail.com>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>

pkgbase=heavything-bin
pkgname=('rwasa-bin' 'webslap-bin' 'hnwatch-bin' 'dhtool-bin' 'sshtalk-bin')
pkgver=1.21
pkgrel=1
pkgdesc='General purpose x64 Asm library for 2ton products'
arch=('x86_64')
url='https://2ton.com.au/HeavyThing'
license=('GPL3')
source=("$url-$pkgver.tar.gz")
sha256sums=('68e5a8ea5849bc53f3e0f8b17226ecb350ba1bba0798e28390f81b413a09ec98')

package_rwasa-bin () {
  pkgdesc='full featured web server that eclipses nginx'
  url='https://2ton.com.au/rwasa/'
  conflicts=('rwasa')
  cd HeavyThing-$pkgver/rwasa
  install -Dm755 rwasa "$pkgdir"/usr/bin/rwasa
}

package_webslap-bin () {
  pkgdesc='website quality assurance reporting tool'
  url='https://2ton.com.au/webslap/'
  conflicts=('webslap')
  cd HeavyThing-$pkgver/webslap
  install -Dm755 webslap "$pkgdir"/usr/bin/webslap
}

package_hnwatch-bin () {
  pkgdesc='HackerNews API realtime terminal watch/reader'
  url='https://2ton.com.au/hnwatch/'
  conflicts=('hnwatch')
  cd HeavyThing-$pkgver/hnwatch
  install -Dm755 hnwatch "$pkgdir"/usr/bin/hnwatch
}

package_dhtool-bin () {
  pkgdesc='Diffie-Hellman parameter generator/verifier/converter'
  url='https://2ton.com.au/dhtool/'
  conflicts=('dhtool')
  cd HeavyThing-$pkgver/dhtool
  install -Dm755 dhtool "$pkgdir"/usr/bin/dhtool
}

package_sshtalk-bin () {
  pkgdesc='ephemeral multi-person SSH chat'
  url='https://2ton.com.au/sshtalk/'
  conflicts=('sshtalk')
  cd HeavyThing-$pkgver/sshtalk
  install -Dm755 sshtalk "$pkgdir"/usr/bin/sshtalk
}

# vim:set ts=2 sw=2 et:
