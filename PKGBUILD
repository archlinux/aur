#!/bin/bash

# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor:  <tigersoldi at gmail dot com>

pkgname=google-java-format
pkgver=1.34.1
pkgrel=1
pkgdesc='Reformats Java source code to comply with Google Java Style'
url='https://github.com/google/google-java-format'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/google/$pkgname/releases/download/v$pkgver/${pkgname}_linux-x86-64")
sha256sums=('e7ced31f265ee7e5dea7140b236a907f56a068202b4a3e5dad857bcb235ec7b0')

package() {
  install -Dm755 "$srcdir/${pkgname}_linux-x86-64" "$pkgdir/usr/bin/$pkgname"
}
