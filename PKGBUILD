# Maintainer: KiWi42 <pullthisplug dash aur at yahoo dot com>

pkgname=netexec
pkgver=1.4.0
pkgrel=1
pkgdesc="A swiss army knife for pentesting Windows/Active Directory environments"
arch=("x86_64")
url="https://github.com/Pennyw0rth/NetExec"
license=("BSD-2-Clause")
replaces=("crackmapexec")
source=("${url}/releases/download/v${pkgver}/nxc-ubuntu-latest.zip"
        "zsh-completion")
sha256sums=("76ba02d02316042c8980676513cd926857479100726485bdbb88c4a829bec6cf"
            "c0231c100ca2ba559df22a94c229afb230467ba5153f1652755edd32273e9da4")

package() {
	install -Dm755 nxc "$pkgdir/usr/bin/nxc"
	install -Dm644 zsh-completion "$pkgdir/usr/share/zsh/site-functions/_nxc"
}
