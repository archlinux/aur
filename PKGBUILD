pkgname=batpu2-vm
pkgver=2.10
pkgrel=2
pkgdesc="A virtual machine/assembler for MattBatwings' redstone CPU"
arch=('x86_64')
url="https://github.com/AdoHTQ/Batpu2-VM"
license=('MIT')
source=("https://github.com/consler/Batpu2-VM/releases/download/AUR5/batpu2-vm.tar.gz")
sha256sums=('SKIP') 

package() {
  
  mkdir -p "${pkgdir}/opt/${pkgname}"

  cp -r "${srcdir}/batpu2-vm/." "${pkgdir}/opt/${pkgname}/"

  mkdir -p "${pkgdir}/usr/share/applications"
  echo "[Desktop Entry]
  Name=Batpu2-VM
  Exec=/opt/${pkgname}/Batpu2-VM.x86_64 --main-pack /opt/${pkgname}/Batpu2-VM.pck
  Icon=/opt/batpu2-vm/batpu2-vm_icon.png
  Type=Application
  Categories=Development;" > "${pkgdir}/usr/share/applications/batpu2-vm.desktop"
}

