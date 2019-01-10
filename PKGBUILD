# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=scenarist-bin
pkgver=0.7.2.rc4
pkgrel=1
pkgdesc='Screenwriting software, which developed in Russia.'
url='https://kitscenarist.ru'
arch=('x86_64')
license=('GPL3')
conflicts=('scenarist')
depends=('dbus' 'glib2')
source=("https://kitscenarist.ru/downloads/linux/scenarist-setup-${pkgver}_en_amd64.deb")
sha512sums=('f4313f8f9a575226bf15189830fd603401e99a2879ba8a893938c1a28a89d8ed0280d3c41fc256f60b9e4d75729674d8b8040a2140001d50a440884d5e2ee795')
options=('!strip' '!emptydirs')
PKGEXT=.tar

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  chmod g-w -R "${pkgdir}"
}
