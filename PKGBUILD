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
sha512sums=('d10c5268f347a70a2263267b0232e42268554b17ead24ad33ef803cc1297c79694cef0a38d099f752fc97004810fc12da99627d73924576e6f98631667dfdef0')

package() {
  cd "$pkgname-$_commit"

  install -Dm644 zijinmaa.schema.yaml "$pkgdir/usr/share/rime-data/zijinmaa.schema.yaml"
}
