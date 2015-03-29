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
sha256sums=('050b2ce85d5669968aad40d4d3c8a9c140bbaff55a4eb8d03132b4e17645f823')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
