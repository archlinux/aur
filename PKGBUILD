# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.0.18
pkgrel=1
pkgdesc='A syntax-highlighting pager for git'
arch=('x86_64')
url='https://github.com/dandavison/delta'
license=('MIT')
depends=('git')
conflicts=('git-delta')
source=(${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb)
sha256sums=('7ed5e452b9a07c2311aefc124ef7e6a54efc0dc4f7004a4b7d9e3f3a537abc2e')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
