# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-classic-fonts
pkgver=1.0.0
pkgrel=2
pkgdesc="Adobe Source Han Fonts with Classic Style Chinese Character"
arch=('any')
url="https://github.com/adobe-fonts/"
license=('OFL')
source=(
    'git+https://github.com/redchenjs/source-han-serif-classic.git'
    'git+https://github.com/redchenjs/source-han-sans-classic.git'
    'git+https://github.com/redchenjs/source-han-mono-classic.git'
)
md5sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    mkdir -p "${pkgdir}"/usr/
    mkdir -p "${pkgdir}"/usr/share/
    mkdir -p "${pkgdir}"/usr/share/fonts/

    mkdir -p "${pkgdir}"/usr/share/fonts/adobe-source-han-serif/
    mkdir -p "${pkgdir}"/usr/share/fonts/adobe-source-han-sans/
    mkdir -p "${pkgdir}"/usr/share/fonts/adobe-source-han-mono/

    cp -a "${srcdir}"/source-han-serif-classic/*.otf \
          "${pkgdir}"/usr/share/fonts/adobe-source-han-serif/
    cp -a "${srcdir}"/source-han-sans-classic/*.otf \
          "${pkgdir}"/usr/share/fonts/adobe-source-han-sans/
    cp -a "${srcdir}"/source-han-mono-classic/*.otf \
          "${pkgdir}"/usr/share/fonts/adobe-source-han-mono/
}
