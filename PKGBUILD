# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=pacman-hook-plymouth-splash
_reponame=plymouth-arch-updates
pkgver=1.0.0
pkgrel=1
pkgdesc='Graphical alerting of system updates, useful for HTPC usecases.'
arch=('any')
license=('GPL')
depends=('pacman' 'plymouth-updates-splash')
url='https://github.com/emansom/plymouth-arch-updates'
source=("https://github.com/emansom/plymouth-arch-updates/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('da7c07617ef9894578b412566b463f6f61200363768e999ae534ceac9ebdb04f')
b2sums=('8ca71da1cdfd47197cac669817f4b5ff8a879ba69124ad1c23868f427b6fa64890df476057e153831d21aa9135446af15acb2e09537d3b557b0608c7344b8ca0')

package() {
  cd "${_reponame}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"

  install -m644 -t "${pkgdir}/usr/share/libalpm/hooks" 05-plymouth-pre-install.hook
  install -m644 -t "${pkgdir}/usr/share/libalpm/hooks" 10-plymouth-system-update-progress-5.hook
  install -m644 -t "${pkgdir}/usr/share/libalpm/hooks" 20-plymouth-system-update-progress-12.hook
  install -m644 -t "${pkgdir}/usr/share/libalpm/hooks" 30-plymouth-system-update-progress-20.hook
  install -m644 -t "${pkgdir}/usr/share/libalpm/hooks" 40-plymouth-system-update-progress-33.hook
  install -m644 -t "${pkgdir}/usr/share/libalpm/hooks" 50-plymouth-system-update-progress-46.hook
  install -m644 -t "${pkgdir}/usr/share/libalpm/hooks" 60-plymouth-system-update-progress-58.hook
  install -m644 -t "${pkgdir}/usr/share/libalpm/hooks" 70-plymouth-system-update-progress-66.hook
  install -m644 -t "${pkgdir}/usr/share/libalpm/hooks" 80-plymouth-system-update-progress-72.hook
  install -m644 -t "${pkgdir}/usr/share/libalpm/hooks" 90-plymouth-system-update-progress-88.hook
  install -m644 -t "${pkgdir}/usr/share/libalpm/hooks" 99-plymouth-system-update-progress-96.hook
  install -m644 -t "${pkgdir}/usr/share/libalpm/hooks" zz-plymouth-post-install.hook
}
