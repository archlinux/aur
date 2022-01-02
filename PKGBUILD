pkgname=voltmc
pkgver=1.0
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'arm')
pkgdesc="Install Minecraft Forge mods via a GUI"
url="https://github.com/Interfiber/volt"
depends=("rust")
source=("https://github.com/Interfiber/volt/archive/refs/heads/main.zip")
sha256sums=("c226344f87a64c4f2bb7225e9beb3f7dce2f3d8244026aabb6b399758ff67aa1")

prepare(){
 cd volt-main
}
build(){
  cd volt-main 
  cargo build --release
}
package(){
  cd volt-main
  sudo cp target/release/volt /usr/bin/volt
}
