# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Serge Victor <arch at random dot re>
# Contributor: polyzen <polycitizen at gmail dot com>
pkgbase=heavything
pkgname=('rwasa' 'webslap' 'hnwatch' 'dhtool' 'sshtalk' 'toplip')
pkgver=1.24
pkgrel=1
pkgdesc='A General purpose x64 Asm library for 2ton products'
arch=('x86_64')
makedepends=('fasm')
url='https://2ton.com.au/HeavyThing'
license=('GPL3')
source=("https://2ton.com.au/HeavyThing-$pkgver.tar.gz")
sha256sums=('77bb53d7717d825515f159a3794808e1edf46ca6b515a1686df3dd6b8a94432d')

build () {
  cd "HeavyThing-$pkgver"
  ./assemble_all.sh
}

package_rwasa () {
  pkgdesc='a full featured web server that eclipses nginx'
  url='https://2ton.com.au/rwasa/'
  cd "HeavyThing-$pkgver/rwasa"
  install -Dm755 rwasa "$pkgdir/usr/bin/rwasa"
}

package_webslap () {
  pkgdesc='a website quality assurance reporting tool'
  url='https://2ton.com.au/webslap/'
  cd "HeavyThing-$pkgver/webslap"
  install -Dm755 webslap "$pkgdir/usr/bin/webslap"
}

package_hnwatch () {
  pkgdesc='a HackerNews API realtime terminal watch/reader'
  url='https://2ton.com.au/hnwatch/'
  cd "HeavyThing-$pkgver/hnwatch"
  install -Dm755 hnwatch "$pkgdir/usr/bin/hnwatch"
}

package_dhtool () {
  pkgdesc='a Diffie-Hellman parameter generator/verifier/converter'
  url='https://2ton.com.au/dhtool/'
  cd "HeavyThing-$pkgver/dhtool"
  install -Dm755 dhtool "$pkgdir/usr/bin/dhtool"
}

package_sshtalk () {
  pkgdesc='an ephemeral multi-person SSH chat'
  url='https://2ton.com.au/sshtalk/'
  cd "HeavyThing-$pkgver/sshtalk"
  install -Dm755 sshtalk "$pkgdir/usr/bin/sshtalk"
}

package_toplip () {
  pkgdesc='a command line very strong encryption utility'
  url='https://2ton.com.au/toplip/'
  cd "HeavyThing-$pkgver/toplip"
  install -Dm755 toplip "$pkgdir/usr/bin/toplip"
}

# vim:set ts=2 sw=2 et:
