# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=abra-bin
_pkgname=abra
pkgver="0.9.0_beta"
_pkgver="0.9.0-beta"
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
sha256sums_x86_64=('f80cc607f1da56b9cf230c4bc2475016e75ed41ae7fb6c765feff0f58abbb99c')
sha256sums_aarch64=('a66ee9eeae56013b0ba50fa08227510923c8f4358262be7569952cb086e3d56d')
sha256sums_armv7h=('a1c158f1ac942e90d897bad5d125e39b32fc8f85b82896527ec5564560ff852b')

package() {
	install -Dm0755 abra "$pkgdir/usr/bin/abra"
	install -Dm0755 kadabra "$pkgdir/usr/bin/kadabra"
}
