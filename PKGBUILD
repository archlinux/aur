# Maintainer: Pieter Goetschalckx

pkgname=nordzy-cursors
pkgver=2.4.0
pkgrel=1
pkgdesc='Cursor theme using the Nord color palette and based on Vimix and cz-Viator'
arch=(any)
url='https://github.com/alvatip/Nordzy-cursors'
license=('GPL3')
source=(
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors.tar.gz"
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors-lefthand.tar.gz"
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors-white.tar.gz"
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors-white-lefthand.tar.gz"
)
noextract=("${source[@]##*/}")
b2sums=('ed346d3cc29c06c82181dc3c2e32390908ae8c4452471fcc8a840ffbb27aef20fa0197b5fb16a71cb3a5e184fdb1d4ae526a98efe94190ca38e9ae8010e0f674'
        '15799bac4bdb8d8798bcdac92dc0ddaaec03dacccb038545071edc8de4b0965bd0dfc6897b6feb600095291dbb5f36748b710f4ec28ff7065d91baf186e3ad03'
        'c67cb572113defdf518a8f0ea8ac44e2c45a68f0331bc46018171778914272bea234605f0278714491c346c09dce6747451001f9f72d424dc8e4445c2f0a29af'
        '2f14872e1124918f6c0eed9cf42eb320286a38596237cf57cf29886f44d186b0314192361eeee7c9786c33eef6f565e8ee9bb2b7ac11b4cbf5936d971fef33d2')

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-lefthand"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-white"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-white-lefthand"

	tar --no-same-owner -zxvf Nordzy-cursors.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-lefthand.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-white.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-white-lefthand.tar.gz -C "${pkgdir}/usr/share/icons/"
}
