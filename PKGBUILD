# Maintainer: Mark Crichton <mark.cricht0n@icloud.com>

pkgname=mallet-tunnel-bin
pkgver=0.0.4
pkgrel=2
pkgdesc="TCP tunnel that works like VPN"
arch=('i386' 'x86_64')
url="https://github.com/ryotarai/mallet"
license=('unknown')
provides=('mallet-tunnel')
conflicts=('mallet-tunnel')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/ryotarai/mallet/releases/download/v$pkgver/mallet_linux_x86_64.tar.gz")
source_i386=("$pkgname-$pkgver.tar.gz::https://github.com/ryotarai/mallet/releases/download/v$pkgver/mallet_linux_i386.tar.gz")

sha256sums_x86_64=("ebbec83ae9b0b2ac901f8e67390907de5f84d69fcb795d4828293220bc98b3e3")
sha256sums_i386=("e929ed8ab0d13a414ddd43f229b916764324f5a3e46feea8a50de5a6533cc633")

package() {
  install -D -m755 "mallet" "$pkgdir/usr/bin/mallet"
}
