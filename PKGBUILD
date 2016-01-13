# Maintainer: Simon Arjuna Erat (sea), erat.simon@gmail.com
# Contributor: Simon Arjuna Erat (sea), erat.simon@gmail.com

#
#	Variables
#
	# Prj info
	_hkgname=vhs-master
	pkgname=vhs
	pkgdesc="Video Handler Script (VHS) aka ffmpeg-tui"
	license=('GPL3')
	groups=()
	
	# Pkg info
	arch=('any')
	pkgver=2.7.6
	pkgrel=0
	
	# Src info -- As the master branch is used for releases, this is considered 'stable'.
	url="https://github.com/sri-arjuna/vhs"
	source=(https://github.com/sri-arjuna/vhs/archive/master.zip)
md5sums=('0c4659c752381f780b0960707c21c7e2')
	
	# Bld info
	provides=('vhs')
	depends=( 'ffmpeg' )
	# Is there a way to install 'ffmpeg-full' and 'tui' from AUR?
#
#	Functions
#
	package() {
		cd ${srcdir}/${_hkgname}
		./configure --prefix=/usr --chroot=$pkgdir
		./make-install
	}
