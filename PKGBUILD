pkgname=pcre-semodule-pacman-hook
pkgver=1.0
pkgrel=1
pkgdesc='Run semodule -B when pcre2 updates.'
arch=('any')
license=('GPL')
source=("pcre-semodule.hook"
)
depends=('policycoreutils' 'pcre2')
install="$pkgname.install"
backup=('etc/pacman.d/hooks/pcre-semodule.hook')
sha512sums=('ddbc3e8c99b67ef300dfa193584efe5aa15e44beda3bba3224cdf3ecffa5b9074b8721b2a232c15f15b47996e683ff933445be1541eb69e279a495b2e724f15f')

package() {
  install -Dm 755 "$srcdir/pcre-semodule.hook" \
    "$pkgdir/etc/pacman.d/hooks/pcre-semodule.hook"
}
