# Maintainer: giorgian.borca-tasciuc@protonmail.com
# Contributor: Wil Thomason <wbthomason@cs.cornell.edu>
pkgname=gonvim
pkgver=0.22
pkgrel=1
pkgdesc="Neovim GUI written in Golang"
arch=('any')
url="https://github.com/dzhou121/gonvim"
license=('mit')
depends=('neovim' 'qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-svg' 'qt5-declarative' 'qt5-webchannel' 'qt5-webengine')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/dzhou121/gonvim/releases/download/v0.2.2/gonvim-linux.zip")
sha256sums=('f855ffeffee75b39059b3da7ee3d0256b1c53bb8ae6edebe78fedc9b33f4ad09')

package() {
  cd "${pkgname}"
  install -Dm 755 "$srcdir/${pkgname}/${pkgname}" -t "$pkgdir/usr/bin/"
}
