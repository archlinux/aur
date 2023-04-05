# Maintainer: coxackie
pkgname=spotify-remove-ad-banner
pkgver=5
pkgrel=1
pkgdesc='Remove Spotify ad banner'
arch=('any')
license=('unknown')
depends=('spotify' 'sed' 'unzip' 'zip')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'remove.sh'
        'restore.sh')
md5sums=('c99ab56771851f41b1560e9f8847b7cb'
         'f066425d55156489f8522dc87e60c4e4'
         '1e0ab46ea5763380e6f52b12e120affa')


package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/remove.sh" "${pkgdir}/usr/share/${pkgname}/remove.sh"
  install -Dm 755 "${srcdir}/restore.sh" "${pkgdir}/usr/share/${pkgname}/restore.sh"
}

