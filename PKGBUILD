# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=browser-vacuum
pkgver=4
pkgrel=21
pkgdesc='Defragment and clean database files from firefox and chromium based browsers.'
url='https://github.com/skydrome/random/blob/master/shell/browser-vacuum.sh'
license=('WTFPL')
arch=('any')
depends=('bash' 'sqlite')
install='browser-vacuum.install'
options=('!strip')
source=('https://raw.github.com/skydrome/random/master/shell/browser-vacuum.sh')
sha256sums=('1b8c22256a2832beff53765b4e622198882a50c2676cc417671c8c5883d40a5f')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
