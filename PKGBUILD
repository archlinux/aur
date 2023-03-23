# Maintainer: Richard Garber <rg.1029384756@gmail.com>
pkgname=sbsign-refind-initcpio-post-hook
pkgver=1.1
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

sha256sums=('02bc8f3434998583444e4bb48247da3a93461c7ca45f82a8e986886079c277b7')
