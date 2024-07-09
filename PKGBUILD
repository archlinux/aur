#!/bin/bash

# Maintainer: lomonosow <me@lsow.it>
# Maintainer: tbhaxor <tbhaxor@proton.me>

pkgname=auth0-bin
archive=auth0-cli
pkgver=1.4.0
pkgrel=1
pkgdesc="auth0 is the command line to supercharge your development workflow"
arch=('x86_64' 'arm64')
url="https://github.com/auth0/auth0-cli"
license=('MIT')
depends=()
source_x86_64=("${archive}_${pkgver}_x86_64.tar.gz::$url/releases/download/v${pkgver}/${archive}_${pkgver}_Linux_x86_64.tar.gz")
source_arm64=("${archive}_${pkgver}_arm64.tar.gz::$url/releases/download/v${pkgver}/${archive}_${pkgver}_Linux_arm64.tar.gz")

sha256sums_x86_64=('24dc75c3333a73e31fd3a3227f2d77eee0636425c4e6f01d02febebba6a5d0ec')
sha256sums_arm64=('74942aaa8ba32452124072004d103e5433e604e8260d27793d6b5826dce6f681')

package() {
  install -Dm755 "${srcdir}"/auth0 "${pkgdir}"/usr/bin/auth0
}
