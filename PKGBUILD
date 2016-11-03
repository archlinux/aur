# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>
pkgname=terrahelp
pkgver=0.4.3
pkgrel=1
pkgdesc="Encryption helper for terraform"
url="https://github.com/opencredo/terrahelp"
arch=('x86_64')
license=('apache')
depends=()
makedepends=()
source=("https://github.com/opencredo/terrahelp/releases/download/v${pkgver}/terrahelp-linux-amd64")
md5sums=('c11530e1dd17471e6f70cef526c42ce9')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -m 755 "${srcdir}/terrahelp-linux-amd64" "$pkgdir/usr/bin/terrahelp"
}

# vim:set ts=2 sw=2 et:
