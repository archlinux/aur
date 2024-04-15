# Maintainer: Guillaume BOEHM <aur@mail.gboehm.com>
pkgname=nordzy-cursors-hyprcursor
pkgver=1.0.0
pkgrel=2
pkgdesc="Hyprcursor port of https://github.com/alvatip/Nordzy-cursors."
arch=(any)
url="https://github.com/guillaumeboehm/Nordzy-cursors-hyprcursor"
license=('GPL3')
source=(
    "https://github.com/guillaumeboehm/Nordzy-cursors-hyprcursor/releases/download/${pkgver}/Nordzy-cursors-hyprcursor.tar.gz"
    "https://github.com/guillaumeboehm/Nordzy-cursors-hyprcursor/releases/download/${pkgver}/Nordzy-cursors-white-hyprcursor.tar.gz"
)
noextract=("${source[@]##*/}")
sha256sums=(
    "9a4541fc9e317b6a5b4a61f59a38e76e94df9c6d7a018582c29f0be1cf7c6258"
    "79ebe3fe728f84746f99b5e013a6600b37da54758ece9234e28f7820ffc3e521"
)

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-hyprcursor"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-white-hyprcursor"

	tar --no-same-owner -zxvf Nordzy-cursors-hyprcursor.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-white-hyprcursor.tar.gz -C "${pkgdir}/usr/share/icons/"
}
