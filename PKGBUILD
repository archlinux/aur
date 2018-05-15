# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=scenarist-bin
pkgver=0.7.2.beta7
pkgrel=1
pkgdesc='Screenwriting software, which developed in Russia.'
url='https://kitscenarist.ru'
arch=('x86_64')
license=('GPL3')
conflicts=('scenarist')
depends=('dbus' 'glib2')
source=("https://kitscenarist.ru/downloads/linux/scenarist-setup-${pkgver}_en_amd64.deb")
sha512sums=('b54e0b5222b49efc4c4c351aa028e7419a7f5bdd8212842bca141402ed2f132bfc4abccb83a14f2cb7c44e16b681781fe0e6b1622ac2ea8d23652181ed6fde15')
options=('!strip' '!emptydirs')
PKGEXT=.tar

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  chmod g-w -R "${pkgdir}"
}
