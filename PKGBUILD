# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.0.17
pkgrel=1
pkgdesc='A syntax-highlighting pager for git'
arch=('x86_64')
url='https://github.com/dandavison/delta'
license=('MIT')
depends=('git')
conflicts=('git-delta')
source=(${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb)
sha256sums=('ca7c63121273c71a707dcdb3ea5e9421da085af9dbbe8f8aa474f8442b8ae463')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
