# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-opencc-emoji-symbols
pkgver=0.0.0.20201105
_commit=1c46cdcec9052520ab6cf79e481f3fc1b70b30c8
pkgrel=1
pkgdesc="Rime 输入法 Emoji 与符号滤镜"
arch=('any')
url="https://github.com/rtransformation/rime-opencc_emoji_symbols"
license=('MIT')
# dependency for reverse lookup
depends=('librime' 'rime-prelude')
source=("https://github.com/rtransformation/rime-opencc_emoji_symbols/archive/$_commit/rime-opencc_emoji_symbols-$_commit.tar.gz")
b2sums=('d4c1bd74da18da5665032d1ced6c53384bf686564377aaf1944ff0657c09c6cc7bb213295016bb4fc901b58323d8ad7b40a1437a51d6ffe4ab10f0f980795eaf')

package() {
  cd rime-opencc_emoji_symbols-$_commit
  install -Dm644 es.{json,txt} -t "$pkgdir"/usr/share/rime-data/opencc/
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/rime-opencc-emoji-symbols/
}

# vim:set ts=2 sw=2 et:

