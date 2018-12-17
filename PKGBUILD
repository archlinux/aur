# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=scenarist-bin
pkgver=0.7.2.rc2a
pkgrel=1
pkgdesc='Screenwriting software, which developed in Russia.'
url='https://kitscenarist.ru'
arch=('x86_64')
license=('GPL3')
conflicts=('scenarist')
depends=('dbus' 'glib2')
source=("https://kitscenarist.ru/downloads/linux/scenarist-setup-${pkgver}_en_amd64.deb")
sha512sums=('6fdca5ed89c9bf1976d30db9f4b8faae3772f6585057bbd676b5311ca0a3fb651f51c6fd0dfff9d0e83a2f4a7809203143a8c8b053e125ed2a8ac69448726b96')
options=('!strip' '!emptydirs')
PKGEXT=.tar

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  chmod g-w -R "${pkgdir}"
}
