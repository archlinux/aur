#!/bin/bash

# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor:  <tigersoldi at gmail dot com>

pkgname=google-java-format
pkgver=1.36.1
pkgrel=1
pkgdesc='Reformats Java source code to comply with Google Java Style'
url='https://github.com/google/google-java-format'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/google/$pkgname/releases/download/v$pkgver/${pkgname}_linux-x86-64")
sha256sums=('8dc71663a6c9cb17b02ba9709bfab5c4de59de6f4ac133fd7a1d5a4394b1193b')

package() {
  install -Dm755 "$srcdir/${pkgname}_linux-x86-64" "$pkgdir/usr/bin/$pkgname"
}
