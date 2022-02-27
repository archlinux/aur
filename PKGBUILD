#!/bin/sh

# Maintainer: Zhuo FENG <fenprace.i@gmail.com>

pkgname=mosdns-cn-bin
pkgver=1.1.10
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

sha256sums_x86_64=('eb7f70da344129ba6c81a00835b6f5197cfa3de4396ce1ec1207eb2e1c46e7ee')
sha256sums_armv7h=('27765525d7465802514761f39ea220f7cf844efba7ae346306789a826a4669b5') 
sha256sums_aarch64=('97085401807a515c01f1f32ff57a7c5bee80964c51fde909c0899e312cd6ba03')
