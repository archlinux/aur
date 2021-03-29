# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.7.1
pkgrel=1
pkgdesc='A viewer for git and diff output'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/dandavison/delta'
license=('MIT')
provides=('git-delta')
conflicts=('git-delta' 'git-delta-git')
source_i686=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_i386.deb")
source_x86_64=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_amd64.deb")
source_armv7h=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_armhf.deb")
source_aarch64=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_arm64.deb")
sha256sums_i686=('f0f4bf0cf436b43cc79c244802e50f5ada1e2c1697958f9928de7879c9c89dd3')
sha256sums_x86_64=('3ea488ee7a5de319108a01ab2828eb0cba775f62d60b41cc33d050216789d933')
sha256sums_armv7h=('568fb97e181f5c46cc99b41f9aa34b3cee574c6101f6f9e92d2d31c3214739f8')
sha256sums_aarch64=('ed404907527be246e0b9c1d09118a64f3f5313947f4fdd503b0cce4fbc3c3ae4')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
