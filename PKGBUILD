# Maintainer: Xuanrui Qi <xuanrui@xuanruiwork>
pkgname=rebuild-initramfs-dracut
pkgver=1.2.1
pkgrel=1
pkgdesc="A helper script to rebuild initramfs images using dracut"
arch=('any')
url="https://github.com/xuanruiqi/rebuild-initramfs-dracut-arch"
license=('MIT')
groups=()
depends=("dracut")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xuanruiqi/${pkgname}-arch/archive/${pkgver}.tar.gz")
sha256sums=('1e7d2a398f7f0d7ec077489c4500e72750a46ccb02bde39d6172b79478fc20f6')

package() {
  cd "${srcdir}/${pkgname}-arch-${pkgver}"

  install -Dm755 rebuild-initramfs "${pkgdir}/usr/bin/rebuild-initramfs"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
