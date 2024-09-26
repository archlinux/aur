# Maintainer: Guillaume BOEHM <aur@mail.gboehm.com>
pkgname=nordzy-hyprcursors
pkgver=2.0.0
pkgrel=1
pkgdesc="Hyprcursor port of https://github.com/alvatip/Nordzy-cursors."
arch=(any)
url="https://github.com/guillaumeboehm/Nordzy-cursors-hyprcursor"
license=('GPL3')
source=(
    "https://github.com/guillaumeboehm/Nordzy-cursors-hyprcursor/releases/download/${pkgver}/Nordzy-hyprcursors.tar.gz"
    "https://github.com/guillaumeboehm/Nordzy-cursors-hyprcursor/releases/download/${pkgver}/Nordzy-hyprcursors-white.tar.gz"
)
noextract=("${source[@]##*/}")
sha256sums=(
    "8ee943cf92c399cc3453cf39b13050b0115be9af10d5fe6121cecedbbbede70d"
    "bb3b346514373c699e66115d094310c4bfcbf73b073dfd1efe1e5ccd7ce2cbed"
)

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-hyprcursor"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-white-hyprcursor"

	tar --no-same-owner -zxvf Nordzy-hyprcursors.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-hyprcursors-white.tar.gz -C "${pkgdir}/usr/share/icons/"
}
