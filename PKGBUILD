# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.1.1
pkgrel=1
pkgdesc='A syntax-highlighting pager for git'
arch=('x86_64' 'armv7h')
url='https://github.com/dandavison/delta'
license=('MIT')
depends=('git')
conflicts=('git-delta')
source_x86_64=(${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb)
source_armv7h=(${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_armhf.deb)
sha256sums_x86_64=('25446decb8e47d74ff5ce0b579014e5ce16c54e49a0f64554cb9debfb33d6b39')
sha256sums_armv7h=('39e388727a07c8e816a17d14e09cf8a6dc2f8e7cd8dc2c38b44d3f55e33034c1')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
