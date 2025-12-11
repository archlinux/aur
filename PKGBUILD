# Maintainer: Vedant <testsvedant@gmail.com>

pkgname=news
pkgver=1.0
pkgrel=1
pkgdesc="Terminal CS and AI related news reader with clickable links"
arch=('any')
url="https://github.com/geekyved/news-aur"
license=('MIT')
depends=('python')
source=("https://github.com/GeekyVed/news-aur/releases/download/v1.0/news-v1.0.tar.gz")
sha256sums=('91150e83286278260de0b6838ee4ce5e9eaaf98671efe8bc9916a3a513f0503f')
    
package() {
    install -Dm755 "${srcdir}/news-aur/news.py" "${pkgdir}/usr/bin/news"
}
