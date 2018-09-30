# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=scenarist-bin
pkgver=0.7.2.beta9a
pkgrel=1
pkgdesc='Screenwriting software, which developed in Russia.'
url='https://kitscenarist.ru'
arch=('x86_64')
license=('GPL3')
conflicts=('scenarist')
depends=('dbus' 'glib2')
source=("https://kitscenarist.ru/downloads/linux/scenarist-setup-${pkgver}_en_amd64.deb")
sha512sums=('8f3255d11d50330ce5641153b6e6380ad39b788acc3e8c93f04bd802235244a606e0c46895883c92ae09ede26ca2a88b8b49e5ed0a2add50e31980d3b1f98eaf')
options=('!strip' '!emptydirs')
PKGEXT=.tar

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  chmod g-w -R "${pkgdir}"
}
