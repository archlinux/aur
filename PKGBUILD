# Maintainer: Richard Garber <rg.1029384756@gmail.com>
pkgname=sbsign-refind-initcpio-post-hook
pkgver=1.3
pkgrel=1
pkgdesc="a mkinitcpio post hook to sign kernels for refind and secureboot."
arch=('any')
url="https://aur.archlinux.org/packages/sbsign-refind-initcpio-post-hook"
license=('GPL')
depends=('mkinitcpio' 'refind' 'sbsigntools')
source=("sbsign-refind-initcpio-post-hook")

package() {
  install -Dm755 "${srcdir}/sbsign-refind-initcpio-post-hook" "${pkgdir}/usr/lib/initcpio/post/sbsign-refind-initcpio-post-hook"
}

sha256sums=('80fc21964d681aeca166e223e2617a0ace28708bafec76f948f02054c94d120a')
