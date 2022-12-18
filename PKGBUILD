# Maintainer: ShutSentry <shutsentry@nospam.com>
pkgname=shutsentry
pkgver=2.5
pkgrel=1
pkgdesc="ShutSentry is a virtual dead-man-switch that protects computers from unauthorized physical access, by presenting an on-screen password-challenge prompt at regular time intervals, and/or reacting to other trigger events like USB/Bluetooth device changes."
arch=(x86_64)
url="https://gitlab.com/shutsentry/shutsentry"
license=('GPL')
depends=(gtk3)
makedepends=(git make)
optdepends=()
provides=(shutsentry)
source=('git+https://gitlab.com/shutsentry/shutsentry.git')
md5sums=('SKIP')

build() {
	cd shutsentry
	
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/applications"
	install -m 755 shutsentry/Src/Linux/shutsentry "${pkgdir}/usr/bin"
	install shutsentry/Src/Linux/shutsentry.desktop "${pkgdir}/usr/share/applications"
}
