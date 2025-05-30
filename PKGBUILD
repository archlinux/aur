#!/bin/bash

# Maintainer: lomonosow <me@lsow.it>
# Maintainer: tbhaxor <tbhaxor@proton.me>

pkgname=auth0-bin
archive=auth0-cli
pkgver=1.14.1
pkgrel=1
pkgdesc="auth0 is the command line to supercharge your development workflow"
arch=('x86_64' 'arm64')
url="https://github.com/auth0/auth0-cli"
license=('MIT')
depends=()
source_x86_64=("${archive}_${pkgver}_x86_64.tar.gz::$url/releases/download/v${pkgver}/${archive}_${pkgver}_Linux_x86_64.tar.gz")
source_arm64=("${archive}_${pkgver}_arm64.tar.gz::$url/releases/download/v${pkgver}/${archive}_${pkgver}_Linux_arm64.tar.gz")

sha256sums_x86_64=('5c2f6075e97312ae76d026b7050447bd7247e6cbb3594aac8bf0f0a7a6a22a3f')
sha256sums_arm64=('e7d6d8c09cb5f2fae744b7a09d982e8bc4d95e81a9bb1ba418d29cc3d736977b')

package() {
  install -Dm755 "${srcdir}"/auth0 "${pkgdir}"/usr/bin/auth0
}
