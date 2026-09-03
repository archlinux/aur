# Maintainer: kriskras99 <admin at kriskras99 dot nl>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: algebro <algebro at tuta dot io>

_pkgname='frida'
pkgbase="python-${_pkgname}"
pkgname="${pkgbase}-old"
pkgver=17.17.0
pkgrel=1
pkgdesc='Temporary transition package for the python-frida package-base migration'
arch=('any')
url='https://github.com/frida/frida'
license=('LGPL-2.0-or-later WITH WxWindows-exception-3.1')
depends=("python-${_pkgname}=${pkgver}-${pkgrel}")
source=("COPYING-${pkgver}::https://raw.githubusercontent.com/frida/frida/${pkgver}/COPYING")
b2sums=('1957df7ba5ebe73b9d42f0281e65d176675a233db748d9ec0d386e164fb026815f013c648f6120d89a9f0150eecf04fed04454e28b7199fd9f90ecfcecd56d6d')

package() {
	install -Dm644 "${srcdir}/COPYING-${pkgver}" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
