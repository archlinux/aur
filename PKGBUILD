# Maintainer: Gary Hunt	<garysboxAT_Erasethispart_gmailonedotcom>
# Contributor: Thomas Scheiblhuber <thomas@scheiblhuber.de>
# Contributor: Joonas Henriksson
# Contributor: Rutger Broekhoff
# Contributor: gatitofeliz at protonmail dot com
# gpg key avaible at gpg --keyserver pgp.mit.edu --recv-keys DB68D18158C19A535A538524507F8DFE0C99485B

pkgname=natron-portable
pkgver=2.3.2
pkgrel=2
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

source_x86_64=("${srcdir}/natron-port-2.3.2-2-x86_64.pkg.tar.tgz::https://sourceforge.net/projects/natron/files/Linux/64/releases/Natron-2.3.2-Linux-x86_64bit.tgz/download")



package() {

tar xzf ${srcdir}/${myname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.tgz -C ${pkgdir}/
mkdir -p ${pkgdir}/tmp
mv ${pkgdir}/Natron-2.3.2-Linux-x86_64bit ${pkgdir}/tmp

}
md5sums=('5c65b106c295abe0b5346eff18a06767'
         'ca5186feb5a7f336517c015f72d0f8c8'
         '60eb9f97a0ddeab5acda48d15894559a'
         '475e14142c51d8b545f7cbc4b5426ce2')
md5sums_x86_64=('96ed725dc472fe778ff9030dceae621c')
sha512sums=('7d190bbbb43fc5aef5a204bbb4abb4cef039a36fc38ede54d310ff77e335587cb4e14943bfc7497005a2d42e9a71a4f7b58d942120a1bab45264043f2f9447f7'
            '1dddf35b232345df38b930db70c50f5f7ec814ff81489ecb45e7ebda69fe00e5ceee9c0d2573740b41f2bd9ea29ffe01c4df2370a6f2c510cfab36b4ce0b2e1a'
            'c00522ac142b52e444cc015478817b73e9c3dbcab8a1b9c3d8e5ca11c0d3a2560a2cfebb952a347e1ba181ae69592a02860872fdac2f55b47b07e75c9238b97f'
            'eecccebf9a9f2cb88e4294bafe81ccb7fe3ccf02b0e4989a0fb1115184db32e2808ac0b5fe95df9434e3e07ae05339d08fa74dd5c5273ee127c6f5d624663102')
sha512sums_x86_64=('e8062a62db50bc86801af8e3dc1eca73ba273c67326bf0fdfda18b0681d370be681fdcd19455ab2353070158b2e51a7588a3ed11093bed1da2d5b7d1cd1d6fae')
