# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>

pkgname=realvnc-vnc-server-6
pkgver=6.11.0
pkgrel=3
pkgdesc='VNC remote desktop server software by RealVNC'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxtst' 'xorg-xauth')
optdepends=('cups: Printer support')
install='realvnc-vnc-server.install'
conflicts=('tightvnc' 'tigervnc' 'turbovnc' 'realvnc-vnc-server')
source_x86_64=("https://downloads.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-x64.deb")
source_i686=("https://downloads.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-x86.deb")
source_armv7h=("https://downloads.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-ARM.deb")
source_aarch64=("https://downloads.realvnc.com/download/file/vnc.files/VNC-Server-${pkgver}-Linux-ARM64.deb")
sha256sums_x86_64=('eb991504872e0a11bc1194184c026f563bda8e57b14adf68d0e2895ddcffb76a')
sha256sums_i686=('46005ca1db4759c13f62b7e0f68feba2520d68d3b81e83201186b6301e5d9921')
sha256sums_armv7h=('5dd2a5f3ad900cce110d6df38a1e20aa0903e0ceac34fb26ce3e5ba978068673')
sha256sums_aarch64=('743d38894f374ce97c5075e45380c35cd4487aef809100b3e5f2c27fbc0d0b04')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/"data.tar.*
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
