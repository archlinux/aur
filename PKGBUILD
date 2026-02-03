#!/bin/bash

# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor:  <tigersoldi at gmail dot com>

pkgname=google-java-format
pkgver=1.34.0
pkgrel=1
pkgdesc='Reformats Java source code to comply with Google Java Style'
url='https://github.com/google/google-java-format'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/google/$pkgname/releases/download/v$pkgver/${pkgname}_linux-x86-64")
sha256sums=('db42b93680e29efdb89683955e183690abc6f6127cfe382a4dac699c8592dd36')

package() {
  install -Dm755 "$srcdir/${pkgname}_linux-x86-64" "$pkgdir/usr/bin/$pkgname"
}
