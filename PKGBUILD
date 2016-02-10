# Maintainer: zfo <zfoofz1@gmail.com>
pkgname=gcsfuse
_pkgname=gcsfuse
pkgver=0.16
pkgrel=1
pkgdesc="A user-space file system for interacting with Google Cloud Storage"
url="https://github.com/GoogleCloudPlatform/gcsfuse"
arch=('i686' 'x86_64')
license=('APACHE')
makedepends=('git' 'go')
source=()
sha256sums=()

build() {
  GOPATH="$srcdir" go get -v -u github.com/googlecloudplatform/gcsfuse
}

package() {
  cd "$srcdir"
  install -Dm0755 bin/gcsfuse "${pkgdir}/usr/bin/gcsfuse"
}

# vim:set ts=2 sw=2 et:
