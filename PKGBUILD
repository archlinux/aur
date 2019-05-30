# Maintainer: David Birks <david@tellus.space>

pkgname=kube-fzf
pkgver=1.5.0
pkgrel=1
pkgdesc='Command-line fuzzy searching of Kubernetes pods'
arch=(any)
url='https://github.com/thecasualcoder/kube-fzf'
license=(MIT)
depends=('kubectl' 'fzf')
source=("$pkgname-$pkgver::https://github.com/thecasualcoder/kube-fzf/archive/v$pkgver.tar.gz")
sha512sums=('36fcc9be40a3666581fe06ebf6ce5ea99732d801cf6e632253ff4ac02025909a34612a920fcb6d0960da80a4ff443cc53a0fb84f16d00d534f43149785ecc182')

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/findpod" "$pkgdir/usr/bin/findpod"
  install -Dm 755 "$srcdir/$pkgname-$pkgver/execpod" "$pkgdir/usr/bin/execpod"
  install -Dm 755 "$srcdir/$pkgname-$pkgver/tailpod" "$pkgdir/usr/bin/tailpod"
  install -Dm 755 "$srcdir/$pkgname-$pkgver/describepod" "$pkgdir/usr/bin/describepod"
  install -Dm 755 "$srcdir/$pkgname-$pkgver/pfpod" "$pkgdir/usr/bin/pfpod"
  install -Dm 755 "$srcdir/$pkgname-$pkgver/kube-fzf.sh" "$pkgdir/usr/bin/kube-fzf.sh"
}
