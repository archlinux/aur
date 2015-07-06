# Maintainer: Army <uli.armbruster @t gmail>

pkgname=drandr
pkgver=1
pkgrel=1
pkgdesc="a dmenu based XRandR frontend"
arch=(any)
license=('GPL2')
url="https://php.radford.edu/~sdellysse"
depends=('ruby' 'dmenu' 'xorg-xrandr')
source=(https://php.radford.edu/~sdellysse/drandr.rb)
md5sums=('20792917a24b06700f85a3ab6d6099ab')

build() {
	install -Dm755 "${srcdir}/${pkgname}.rb" "${pkgdir}/usr/bin/${pkgname}"
} 
