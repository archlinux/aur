# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rime-zijinmaa
pkgver=0.0.0.20200813
_commit=1768938f1bd05fa89fc600003dd933343673e405
pkgrel=2
pkgdesc="Zijinmaa input for rime"
arch=('any')
url="https://github.com/redchenjs/rime-zijinmaa"
license=('CCPL:cc-by')
# dependency on dictionary: rime-cantonese
# dependency for reverse lookup: rime-luna-pinyin
depends=('rime-cantonese' 'rime-luna-pinyin')
source=("https://github.com/redchenjs/rime-zijinmaa/archive/$_commit/rime-zijinmaa-$_commit.tar.gz")
sha512sums=('dd755c3ca428dbaae0f047cc71e2bbf0f42980ed382431f1dda978be24d2434a73b786896ae2236a005acc81ac2c444337ab1ec47133f0a20a87f8113c7dccb6')

package() {
    cd $pkgname-$_commit
    install -Dm644 *.yaml -t "$pkgdir/usr/share/rime-data/"
}
