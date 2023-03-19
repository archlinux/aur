# Maintainer: Onur Alp Akin <onralpakin@gmail.com>
# https://github.com/otuva/PKGBUILDs

pkgname=wayback-spn-script-git
pkgver=1.0
pkgrel=2
pkgdesc="a Bash script that asks the Internet Archive Wayback Machine's Save Page Now (SPN) to save live web pages"
arch=('x86_64' 'i686')
url="https://github.com/overcast07/wayback-machine-spn-scripts"
license=('MIT')
makedepends=('git')
source=("git+${url}")
md5sums=('SKIP')

package() {
    cd "wayback-machine-spn-scripts"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 755 spn.sh "${pkgdir}/usr/bin/spn"
}
