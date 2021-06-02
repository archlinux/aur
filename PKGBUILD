# Maintainer: Samuel Williams

pkgname=chruby-fish-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Thin wrapper around chruby to make it work with the Fish shell"
arch=(any)
url="https://github.com/ioquatix/chruby-fish"
license=('MIT')
depends=('chruby' 'fish')
provides=('chruby-fish')
conflicts=('chruby-fish')

source=("https://github.com/ioquatix/chruby-fish/archive/v${pkgver}.tar.gz")
sha256sums=('1cf7f5b5075204dd28503088698f88942002cad579ddad6946ba78ab676f2dcf')

package() {
  cd "${srcdir}/chruby-fish-${pkgver}"

  make PREFIX="${pkgdir}/usr" install >/dev/null
}

