# Maintainer: 
# LocalSend CLI - https://localsend.org/

pkgname=localsend-cli-bin
pkgver=1.18.2
pkgrel=1
pkgdesc="An open-source cross-platform alternative to AirDrop (CLI version)"
arch=('x86_64' 'aarch64')
url="https://github.com/localsend/localsend"
license=('AGPL-3.0-only')
depends=('glibc')

case "${CARCH}" in
  x86_64)
    source=("https://github.com/localsend/localsend/releases/download/v${pkgver}/LocalSend-CLI-${pkgver}-linux-x86-64.tar.gz")
    sha256sums=('f5a986e0b4701b9aafeb9747225a2f3e314e97aba61b3dd7c9d076226f512b08')
    ;;
  aarch64)
    source=("https://github.com/localsend/localsend/releases/download/v${pkgver}/LocalSend-CLI-${pkgver}-linux-arm-64.tar.gz")
    sha256sums=('b003e9837743470f7a423ca1205e664031ce3d2e865acc692f3e47577ea93f6d')
    ;;
esac

build() {
  :
}

package() {
  install -Dm755 "$srcdir/localsend-cli" -t "$pkgdir/usr/bin"
}
