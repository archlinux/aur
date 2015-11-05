# Maintainer: Yuexuan Gu <lastavengers@outlook.com> 

pkgname=drandr
pkgver=1
pkgrel=2
pkgdesc="a dmenu based XRandR frontend"
arch=(any)
license=('GPL2')
url="https://bbs.archlinux.org/viewtopic.php?id=91937"
depends=('ruby' 'dmenu' 'xorg-xrandr')
source=(https://php.radford.edu/~sdellysse/drandr.rb)
sha256sums=('b560dd2ec26a35315d09284e8713152d3be2be5a3f34c9753e3fa80112eb18ba')

package() {
	install -Dm755 "${srcdir}/${pkgname}.rb" "${pkgdir}/usr/bin/${pkgname}"
} 
