# Maintainer: David Birks <david@tellus.space>

pkgname=kube-fzf
pkgver=1.6.3
pkgrel=1
pkgdesc='Command-line fuzzy searching of Kubernetes pods'
arch=(any)
url='https://github.com/thecasualcoder/kube-fzf'
license=(MIT)
depends=('kubectl' 'fzf')
source=("$pkgname-$pkgver::https://github.com/thecasualcoder/kube-fzf/archive/v$pkgver.tar.gz")
sha512sums=('489007b5b516973295d63d405ee90901264fae73bdfbdc6b684b49566436d2267fb38d24e51053677b57307bfb6123b55584c169b9547de956430813693a859d')

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/findpod" "$pkgdir/usr/bin/findpod"
  install -Dm 755 "$srcdir/$pkgname-$pkgver/execpod" "$pkgdir/usr/bin/execpod"
  install -Dm 755 "$srcdir/$pkgname-$pkgver/tailpod" "$pkgdir/usr/bin/tailpod"
  install -Dm 755 "$srcdir/$pkgname-$pkgver/describepod" "$pkgdir/usr/bin/describepod"
  install -Dm 755 "$srcdir/$pkgname-$pkgver/pfpod" "$pkgdir/usr/bin/pfpod"
  install -Dm 755 "$srcdir/$pkgname-$pkgver/kube-fzf.sh" "$pkgdir/usr/bin/kube-fzf.sh"
}
