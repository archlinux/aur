# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=abra-bin
_pkgname=abra
pkgver=0.11.0_beta
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
sha256sums_x86_64=('07cbb647ffead6f3ade9c508cba75f675d52f955eb8440363374af266903dd2f')
sha256sums_aarch64=('4b9665a7592f88f92f9e722fa641d550439d6f3c83269af25778adeec71f01bb')
sha256sums_armv7h=('371c1669ca7c5e729b878280ca5924379eeeb451b357eb7fae60d93e17d0d57e')

package() {
	install -Dm0755 abra "$pkgdir/usr/bin/abra"
	install -Dm0755 kadabra "$pkgdir/usr/bin/kadabra"
}
