# Maintainer: Janosch Dobler <janosch.dobler@gmx.de>
pkgname=rebash
pkgver=v0.1 # gets updated by pre-push hook
pkgrel=1
pkgdesc="bash/shell library/framework"
arch=('x86_64')
url="https://github.com/jandob/rebash"
license=('WTFPL')
depends=('bash' 'sed' 'grep')
makedepends=('git')
source=('git+https://github.com/jandob/rebash.git')
md5sums=('SKIP')

package() {
    mkdir -p "${pkgdir}/usr/lib/rebash"
    install -Dm755 "${srcdir}"/rebash/* "${pkgdir}/usr/lib/rebash/"
}
