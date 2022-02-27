# Maintainer:  <zhaose@Planet>
pkgname=codeblocks-i18n-zh_tw-git
pkgver=8.ad63533
pkgrel=1
epoch=
pkgdesc=""
arch=('any')
url="https://github.com/vongola12324/Code-Blocks-Traditional-Chinese"
license=()
groups=()
depends=('codeblocks')
makedepends=('git')
changelog=
source=("$pkgname"::'git+https://github.com/vongola12324/Code-Blocks-Traditional-Chinese.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm644 "$srcdir/$pkgname/zh_TW.mo" "$pkgdir/usr/share/codeblocks/locale/zh_TW/CodeBlocks.mo"
  
}

# vim:set ts=2 sw=2 et:
