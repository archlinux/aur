#!/bin/sh

# Maintainer: Zhuo FENG <fenprace.i@gmail.com>

pkgname=mosdns-cn-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A DNS forwarder"
license=("GPL3")
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/IrineSistiana/mosdns-cn"
optdepends=('v2ray-domain-list-community: geosite.dat'
            'v2ray-geoip: geoip.dat'
            'v2ray-rules-dat-git: geosite.dat & geoip.dat')
provides=("mosdns-cn")
conflicts=("mosdns-cn")

source_x86_64=("$pkgname-$pkgver.zip::https://github.com/IrineSistiana/mosdns-cn/releases/download/v$pkgver/mosdns-cn-linux-amd64.zip")
source_armv7h=("$pkgname-$pkgver.zip::https://github.com/IrineSistiana/mosdns-cn/releases/download/v$pkgver/mosdns-cn-linux-arm-7.zip")
source_aarch64=("$pkgname-$pkgver.zip::https://github.com/IrineSistiana/mosdns-cn/releases/download/v$pkgver/mosdns-cn-linux-arm64.zip")

package() {
  install -Dm755 mosdns-cn "$pkgdir/usr/bin/mosdns-cn"
}

sha256sums_x86_64=('43af58f7673f510a8003f29c26a0bc37e1b4a1d248f524e8e8bdb18fbb126e73') 
sha256sums_armv7h=('3bea67399f86771b232a81b59ee216fffe5be18d38184e78c9450a3d650d0115')
sha256sums_aarch64=('10c5a6dc416d22fc819a72e7887f710f870969cb8de604160d746e762301d3a2')
