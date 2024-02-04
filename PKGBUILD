# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rime-zijinmaa
pkgver=0.0.0.20240204
_commit=c425c0bf8b8a7fb6936596b8051efce91aa54287
pkgrel=1
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
  cd "$pkgname-$_commit"

  install -Dm644 zijinmaa.schema.yaml "$pkgdir/usr/share/rime-data/zijinmaa.schema.yaml"
}
