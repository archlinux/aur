# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.111
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.111-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.111-x86_64")
sha512sums=('f42b519c1fa19165fd867267eb01b0a8a9f9c715bf8013216dda58d5b42d265776186392095797f3beca04f8cedf9e9bea72ea3095188e74e142e5b41aa57e04')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.111-x86_64" "$pkgdir/usr/bin/agentics-companion"
}
