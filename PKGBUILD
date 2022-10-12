# Maintainer: grgergo
pkgname=nsmb-mvl-bin
pkgver=1.7.1.0_beta
pkgrel=1
pkgdesc="A unity-standalone 2-10 player remake of the Mario vs. Luigi gamemode from the New Super Mario Bros DS download game."
arch=(x86_64)
url="https://github.com/ipodtouch0218/NSMB-MarioVsLuigi"
license=('unknown')
source=("$pkgname-$pkgver.zip::https://github.com/ipodtouch0218/NSMB-MarioVsLuigi/releases/download/v1.7.1.0-beta/MarioVsLuigi-Linux-v1.7.1.0-beta.zip"
				"nsmb-icon.png"
				"nsmb-mvl.desktop")
sha256sums=(adbf6f677c3805fcf282c74e08f2d55fced3e6d05793a030f9b6bd235d9f8704
						2085c03847bfb79b4e46b19e18d0d30087d5b40225827b723b6621a1c8c7df5c
						49eb837a0bd5fe37767e0e678c78e9fce52466ef541bc28917b7b13004a774a5)

package() {
	cd "MarioVsLuigi-Linux"
	mkdir -p $pkgdir/opt/nsmb-mvl
	mkdir -p $pkgdir/usr/share/applications
	cp -r * $pkgdir/opt/nsmb-mvl
	cp -r nsmb-mvl.desktop $pkgdir/usr/share/applications
}

