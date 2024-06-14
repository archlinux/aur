# Maintainer: SIMULATAN <simulatan plus aur at proton dot me>

_pkgname=aoruscontrol
pkgname="$_pkgname-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Control Aorus Devices from the Terminal"
arch=(x86_64 aarch64)
url="https://github.com/SIMULATAN/$_pkgname"
license=('MIT')
source_x86_64=("$url/releases/download/$pkgver/AorusControl_Linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/AorusControl_Linux_arm64.tar.gz")
provides=("$_pkgname=${pkgver%%.r*}")
sha256sums_x86_64=('93f4015f343a43f0419f9c50a6862fdc677ebc7771e8668ebbfcc11ece6006b4')
sha256sums_aarch64=('cd5127bbec08c1c010681b2aad57c8c98a3be4cafdf2fc6dee04b2a326edab98')
conflicts=("$_pkgname")

package() {
	install -vDm755 AorusControl -t "$pkgdir/usr/bin/"
}
