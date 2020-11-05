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
b2sums=('b688880c03b0df3fcb8bf7397a4c79f8a7eac76447ee5a0d5e1ff317e47c953963fc77ca427c1767702c77a2e34a1e42ff68f0752befcce783a2523f6bf09796')

package() {
  cd rime-opencc_emoji_symbols-$_commit
  install -Dm644 es.{json,txt} -t "$pkgdir"/usr/share/rime-data/opencc/
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/rime-opencc-emoji-symbols/
}

# vim:set ts=2 sw=2 et:

