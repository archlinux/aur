# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-mono-classic-fonts
pkgver=1.002
pkgrel=4
pkgdesc="Adobe Source Han Mono - Classic Style Chinese Character"
arch=('any')
url="https://github.com/adobe-fonts/source-han-mono"
license=('OFL')
source=(
    'git+https://github.com/redchenjs/source-han-mono-classic.git'
)
md5sums=(
    'SKIP'
)

package() {
    mkdir -p "${pkgdir}"/usr/
    mkdir -p "${pkgdir}"/usr/share/
    mkdir -p "${pkgdir}"/usr/share/fonts/
    mkdir -p "${pkgdir}"/usr/share/fonts/adobe-source-han-sans/

    cp -a "${srcdir}"/source-han-mono-classic/*.otf \
          "${pkgdir}"/usr/share/fonts/adobe-source-han-sans/
}
