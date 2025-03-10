# Maintainer: SIMULATAN <simulatan plus aur at proton dot me>

_pkgname=aoruscontrol
pkgname="$_pkgname-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc="Control Aorus Devices from the Terminal"
arch=(x86_64 aarch64)
url="https://github.com/SIMULATAN/$_pkgname"
license=('MIT')
source_x86_64=("$url/releases/download/$pkgver/AorusControl_Linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/AorusControl_Linux_arm64.tar.gz")
provides=("$_pkgname=${pkgver%%.r*}")
sha256sums_x86_64=('c3ff1daf192a13e5628d9b5b41e6d365636841105b5091993e786c1984fc3f87')
sha256sums_aarch64=('55683b834faee14e4a308ce6850462de7b26a35ab25649a8efe86b9551d0adb8')
conflicts=("$_pkgname")

package() {
	install -vDm755 AorusControl -t "$pkgdir/usr/bin/"
}
