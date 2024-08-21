# Maintainer: GHOST <ghostsrv at duck dot com>
pkgname=rm-improved-bin
_pkgname=rip
pkgver=0.12.0
pkgrel=1
pkgdesc='A safe and ergonomic alternative to rm.'
arch=('x86_64')
url='https://github.com/nivekuil/rip'
license=('GPL-3.0-only')
conflicts=('rip' 'rm-improved')
source=("$_pkgname::$url/releases/download/$pkgver/rip")
sha256sums=('90bd42faa1c0ffe953459ac3501ef6b1455f6f12ff63e1cfb34fcc7560d8ca53')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/local/bin/${_pkgname}"
}
