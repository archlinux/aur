#!/bin/bash

# Maintainer: lomonosow <me@lsow.it>
# Maintainer: tbhaxor <tbhaxor@proton.me>

pkgname=auth0-bin
archive=auth0-cli
pkgver=1.26.0
pkgrel=1
pkgdesc="auth0 is the command line to supercharge your development workflow"
arch=('x86_64' 'arm64')
url="https://github.com/auth0/auth0-cli"
license=('MIT')
depends=()
source_x86_64=("${archive}_${pkgver}_x86_64.tar.gz::$url/releases/download/v${pkgver}/${archive}_${pkgver}_Linux_x86_64.tar.gz")
source_arm64=("${archive}_${pkgver}_arm64.tar.gz::$url/releases/download/v${pkgver}/${archive}_${pkgver}_Linux_arm64.tar.gz")

sha256sums_x86_64=('5a7d8179b7189387f4ca9749fdb4e84168f3893ac556663ad17fce57567b3000')
sha256sums_arm64=('39299ed19b071558583d371bbb0437a928cd26493e161d50419f1f3933d60ce3')

package() {
    install -Dm755 "${srcdir}"/auth0 "${pkgdir}"/usr/bin/auth0
}
