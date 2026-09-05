# Maintainer: grgergo
pkgname=nsmb-mvl
pkgver=2.2.0.1
pkgrel=1
pkgdesc="A unity-standalone 2-10 player remake of the Mario vs. Luigi gamemode from the New Super Mario Bros DS download game."
arch=(x86_64)
url="https://github.com/ipodtouch0218/NSMB-MarioVsLuigi"
license=('unknown')
source=("$pkgname-$pkgver.zip::https://github.com/ipodtouch0218/NSMB-MarioVsLuigi/releases/download/v$pkgver/MarioVsLuigi-Linux-v$pkgver.zip"
				"nsmb-icon.png"
				"nsmb-mvl.desktop")
sha256sums=(0aaefd85e6dbd071106b31e2f3f077cbc89c70530e364ec785d50ebb31cc4ba3
						2085c03847bfb79b4e46b19e18d0d30087d5b40225827b723b6621a1c8c7df5c
						49eb837a0bd5fe37767e0e678c78e9fce52466ef541bc28917b7b13004a774a5)

package() {
	mkdir -p $pkgdir/opt/nsmb-mvl
	mkdir -p $pkgdir/usr/share/applications
	cp nsmb-mvl.desktop $pkgdir/usr/share/applications
	cp nsmb-icon.png $pkgdir/opt/nsmb-mvl
	cd "MarioVsLuigi-Linux"
	cp -r * $pkgdir/opt/nsmb-mvl
	chmod +x $pkgdir/opt/nsmb-mvl/linux.x86_64
}

