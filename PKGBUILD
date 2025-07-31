# Maintainer: basz <echo c3BhdGllZ2FtZXNAZ21haWwuY29tCg== | base64 -d>
pkgname=realvnc-rvnc-connect
pkgver=8.1.0
pkgrel=1
pkgdesc="VNC remote desktop software by RealVNC"
arch=('x86_64')
url="https://www.realvnc.com/en/connect/"
license=('unknown')
depends=('atkmm>=1.32.0' 'glibc>=2.27' 'cairo>=1.2.4' 'libepoxy>=1.0' 'fontconfig>=2.12' 'gcc-libs>=3.0' 'glib2>=2.39.90' 'gtk3>=3.21.4' 'pango>=1.29.4' 'libx11' 'libxext' 'libxtst')
makedepends=()
checkdepends=()
optdepends=('cups' 'avahi')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source_x86_64=("https://downloads.realvnc.com/download/file/realvnc-connect/RealVNC-Connect-${pkgver}-Linux-x64.deb")
sha256sums_x86_64=('1ff03c74d04ac57727a277866c63f61e22e08b84db1285fd0e4b76df68ed8cdc')

package() {
	bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
}
