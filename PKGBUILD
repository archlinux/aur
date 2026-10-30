#!/bin/bash

# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor:  <tigersoldi at gmail dot com>

pkgname=google-java-format
pkgver=2.0.0
pkgrel=1
pkgdesc='Reformats Java source code to comply with Google Java Style'
url='https://github.com/google/google-java-format'
arch=('x86_64')
license=('Apache-2.0')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}_linux-x86-64::https://github.com/google/$pkgname/releases/download/v$pkgver/${pkgname}_linux-x86-64")
sha256sums=('c351f587e6dd1f11836be7296894ea2ab3bd91847dbd14101f4f04d390380fe9')

package() {
  install -Dm755 "$srcdir/${pkgname}-${pkgver}_linux-x86-64" "$pkgdir/usr/bin/$pkgname"
}
