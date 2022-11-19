# Maintainer: David Phillips <dbphillipsnz gmail>

_script=make-anaglyph
pkgname=gimp-plugin-${_script}
pkgver=1
pkgrel=1
pkgdesc="Gimp plugin to create stereoscopic 3D anaglyph photos from a stereo pair"
arch=('any')
license=('GPL2')
url="http://registry.gimp.org/node/6527"
depends=('gimp')
source=("https://github.com/pixlsus/registry.gimp.org_static/raw/master/registry.gimp.org/files/script-fu-${_script}.scm")
sha256sums=('17891b9e7148c97a5e7497d9afcbc20271203321d95ff3b87a054e7a9dd6f770')

package() {
	local sname="script-fu-${_script}.scm"
	install -D "${srcdir}/${sname}" "${pkgdir}/usr/share/gimp/2.0/scripts/${sname}"
}
