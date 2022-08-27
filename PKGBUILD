# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=sshyp
pkgver=1.1.2
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL3')
depends=(python gnupg openssh xclip wl-clipboard)
source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('169f4ae2be4e428dd2517f9a494f5ce24f9ef58b0181a2e8b8504881ca56f2fefa9e3a80cd0f945d57523fb44408c3fceb0035d58f34ee4190cdbd8e8cb0ec2c')

package() {
    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"
}

