# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=scanrepo-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="CLI tool that finds secrets accidentally committed to a git repo, eg passwords, private keys"
arch=('x86_64')
url='https://github.com/UKHomeOffice/repo-security-scanner'
license=('MIT')
provides=('scanrepo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/UKHomeOffice/repo-security-scanner/releases/download/${pkgver}/scanrepo-${pkgver}-linux-amd64.tar.gz"
    'LICENSE::https://github.com/UKHomeOffice/repo-security-scanner/raw/master/LICENSE')
sha256sums=('149d374920816c9bafa5289ab0f7e6d6ee4c4495bb7f1cdb3c05ffe7945674cd'
            '9789a1f817c2a2b83f2d990c30896a9016bd2d38424edb7a60077654becf26d0')

package() {
  install -Dm755 scanrepo "${pkgdir}/usr/bin/scanrepo"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}