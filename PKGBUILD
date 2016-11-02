# Maintainer: Thomas Scheiblhuber <thomas@scheiblhuber.de>
# Contributor: Joonas Henriksson
# Contributor: Rutger Broekhoff
# Contributor: gatitofeliz at protonmail dot com
# gpg key avaible at gpg --keyserver pgp.mit.edu --recv-keys DB68D18158C19A535A538524507F8DFE0C99485B

pkgname=natron-portable
pkgver=2.1.7
pkgrel=2
arch=('x86_64')
pkgdesc='Video compositing software similar to Nuke and Adobe After Effects, portable snapshot'
url='http://natron.fr/'
license=('GPL')
depends=('ffmpeg' 'p7zip')
optdepends=('blender: for 3d opencolor-io support')
conflicts=('natron')

options=('!strip')
myname=natron-port
source=("natron.desktop" "x-natron.xml" "natronIcon256_linux.png" "natronProjectIcon_linux.png")
source_x86_64=("https://bitbucket.org/juanperez89/natron/downloads/natron-port-2.1.7-2-x86_64.pkg.tar.xz"
               "${myname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz.sig")
md5sums=('5c65b106c295abe0b5346eff18a06767' 'ca5186feb5a7f336517c015f72d0f8c8' '60eb9f97a0ddeab5acda48d15894559a' '475e14142c51d8b545f7cbc4b5426ce2')
sha256sums_x86_64=('d697a3b0557cd2596a04a1ea68002cf1e0b3117939b3a0bd4c039f13aff4b859'
                    'SKIP')
sha384sums_x86_64=('46862f6a9ea43f3e32c41c9c1dd87ac18d36ec11738fc47f12532375ae9462029602b86a18d36fa565922125ef580d8d'
                    'SKIP')
sha512sums_x86_64=('1312b187e0cb7c3b39b50da5e5055a8aebc5569415b5368870909bb58a8efca188e496ad60b6073ee3d50ff3c84a7ef4fd796f6d8dd8ef160990c6fcc87e4eec'
                    'SKIP')
validgpgkeys=('DB68D18158C19A535A538524507F8DFE0C99485B')

package() {
tar xJvf ${srcdir}/${myname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C ${pkgdir}/
}
