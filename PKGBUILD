# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.4.0
pkgrel=1
pkgdesc='A viewer for git and diff output'
arch=('x86_64' 'armv7h')
url='https://github.com/dandavison/delta'
license=('MIT')
conflicts=('git-delta' 'git-delta-git')
source_x86_64=(${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb)
source_armv7h=(${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_armhf.deb)
sha256sums_x86_64=('0c64daa3dacf04937788154bf4439944c159b8ed612fad5f5f2511efa9b218bf')
sha256sums_armv7h=('45a638cf984833c5a6064629343d2268de076c6729258f4f822d614442761a66')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
