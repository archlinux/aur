# Maintainer: Abhishek Mudgal (abhishek9650)
pkgname=halium-devel
pkgver=0.1
pkgrel=3
pkgdesc='Metapackage to pull all dependencies required to build Halium'
arch=('x86_64')
url='halium.org'
license=('None')
depends=('ffmpeg' 'ninja' 'lzop' 'pngcrush' 'aosp-devel' 'imagemagick' 'simg-tools' 'android-tools' 'abootimg-git' 'qemu' 'qemu-user-static' 'binfmt-qemu-static')

prepare() {
	git clone https://aur.archlinux.org/binfmt-support-git.git
	cd binfmt-support-git
	makepkg -i
}
