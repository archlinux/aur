#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Contributor:  <tigersoldi at gmail dot com>

pkgname=google-java-format
pkgver=1.11.0
pkgrel=1
pkgdesc='Reformats Java source code to comply with Google Java Style'
url='https://github.com/google/google-java-format'
arch=('any')
license=('Apache')
depends=('java-runtime')
source=(
  "https://github.com/google/google-java-format/releases/download/v$pkgver/$pkgname-$pkgver-all-deps.jar"
  'google-java-format'
)
b2sums=(
  '7050e9a2a13fc38f748c28a90b77492f439dcf9543678d59e2f7d71bd35cf15a43db9487b60661b5f3c424f21df175b954b8860a24176e708540b10f6c81cd36'
  '485e66103e4cea678b009d98600a97bb896ff6c32b390b69cd643296433c63c871b387aebac4a795c478282cb6ac3ced49d05f8ecc5f08e8cae170930891bf0f'
)

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-all-deps.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "$srcdir/google-java-format" "$pkgdir/usr/bin/google-java-format"
}
