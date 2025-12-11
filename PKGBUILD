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
sha256sums=('8f5d6109fafbbf28800fa24d224e599d9790da0c3afc0c3713ab1607eb0d4eff')
    
package() {
    install -Dm755 "${srcdir}/news-aur-${pkgver}/news.py" "${pkgdir}/usr/bin/news"
}
