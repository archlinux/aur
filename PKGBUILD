# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.3.0
pkgrel=1
pkgdesc='A viewer for git and diff output'
arch=('x86_64' 'armv7h')
url='https://github.com/dandavison/delta'
license=('MIT')
conflicts=('git-delta')
source_x86_64=(${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb)
source_armv7h=(${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_armhf.deb)
sha256sums_x86_64=('c299ce24edeb1c52d0ed7fb61bebd7b7d91d4406c09a4b001aa913cc7d50c3ff')
sha256sums_armv7h=('fcb0883cb041fe507955d064c5df36e3913e6593df5309e956d601cf5628be5c')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
