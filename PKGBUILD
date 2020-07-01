# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.2.0
pkgrel=1
pkgdesc='A viewer for git and diff output'
arch=('x86_64' 'armv7h')
url='https://github.com/dandavison/delta'
license=('MIT')
depends=('git')
conflicts=('git-delta')
source_x86_64=(${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb)
source_armv7h=(${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_armhf.deb)
sha256sums_x86_64=('39f11e75bddee1d312c7e61cd96468b48a186f8cc1a9e8012f7a0fc5b9500a91')
sha256sums_armv7h=('bc38e2ee79f60271318c2754f69465d9b3e8539a3b031299e8724dfafed30fea')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
