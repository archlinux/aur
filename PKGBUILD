#!/bin/bash

# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor:  <tigersoldi at gmail dot com>

pkgname=google-java-format
pkgver=1.33.0
pkgrel=2
pkgdesc='Reformats Java source code to comply with Google Java Style'
url='https://github.com/google/google-java-format'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/google/$pkgname/releases/download/v$pkgver/${pkgname}_linux-x86-64")
sha256sums=('968a5a033bd8cf0d42dc8c361c5e26b1cc549245206b937f2e1c4618a5e36865')

package() {
  install -Dm755 "$srcdir/${pkgname}_linux-x86-64" "$pkgdir/usr/bin/$pkgname"
}
