#Maintainer: dreamsmasher <dreamsmasher at protonmail dot com>

pkgname=plymouth-theme-arch-wireframe
pkgver=20200125
pkgrel=1
pkgdesc="An animated Plymouth theme based on a render from reddit user /u/RedPandaUA."
arch=('any')
license=('GPL')
depends=('plymouth')

install='plymouth-theme-arch-wireframe.install'
source=('plymouth-theme-arch-wireframe.tar.gz::https://github.com/dreamsmasher/Arch-Wireframe-Plymouth-Theme/releases/download/v1.0/arch-wireframe.tar.gz'
        'plymouth-theme-arch-wireframe.install')
md5sums=('f24b691b705d37d3430848fedb9e897d'
	'a73e98c1e9881922ad2242588a42c33f')
	

package() {
    cd arch-wireframe
    mkdir -p ${pkgname}/usr/share/plymouth/themes/arch-wireframe/animation
    install -Dm644 animated-boot.script ${pkgname}/usr/share/plymouth/themes/arch-wireframe
    install -Dm644 arch-wireframe.plymouth ${pkgname}/usr/share/plymouth/themes/arch-wireframe
    install -Dm644 -d animation ${pkgname}/usr/share/plymouth/themes/arch-wireframe/animation
}

