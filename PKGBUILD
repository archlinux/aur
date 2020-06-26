pkgname=extrakto
pkgrel=2
pkgver=0.1
pkgdesc='tmux clipboard copy and output completions'
url='https://github.com/laktak/extrakto'
arch=('x86_64')
license=(MIT)
depends=(python)
source=("git+$url#commit=9c58dc47d8aa28e3c15576178b845c98770c4271")
md5sums=(SKIP)

package() {
  install -Dm755 $pkgname/$pkgname.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
