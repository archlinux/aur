# Maintainer: Niels Mentink niels.mentink@gmail.com

pkgname=wpe-cli-bin
_pkgname=wpe-cli
pkgver=0.13.3
pkgrel=1
pkgdesc='An aur package for the wpe-cli'
arch=('x86_64')
url='https://wpengine.com/'
license=('MIT')
provides=('wpe')
conflicts=('wpe')
options=('!strip')
source=("https://s3-us-east-2.amazonaws.com/wpeclibinaries/$_pkgname/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
# source=("${_pkgname}_${pkgver}_linux_amd64.tar.gz")
md5sums=('a99f2ee842a9fba80eccd0d2b79f5c63')

# ${_pkgname}_${pkgver}_linux_amd64.tar.gz
package() {
  install -Dm755 "${srcdir}/wpe" "${pkgdir}/usr/local/bin/wpe"
}
