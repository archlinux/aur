# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rime-zijinmaa
pkgver=0.0.0.20240204
_commit=1c3afc81442511a1f536e5317bc02311303f1160
pkgrel=1
pkgdesc="Zijinmaa input for rime"
arch=('any')
url="https://github.com/redchenjs/rime-zijinmaa"
license=('CCPL:cc-by')
# dependency on dictionary: rime-cantonese
# dependency for reverse lookup: rime-luna-pinyin
depends=('rime-cantonese' 'rime-luna-pinyin')
source=("https://github.com/redchenjs/rime-zijinmaa/archive/$_commit/rime-zijinmaa-$_commit.tar.gz")
sha512sums=('7e38e5b0218ea3ac5664f153a593d10abbd8a83de31e642d8ad37250193462c19a49ec726686e6f6a5735b1452110227d3b892547366fed35faf5ef8560660a7')

package() {
  cd "$pkgname-$_commit"

  install -Dm644 zijinmaa.schema.yaml "$pkgdir/usr/share/rime-data/zijinmaa.schema.yaml"
}
