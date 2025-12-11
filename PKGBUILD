# Maintainer: Vedant <testsvedant@gmail.com>

pkgname=news
pkgver=1.0
pkgrel=1
pkgdesc="Terminal CS and AI related news reader with clickable links"
arch=('any')
url="https://github.com/geekyved/news-aur"
license=('MIT')
depends=('python')
source=("https://github.com/GeekyVed/news-aur/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('25ee518c92dcd1964846e20375b44df6b0c12b323625d38d860897a480464c7b')
    
package() {
    install -Dm755 "${srcdir}/news-aur-${pkgver}/news.py" "${pkgdir}/usr/bin/news"
}
