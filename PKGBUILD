# Maintainer: Hristo Voyvodov <hristo.voyvodov@hotmail.com>

pkgname=pluto-bin
pkgver=5.15.1
pkgrel=1
pkgdesc='Pluto is a utility to help users find deprecated Kubernetes apiVersions in their code repositories and their helm releases.'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/releases/download/v$pkgver/pluto_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fe523bf36868d6c25dff7833f4efcc3699213578e835b6304d6e5e4346517dbd')

package() {
  install -Dm 755 "$srcdir/pluto" "$pkgdir/usr/bin/pluto"
}
