# Maintainer: Xuanrui Qi <xuanrui@xuanruiwork>
pkgname=rebuild-initramfs-dracut
pkgver=1.3.3
pkgrel=1
pkgdesc="A helper script to rebuild initramfs images using dracut"
arch=('any')
url="https://github.com/xuanruiqi/rebuild-initramfs-dracut-arch"
license=('MIT')
groups=()
depends=("dracut")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xuanruiqi/${pkgname}-arch/archive/${pkgver}.tar.gz")
sha256sums=('b8f80878daf299250623b158edf575f306e354e133ef844a51a8deb42bfe088c')

package() {
  cd "${srcdir}/${pkgname}-arch-${pkgver}"

  install -Dm755 rebuild-initramfs "${pkgdir}/usr/bin/rebuild-initramfs"
  install -Dm644 rebuild-initramfs.1 "${pkgdir}/usr/share/man/man1/rebuild-initramfs.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
