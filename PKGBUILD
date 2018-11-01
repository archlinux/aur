# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=scenarist-bin
pkgver=0.7.2.rc2
pkgrel=1
pkgdesc='Screenwriting software, which developed in Russia.'
url='https://kitscenarist.ru'
arch=('x86_64')
license=('GPL3')
conflicts=('scenarist')
depends=('dbus' 'glib2')
source=("https://kitscenarist.ru/downloads/linux/scenarist-setup-${pkgver}_en_amd64.deb")
sha512sums=('ba791381ffb29fcd2c7de57b2854aedb6b443439d8749cc223c3ee87fc30a45689a13b0e7bc3c381845ddc80206d07b746e03672c626e02f9df333570b414fcb')
options=('!strip' '!emptydirs')
PKGEXT=.tar

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  chmod g-w -R "${pkgdir}"
}
