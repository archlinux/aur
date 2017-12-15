# Maintainer: Gary Hunt	<garysboxAT_Erasethispart_gmailonedotcom>
# Contributor: Thomas Scheiblhuber <thomas@scheiblhuber.de>
# Contributor: Joonas Henriksson
# Contributor: Rutger Broekhoff
# Contributor: gatitofeliz at protonmail dot com
# gpg key avaible at gpg --keyserver pgp.mit.edu --recv-keys DB68D18158C19A535A538524507F8DFE0C99485B

pkgname=natron-portable
pkgver=2.3.4
pkgrel=1
arch=('x86_64')
pkgdesc='Video compositing software similar to Nuke and Adobe After Effects, portable snapshot'
url='http://natron.fr/'
license=('GPL')
depends=('ffmpeg' 'p7zip')
optdepends=('blender: for 3d opencolor-io support')
conflicts=('natron')
install=$pkgname.install
options=('!strip')
myname=natron-port
source=("natron.desktop" "x-natron.xml" "natronIcon256_linux.png" "natronProjectIcon_linux.png")

source_x86_64=("natron-port-2.3.4-1-x86_64.pkg.tar.tgz::https://sourceforge.net/projects/natron/files/Linux/64/releases/Natron-2.3.4-Linux-x86_64bit.tgz/download")



package() {

tar xzf ${srcdir}/${myname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.tgz -C ${pkgdir}/
mkdir -p ${pkgdir}/tmp
mv ${pkgdir}/Natron-2.3.4-Linux-x86_64bit ${pkgdir}/tmp

}

md5sums=('5c65b106c295abe0b5346eff18a06767'
         'ca5186feb5a7f336517c015f72d0f8c8'
         '60eb9f97a0ddeab5acda48d15894559a'
         '475e14142c51d8b545f7cbc4b5426ce2')
md5sums_x86_64=('6191af3cd7cafe62e7cf5d01361d86b5')
