# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=abra-bin
_pkgname=abra
pkgver=0.12.0_beta
_pkgver="${pkgver/_/-}"
pkgrel=1
pkgdesc="the flagship client & command-line for Co-op Cloud"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://docs.coopcloud.tech/abra/"
license=('GPL-3.0-or-later')
provides=('abra')
conflicts=('abra')
source_x86_64=("https://git.coopcloud.tech/coop-cloud/abra/releases/download/$_pkgver/abra_${_pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://git.coopcloud.tech/coop-cloud/abra/releases/download/$_pkgver/abra_${_pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://git.coopcloud.tech/coop-cloud/abra/releases/download/$_pkgver/abra_${_pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('6ff3b36de07547ba29ae705fcc001ad17663572023e2505fb9576f38a608eeab')
sha256sums_aarch64=('b90bbc18765c75e96c4b8ab014a89ba3cc4bda2062ad1f106842123c3399376e')
sha256sums_armv7h=('1eb282c7ee47d1f48fdd7bcda9e64283b061bb4c0f8bc3ffdbdada9356db83ba')

package() {
	install -Dm0755 abra "$pkgdir/usr/bin/abra"
}
