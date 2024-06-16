# Maintainer: Christian Cwienk <ccwienk@dr1fter.de>

pkgname=ocm-cli
pkgver=0.11.0
pkgrel=1
pkgdesc='Open Component Model (OCM) Command Line Client'
arch=('x86_64')
url='https://github.com/open-component-model/ocm'
license=('Apache-2.0')
source=("https://github.com/open-component-model/ocm/releases/download/v${pkgver}/ocm-${pkgver}-linux-amd64.tar.gz")
noextract=()
b2sums=('c87cb3197011eb507c93b3daad1f82f847a3fdc9123044bcc37aca6f0155a97d09b13b9774f0d1e5e80e782a1b3086167d8b81e48f00329e969e3c3f24330eec')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/ocm" "$pkgdir/usr/bin/ocm"
}
