# Maintainer: Pieter Goetschalckx

pkgname=nordzy-cursors
pkgver=1.0.0
pkgrel=1
pkgdesc='Cursor theme using the Nord color palette and based on Vimix and cz-Viator'
arch=(any)
url='https://github.com/alvatip/Nordzy-cursors'
license=('GPL3')
source=(
	"https://github.com/alvatip/Nordzy-cursors/releases/download/${pkgver}/Nordzy-cursors.tar.gz"
	"https://github.com/alvatip/Nordzy-cursors/releases/download/${pkgver}/Nordzy-cursors-white.tar.gz"
)
noextract=("${source[@]##*/}")
b2sums=('1612591f1a25fea389d8ed3fb4aa0743c00c4cf3e7b64b35c50185672fca36ba93072ed253b7a44c7f002cbed86e84d6c10a28b62e3afe702a5dbdcb274143bd'
        '2670d7075120ae75ee70d44f8f18a9798bf8f70e5f3e09649b8e5f89dbb55e90d6a5f6f0acc0f81b906eb9f6c1b9733da251fd1437d68363fbe34d8569f8ed09')

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-white"

	tar --no-same-owner -zxvf Nordzy-cursors.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-white.tar.gz -C "${pkgdir}/usr/share/icons/"
}
