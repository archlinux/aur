# Maintainer: Xuanrui Qi <xuanrui@xuanruiwork>
pkgname=rebuild-initramfs-dracut
pkgver=1.0.0
pkgrel=1
pkgdesc="A helper script to rebuild initramfs images using dracut"
arch=('any')
url="https://github.com/xuanruiqi/rebuild-initramfs-dracut-arch"
license=('MIT')
groups=()
depends=("dracut")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xuanruiqi/${pkgname}-arch/archive/${pkgver}.tar.gz")
sha256sums=('316cbed40a3fe2e4b1470e03e779ef157d6d5f62865b0ad56d664d6f56a8fbc5')

package() {
  cd "${srcdir}/${pkgname}-arch-${pkgver}"

  install -Dm755 rebuild-initramfs "${pkgdir}/usr/bin/rebuild-initramfs"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
