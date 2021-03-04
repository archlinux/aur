# Maintainer: Xuanrui Qi <xuanrui@xuanruiwork>
pkgname=rebuild-initramfs-dracut
pkgver=1.3.1
pkgrel=1
pkgdesc="A helper script to rebuild initramfs images using dracut"
arch=('any')
url="https://github.com/xuanruiqi/rebuild-initramfs-dracut-arch"
license=('MIT')
groups=()
depends=("dracut")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xuanruiqi/${pkgname}-arch/archive/${pkgver}.tar.gz")
sha256sums=('0a55fda6c3ba779000f333d53713417bc8ddc34bf0d93f953c966aebb0f0061c')

package() {
  cd "${srcdir}/${pkgname}-arch-${pkgver}"

  install -Dm755 rebuild-initramfs "${pkgdir}/usr/bin/rebuild-initramfs"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
