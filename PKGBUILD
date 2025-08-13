# Maintainer: zotan <aur@zotan.email>

pkgname=runitor-bin
pkgver=1.4.1
pkgrel=2
pkgdesc="A command runner with healthchecks.io integration"
arch=('x86_64' 'aarch64')
url="https://github.com/bdd/runitor"
license=('0BSD')

case "$CARCH" in
	aarch64) _pkgarch="arm64"
sha512sums=('316f6855554c7a3dba53c3d01b8cfcb8dcce09e89b34d3ee90f8b8802243f940048d78f4f4a793daaf51155d2c2856d515060c1c853549a27154333823125bdf')
		 ;;
	x86_64)  _pkgarch="amd64"
sha512sums=('9bbfa71dccb7df0b8e5645341990e303bee3b6a1160e58ba97910a434112d4e4c62f1dec57711affd798bf847ffc03953cadb18a434cfb6384ca133324a0be8f')
		 ;;
esac

source=("https://github.com/bdd/runitor/releases/download/v${pkgver}/runitor-v${pkgver}-linux-${_pkgarch}")

package() {
  install -D ${srcdir}/runitor-v${pkgver}-linux-${_pkgarch} $pkgdir/usr/bin/runitor
}
