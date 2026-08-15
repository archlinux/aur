# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=stigmerge-bin
_pkgname="${pkgname%-bin}"
pkgver=v0.6.3
pkgrel=1
pkgdesc="Stigmergic merging of files over Veilid. Killab33z on the swarm."
arch=('x86_64' 'aarch64')
url="https://github.com/cmars/stigmerge"
license=('MPL-2.0')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source_x86_64=("$_pkgname-$pkgver-$arch-linux.tar.gz::$url/releases/download/$_pkgname-$pkgver/$_pkgname-$arch-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('7d396b44c567fd769f526149a05ab233a7468f5aec94c7df9b8c2ec3fe247d471ed1001ed1f2cf14e143f0f95a536dcca2e2cf66b19c6be400748aec8181cbc7')
source_aarch64=("$_pkgname-$pkgver-$arch-linux.tar.gz::$url/releases/download/$_pkgname-$pkgver/$_pkgname-$arch-unknown-linux-gnu.tar.gz")
sha512sums_aarch64=('7fe306dbba1773c36939d4910e9a5e33299f20d0afcb4f1ff804f6c4a1782c1c064e9114001e8b3dae92cd7156634587f4eaa6f7f41c7a6cfed8a2a3ccccf450')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin"				"$srcdir/$_pkgname-$arch-unknown-linux-gnu/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname"	"$_pkgname-$arch-unknown-linux-gnu/LICENSE"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname"		"$_pkgname-$arch-unknown-linux-gnu/README.md"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname"		"$_pkgname-$arch-unknown-linux-gnu/CHANGELOG.md"
}

