# Maintainer: lgm <lgm dot aur at outlook dot com>  
# Contributor: <me at auoeke dot net>
# Contributor: Péter Tombor <aur at tmbpeter dot com>
pkgname=fabric-installer
pkgver=1.0.3
pkgrel=1
pkgdesc='installer for the Minecraft mod loader Fabric'
arch=('any')
url='https://fabricmc.net'
license=('Apache-2.0')
depends=('java-environment>=8')
source=("https://maven.fabricmc.net/net/fabricmc/fabric-installer/$pkgver/fabric-installer-$pkgver.jar"
        'https://raw.githubusercontent.com/FabricMC/fabric-installer/master/LICENSE'
        'https://fabricmc.net/assets/logo.png'
        'fabric-installer'
        'fabric-installer.desktop')
sha256sums=('38aa82ab1ef829b7aa3f2143fcc93bba706a8e18835be731d0fdf231d274b07f'
            'b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1'
            'a41878c3c4c5790cfc920eabf98d3404103a74a6f3df69d632ceb220c9ec9dc7'
            '20b3368adc352dfc241b84d62aabd05734863650225ae3930deee9ca53a2c0a8'
            'e832b760542f9b224512aca6dfd9fe20dec6c3b59cc86842096f35055ffcea55')

package() {
    install -Dm 644 fabric-installer-$pkgver.jar "$pkgdir/usr/share/java/$pkgname.jar"
    install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm 644 logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm 644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
}

