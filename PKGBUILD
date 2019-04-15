# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=scenarist-bin
pkgver=0.7.2.rc6
pkgrel=1
pkgdesc='A professional screenwriting software.'
url='https://kitscenarist.ru/en/'
arch=('x86_64')
license=('GPL3')
conflicts=('scenarist')
depends=()
source=("https://kitscenarist.ru/downloads/linux/scenarist-setup-${pkgver}_en_amd64.deb")
sha512sums=('356f619c893bf7a517620a4f207ffd93f9702b77acc1766a651a271c95c131767a3e9d0f149d177f62ad4b9f8d8c8eaad6b5dc45599ddf64dbcef988c06050b4')
options=('!strip' '!emptydirs')
PKGEXT=.tar

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  chmod go-w -R "${pkgdir}"
}
