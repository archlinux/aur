# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=abra-bin
_pkgname=abra
pkgver=0.10.1_beta
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
sha256sums_x86_64=('dc681b06b77ea5e037290ca810cc0db59554543d8d971cd8768481167bb6549a')
sha256sums_aarch64=('0f69130d28b230085928ae9490e950aca9bd73ebee45f51af1fba275b1e370f8')
sha256sums_armv7h=('b527f194f109f0a69a3adaed1201e5be57b6c089adb234f13d55bc0bb0ec13b4')

package() {
	install -Dm0755 abra "$pkgdir/usr/bin/abra"
	install -Dm0755 kadabra "$pkgdir/usr/bin/kadabra"
}
