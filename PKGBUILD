# Maintainer: Kelsey <kelsey at the-dreamer dot dev>

pkgname=goodnight
pkgver=1.0.0
pkgrel=1
pkgdesc="Quick shutdown helper"
arch=('x86_64')
url="https://codeberg.org/kelseythedreamer/headspace-repo"
license=('GPL2')
depends=('lua' 'opendoas')
source=("goodnight::https://codeberg.org/kelseythedreamer/headspace-repo/raw/branch/main/app-misc/goodnight/files/goodnight")
sha256sums=('ab55ead4046aecb5a70adbe1887a3bea5aed48328f42eb6c857f249daddb2879')

prepare() {
  sed -i 's|#!/bin/lua|#!/usr/bin/lua|' goodnight
}

package() {
  install -Dm755 goodnight "${pkgdir}/usr/bin/goodnight"
}
