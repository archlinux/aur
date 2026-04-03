# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=abra-bin
_pkgname=abra
pkgver=0.13.0_beta
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
sha256sums_x86_64=('866d5cda85929e99787f0f385d0ab8e83759a051843afcaf6669de70b9999a89')
sha256sums_aarch64=('f39971f50ec3a460009aaaa8e630ed4801627b26571ffb8fb06439390c05da8b')
sha256sums_armv7h=('5f0ff68ca2481cfcbc95cdbb00b1ba9df27c14077568b0fb121bcc9c2534a523')

package() {
	install -Dm0755 abra "$pkgdir/usr/bin/abra"
}
