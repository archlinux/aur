# Maintainer: KiWi42 <pullthisplug dash aur at yahoo dot com>

pkgname=netexec
pkgver=1.3.0
pkgrel=1
pkgdesc="A swiss army knife for pentesting Windows/Active Directory environments"
arch=("x86_64")
url="https://github.com/Pennyw0rth/NetExec"
license=("BSD-2-Clause")
replaces=("crackmapexec")
source=("${url}/releases/download/v${pkgver}/nxc-ubuntu-latest.zip"
        "zsh-completion")
sha256sums=("c1d8c1de801af0004fc496b3a654d81cee9c2aad12c8054427f524241478af75" 
            "891f6691fce2709dffa2965c30c49c4aa2ebdd0e2dc774caf85d7c276d43b023")

package() {
	install -Dm755 nxc "$pkgdir/usr/bin/nxc"
	install -Dm644 zsh-completion "$pkgdir/usr/share/zsh/site-functions/_nxc"
}
