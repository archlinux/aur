# Maintainer: izznogoood <ama@getmail.no>

pkgname=startup-settings
pkgver=516860c
pkgrel=1
pkgdesc="Manage Gnome3 startup Apps and Scripts"
arch=('any')
url="https://github.com/hant0508/startup-settings"
license=('UNKNOWN')
depends=('gtk3')
makedepends=('gcc-multilib'
'git')
provides=('startup-settings')
source=("git+https://github.com/hant0508/startup-settings.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  sudo make install
}
