# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-serif-classic-fonts
pkgver=1.001
pkgrel=2
pkgdesc='Adobe Source Han Serif - Classic Style Chinese Character'
arch=('any')
url='https://github.com/redchenjs/source-han-serif-classic/'
license=('OFL')
source=(
    'git+https://github.com/redchenjs/source-han-serif-classic.git'
)
md5sums=(
    'SKIP'
)

package() {
    install -dm 755 ${pkgdir}/usr/share/fonts/adobe-source-han-serif/
    install -Dm 644 ${srcdir}/source-han-serif-classic/*.otf \
                    ${pkgdir}/usr/share/fonts/adobe-source-han-serif/
}
