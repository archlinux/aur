#!/bin/bash

# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor:  <tigersoldi at gmail dot com>

pkgname=google-java-format
pkgver=1.37.0
pkgrel=1
pkgdesc='Reformats Java source code to comply with Google Java Style'
url='https://github.com/google/google-java-format'
arch=('x86_64')
license=('Apache-2.0')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}_linux-x86-64::https://github.com/google/$pkgname/releases/download/v$pkgver/${pkgname}_linux-x86-64")
sha256sums=('881821ffd1a52b175886c4ebeeacce2ba5b5d7326b52d32a18d384d8a783bd77')

package() {
  install -Dm755 "$srcdir/${pkgname}-${pkgver}_linux-x86-64" "$pkgdir/usr/bin/$pkgname"
}
