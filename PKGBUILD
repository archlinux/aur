# Maintainer: Hristo Voyvodov <hristo.voyvodov@hotmail.com>

pkgname=pluto-bin
pkgver=5.16.0
pkgrel=0
pkgdesc='Pluto is a utility to help users find deprecated Kubernetes apiVersions in their code repositories and their helm releases.'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/releases/download/v$pkgver/pluto_${pkgver}_linux_amd64.tar.gz")
sha256sums=('be4acee7b91bcfc1d853b8f0eab289ff9bea96669d516d2c7e6d774c5e988fb4')

package() {
  install -Dm 755 "$srcdir/pluto" "$pkgdir/usr/bin/pluto"
}
