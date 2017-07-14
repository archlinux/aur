# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=rustup-dummy
pkgver=0.0.1
pkgrel=1
pkgdesc='Makes pacman think that rustup, rust, and cargo are installed. (For users who installed via rustup.rs)'
arch=('any')
license=('custom:CC0')
provides=('cargo' 'rust' 'rustup')
source=('https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt')
md5sums=('65d3616852dbf7b1a6d4b53b00626032')

package() {

  install -D -m644 legalcode.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo "Please make sure that you actually have rust installed!"
  echo "If not, run 'curl https://sh.rustup.rs -sSf | sh'"
}
 

