# SPDX-License-Identifier: AGPL-3.0-or-later
# Maintainer: hyperpolymath <jonathan.jewell@open.ac.uk>
pkgname=bunsenite-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='Nickel configuration file parser with multi-language FFI bindings'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpolymath/bunsenite'
license=('MIT' 'custom:Palimpsest-0.8')
provides=('bunsenite')
conflicts=('bunsenite')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/hyperpolymath/bunsenite/releases/download/v${pkgver}/bunsenite-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/hyperpolymath/bunsenite/releases/download/v${pkgver}/bunsenite-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

# These will be updated by the CI workflow
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 "${srcdir}/bunsenite" "${pkgdir}/usr/bin/bunsenite"
}
