# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>
pkgname='geyser-fabric'
_pkgname='Geyser-Fabric'
pkgver='2.2.1'
pkgrel=1
pkgdesc='Enable clients from Minecraft Bedrock Edition to join your Minecraft Java'
arch=('any')
url="https://geysermc.org/"
license=("MIT")
depends=("fabric-server" "fabric-api")

source=("https://download.geysermc.org/v2/projects/geyser/versions/${pkgver}/builds/421/downloads/fabric")
sha256sums=("2de0acfeafadd4a9fc85420275cd0412cc8d548936b2c8b5e0d1b50e61b6f85d")
b2sums=("b1306e24a793f3d5efc1c6f0f681ab50be7801d7f593be3c7f570c947fa9341c400b6ab2f5f6cfba3153dcccaf138f2b36458ba6cbf5200416e2ceef58d563f4")

package() {
    install -Dm644 fabric "${pkgdir}/srv/fabric/mods/Geyser-Fabric.jar"
}

