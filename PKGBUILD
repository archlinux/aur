# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-serif-classic-fonts
pkgver=1.001
pkgrel=2
pkgdesc="Adobe Source Han Serif - Classic Style Chinese Character"
arch=('any')
url="https://github.com/adobe-fonts/source-han-serif"
license=('OFL')
source=(
    'git+https://github.com/redchenjs/source-han-serif-classic.git'
)
md5sums=(
    'SKIP'
)

package() {
    mkdir -p "${pkgdir}"/usr/
    mkdir -p "${pkgdir}"/usr/share/
    mkdir -p "${pkgdir}"/usr/share/fonts/
    mkdir -p "${pkgdir}"/usr/share/fonts/adobe-source-han-serif/

    cp -a "${srcdir}"/source-han-serif-classic/*.otf \
          "${pkgdir}"/usr/share/fonts/adobe-source-han-serif/
}
