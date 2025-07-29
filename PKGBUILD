# Maintainer: zotan <aur@zotan.email>

pkgname=runitor-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="A command runner with healthchecks.io integration"
arch=('x86_64' 'aarch64')
url="https://github.com/bdd/runitor"
license=('0BSD')

case "$CARCH" in
	aarch64) _pkgarch="arm64"
sha512sums=('9bbfa71dccb7df0b8e5645341990e303bee3b6a1160e58ba97910a434112d4e4c62f1dec57711affd798bf847ffc03953cadb18a434cfb6384ca133324a0be8f')
		 ;;
	x86_64)  _pkgarch="amd64"
		 ;;
esac

source=("https://github.com/bdd/runitor/releases/download/v${pkgver}/runitor-v${pkgver}-linux-${_pkgarch}")

package() {
  install -D ${srcdir}/runitor-v${pkgver}-linux-${_pkgarch} $pkgdir/usr/bin/runitor
}
