# Maintainer: XMgVwrR6jCWDM75
pkgname=das-keyboard-q
pkgver=3.2.6
pkgrel=1
pkgdesc="Software for Das Keyboard 4/5Q."
arch=('x86_64')
url=https://www.daskeyboard.io/get-started/software/
license=('unknown')
depends=('libidn')
options=('emptydirs')
source=("https://copr-be.cloud.fedoraproject.org/results/appelond/das-keyboard/fedora-32-x86_64/01362550-das-keyboard-q/das-keyboard-q-3.2.6-01.x86_64.rpm")
md5sums=('14846ffb399f27ccb52cf5e91e5fe9ae')
noextract=('das-keyboard-q-3.2.6-01.x86_64.rpm')

package() {
  bsdtar -xf das-keyboard-q-3.2.6-01.x86_64.rpm -C "${pkgdir}"
}
