# Maintainer: Onur Alp Akin <onralpakin@gmail.com>
# https://github.com/otuva/PKGBUILDs

pkgname=l5p-kbl-git
pkgver=1.0
pkgrel=2
pkgdesc="Lenovo Legion 5 Pro 2021 Linux Keyboard Light Controller"
arch=('any')
url="https://github.com/imShara/l5p-kbl"
license=('unknown')
depends=('python' 'python-pyusb')
makedepends=('git')
source=("git+${url}")
md5sums=('SKIP')

package() {
    cd ${pkgname%-git}

    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 755 l5p_kbl.py "${pkgdir}/usr/bin/l5p-kbl"
}
