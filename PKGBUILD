# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=firefox-no-reserved-keys-patch
pkgver=1
pkgrel=1
pkgdesc='hot patch Firefox after install or update to un-reserve all key bindings'
arch=(any)
depends=(firefox pacman-contrib perl)
source=(firefox-no-reserved-keys-patch.hook)
sha256sums=('d1bf37f036ec26a42ae7f493daef5b4040af1fdecfb0184128cc1980372a7deb')

package() {
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[0]}
}
