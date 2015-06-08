# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=vlc-media-context
_filename_=Media-Context
pkgver=0.7.0
pkgrel=1
pkgdesc="Displays contextual information about the currently playing media"
_vlcaddnum_=143241
arch=("any")
url="http://addons.videolan.org/content/show.php/Media+Context?content=143241"
license=("GPL3")
depends=("vlc>=2.0.1" lua)
options=(!emptydirs)
#source=(http://dl.dropbox.com/u/106000/Programming/Lua/${_filename_}/${_filename_}.lua)
source=(http://addons.videolan.org/CONTENT/content-files/${_vlcaddnum_}-${_filename_}.lua)

package() {
	cd "${srcdir}"
	
	#install -m 644 -D ${_filename_}.lua ${pkgdir}/usr/lib/vlc/lua/extensions/${_filename_}.lua
	install -m 644 -D ${_vlcaddnum_}-${_filename_}.lua ${pkgdir}/usr/lib/vlc/lua/extensions/${_filename_}.lua
}

sha1sums=('8e69e9083be5e617db616f73f3a8c5f6ce3afcdb')
