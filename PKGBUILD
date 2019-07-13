# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-sans-classic-fonts
pkgver=2.001
pkgrel=1
pkgdesc="Adobe Source Han Sans - Classic Style Chinese Character"
arch=('any')
url="https://github.com/adobe-fonts/source-han-sans"
license=('OFL')
source=(
    'git+https://github.com/redchenjs/source-han-sans-classic.git'
)
md5sums=(
    'SKIP'
)

package() {
    mkdir -p "${pkgdir}"/usr/
    mkdir -p "${pkgdir}"/usr/share/
    mkdir -p "${pkgdir}"/usr/share/fonts/
    mkdir -p "${pkgdir}"/usr/share/fonts/adobe-source-han-sans/

    cp -a "${srcdir}"/source-han-sans-classic/*.otf \
          "${pkgdir}"/usr/share/fonts/adobe-source-han-sans/
}
