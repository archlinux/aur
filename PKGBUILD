#!/bin/sh

# Maintainer: Zhuo FENG <fenprace.i@gmail.com>

pkgname=mosdns-cn-bin
pkgver=1.1.1
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

sha256sums_x86_64=('12192ac186a9fa3064fdb1973611b3db8385f4e05be16a65c059fc4fff5ea675')
sha256sums_armv7h=('5916d67bfcc4e23a8fd2fbd4895f963408b10ba5775c6bb301d3d01db34c4f9f')
sha256sums_aarch64=('7f94486b26f5de996fd2ae912ac49aebced29890171129d42e731c39845b5352')
