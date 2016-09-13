# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=vlc-media-context
_filename_=Media-Context
pkgver=0.8.0
pkgrel=1
_vlcaddnum_=143241
pkgdesc="Displays contextual information about the currently playing media"
url="http://addons.videolan.org/content/show.php/Media+Context?content=143241"
arch=("any")
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

sha1sums=('ea6ee038e18982806f0250ddf3fe4ac668a73f29')
