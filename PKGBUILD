# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=browser-vacuum
pkgver=4
pkgrel=21
pkgdesc='Defragment and clean database files from firefox and chromium based browsers.'
url='https://github.com/skydrome/random/blob/master/shell/browser-vacuum.sh'
license=('WTFPL')
arch=('any')
depends=('sqlite')
install='browser-vacuum.install'
options=('!strip')
source=('https://raw.github.com/skydrome/random/master/shell/browser-vacuum.sh')
sha256sums=('8aaeac6a4bff65bbc8d72ceb61ca6ee0f869563730cb364fa71faf8312fe6e83')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
