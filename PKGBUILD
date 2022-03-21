#!/bin/sh

# Maintainer: Zhuo FENG <fenprace.i@gmail.com>

pkgname=mosdns-cn-bin
pkgver=1.2.1
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

sha256sums_x86_64=('d10568b6ce40227ace9e0256270d703b6bc2491d10c7d34cbf276603199e8988') 
sha256sums_armv7h=('a68f27173db8d52e92b7e0b457e86f4f3ada2a1f820ca23b81ee040849b65993')
sha256sums_aarch64=('95777c7567a5403c912c1d2c7c5262abf6f6dd0fa090ab43908cc65b0390f7a2k')
