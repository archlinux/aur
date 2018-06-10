# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=vlc-media-context
_filename_=Media-Context
pkgver=0.8.1
pkgrel=1
pkgdesc="Displays contextual information about the currently playing media"
url="http://addons.videolan.org/content/show.php/Media+Context?content=143241"
arch=("any")
license=("GPL3")
depends=("vlc>=3.0.1" lua)
options=(!emptydirs)
source=(http://public.files.xavion.name/Software/${_filename_}/${_filename_}.lua)

package() {
	cd "${srcdir}"

	install -m 644 -D ${_filename_}.lua ${pkgdir}/usr/lib/vlc/lua/extensions/${_filename_}.lua
}

sha1sums=('31b401ab2f364196a2b6cf0a315010c26141ab2c')
