# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rime-jyutgaan
pkgver=0.0.0.20200811
_commit=d05a6a5eed5e02b16f29ef2de83efd74adf91430
pkgrel=2
pkgdesc="Jyutgaan input for rime"
arch=('any')
url="https://github.com/redchenjs/rime-jyutgaan"
license=('CCPL:cc-by')
# dependency on dictionary: rime-cantonese
# dependency for reverse lookup: rime-luna-pinyin
depends=('rime-cantonese' 'rime-luna-pinyin')
source=("https://github.com/redchenjs/rime-jyutgaan/archive/$_commit/rime-jyutgaan-$_commit.tar.gz")
sha512sums=('43bcf7185d6790b2c066fc0c68c1ae717d2ec76c0ed6cb5c0c12215e53a1cd2f5edd5124d703d889461854f7c210a047b5fe550fd8c54ec7ee19a7ba697fa463')

package() {
  cd "$pkgname-$_commit"

  install -Dm644 jyutgaan.schema.yaml "$pkgdir/usr/share/rime-data/jyutgaan.schema.yaml"
}
