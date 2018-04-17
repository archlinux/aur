# Maintainer: giorgian.borca-tasciuc@protonmail.me
# Contributor: Wil Thomason <wbthomason@cs.cornell.edu>
_upstreamname=gonvim
pkgname=gonvim-stable
pkgver=0.22
pkgrel=1
pkgdesc="Neovim GUI written in Golang"
arch=('any')
url="https://github.com/dzhou121/gonvim"
license=('mit')
depends=('neovim' 'qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-svg' 'qt5-declarative' 'qt5-webchannel' 'qt5-webengine')
provides=("${pkgname}" "${_upstreamname}")
conflicts=("${pkgname}" "${_upstreamname}")
source=("https://github.com/dzhou121/gonvim/releases/download/v0.2.2/gonvim-linux.zip")
sha256sums=('f855ffeffee75b39059b3da7ee3d0256b1c53bb8ae6edebe78fedc9b33f4ad09')

package() {
  cd "${_upstreamname}"
  install -Dm 755 "$srcdir/${_upstreamname}/${_upstreamname}" -t "$pkgdir/usr/bin/"
}
