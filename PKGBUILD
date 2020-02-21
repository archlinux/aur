# Maintainer: Chris Billington <chrisjbillington@gmail.com>
# Contributor: Runnytu < runnytu at gmail.com >
pkgname=grub-mkconfig-hook
pkgver=1.0
pkgrel=1
pkgdesc="alpm hook to run grub-mkconfig after a kernel install/remove/upgrade"
arch=('any')
url="https://aur.archlinux.org/packages/grub-mkconfig-hook/"
license=('GPL')
depends=('grub')
source=(grub-mkconfig.hook)
sha256sums=('5f64a46b48cfa02d74cc6ad8cf6960696131e22aebe327c48530de9f27dfec48')

package() {
  install -m755 -d "${pkgdir}/usr/share/libalpm/hooks/"
  install -m644 "${srcdir}/grub-mkconfig.hook" "${pkgdir}/usr/share/libalpm/hooks/"
}

