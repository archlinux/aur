# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=sbctl-initcpio-post-hook
pkgver=1.0
pkgrel=1
pkgdesc="a mkinitcpio post hook to sign uki images with sbctl"
arch=('any')
url="https://aur.archlinux.org/packages/sbctl-initcpio-post-hook"
license=('GPL')
depends=('mkinitcpio' 'sbctl')
source=("sbctl-initcpio-post-hook")

package() {
  install -Dm755 "${srcdir}/sbctl-initcpio-post-hook" "${pkgdir}/usr/lib/initcpio/post/sbctl-initcpio-post-hook"
}

sha256sums=('9cb250ba7ff55486af98f7939f847faf9d59b7ff43986a1c6732404fddedf0c0')
