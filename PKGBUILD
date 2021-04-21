pkgname='mkinitcpio-transflag'
pkgver=1.0
pkgrel=1
pkgdesc="Display a transflag while booting!"
arch=('any')
install='install'
license=('MIT')
depends=('mkinitcpio>=0.9.0')
source=("transflag_hook"
        "transflag_install")
        
package() {
  install -Dm644 "transflag_install" "$pkgdir/usr/lib/initcpio/install/transflag"
  install -Dm644 "transflag_hook" "$pkgdir/usr/lib/initcpio/hooks/transflag"
} 

 
md5sums=('9921e9057c72f858ca4480f738aa2026'
         '0745d47e90f1bc6fe391a56e5bcb2529')
