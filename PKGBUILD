#!/bin/sh

# Maintainer: Zhuo FENG <fenprace.i@gmail.com>

pkgname=mosdns-cn-bin
pkgver=1.1.2
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

sha256sums_x86_64=('c16154fee00118b888aa0b446ca186dc7f5f584e0f634517c55a1a3264bc1d26')
sha256sums_armv7h=('c97e48ca820e11880c3f337df9594bc09aa5c503b489895722a16fa4b06fee7b')
sha256sums_aarch64=('9d0b2b94ac4cc200f8d7ec152d0767e71438a4c976664c83cda5d1d7afcac733')
