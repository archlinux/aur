# Maintainer: Gde Mahardhikha Satrigraha <dijedodol@yahoo.com>
pkgname=kube-ps1
pkgver=0.7.0
pkgrel=2
pkgdesc="A script that lets you add the current Kubernetes context and namespace configured on kubectl to your Bash/Zsh prompt"
arch=('any')
url="https://github.com/jonmosco/kube-ps1"
license=('APACHE')
depends=('grep' 'kubectl')
source=('https://github.com/jonmosco/kube-ps1/archive/v0.7.0.tar.gz')
md5sums=('4cfab48cf524132b97d7b9255ac21f42')

install="${pkgname}.pacman"

package() {
	KUBE_PS1_PATH="$pkgdir/opt/$pkgname"

	mkdir -p "$KUBE_PS1_PATH"
	cp -rf "$pkgname-$pkgver"/* "$KUBE_PS1_PATH"
	chmod a+r "${KUBE_PS1_PATH}/kube-ps1.sh"
}
