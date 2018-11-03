# Maintainer: Nicola Salsotto <nicola@cryptolab.net>
pkgname=megasync-instances
pkgver=0.0.1
pkgrel=1
pkgdesc="Provides an utility to run multiple megasync instances with different accounts."
arch=('any')
url="https://github.com/NicoVarg99/MEGA-Instances"
license=('GPL3')
groups=()
depends=('megasync' 'zenity')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("$pkgname::git+https://github.com/NicoVarg99/MEGA-Instances.git")
noextract=()
md5sums=('SKIP')

package() {
  install -m755 -D "$srcdir/$pkgname/mega_instances.sh" "${pkgdir}/usr/bin/${pkgname}"
}
