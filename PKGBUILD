# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.1.1
pkgrel=1
pkgdesc='A syntax-highlighting pager for git'
arch=('x86_64')
url='https://github.com/dandavison/delta'
license=('MIT')
depends=('git')
conflicts=('git-delta')
source=(${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb)
sha256sums=('25446decb8e47d74ff5ce0b579014e5ce16c54e49a0f64554cb9debfb33d6b39')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
