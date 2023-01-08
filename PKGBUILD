# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Florian Léger

pkgname=archlinux-menus
pkgver=2.5
pkgrel=6
pkgdesc="Arch Linux specific XDG-compliant menu"
arch=('any')
url="https://archlinux.org"
license=('GPL')
depends=('xdg-utils')
source=(Arch-AUR.desktop
  Arch-Bugs.desktop
  Arch-Developers.desktop
  Arch-Documentation.desktop
  Arch-Donate.desktop
  Arch-Forum.desktop
  Arch-Homepage.desktop
  Arch-Schwag.desktop
  Arch-SVN.desktop
  Arch-Wiki.desktop
  arch-logo.png
  arch-logo.svg
  Archlinux.directory
  Archlinux.menu)
sha512sums=('6f28c3126199ef3f496b8a3de2f76f4504751b69923caf2b02571c34e79133ec790b37bf06f450f5b633f27523c362ea6a1d188e4708f5d826fab324fba0e6e5'
  'a75908547e4ee2d216f9e934b1eeb38e8e1bc2ba30db3058d76119fd7978a5ae6a8c24c82ae04c34c55b981cd21e6a15c1819ec851758497669139c27e39bf11'
  'baed0bd3f49f55b5d4235d822fee47e28dd4aea10f37de3cb48731e9408915c322b841fe844333092fefcd9ff7326b0e334c97fc08a15dfd77f335bf1ab14fba'
  '0c270dcbafedd46ebe93bc2db107edbba2299e2a03699aaebfda997c570ae23b87441f800c93cace89a7786207d68321b7b301618759e6a1bf10a574082bd1e6'
  '1cd3a3b6f959efc402825b410f05fe854eee2fa40605dc560eb43e17c6e6116fea87bfd067fd8ea9e5b4fa5a0276df2c37d9596614e13915d64c0a45c124b031'
  '8d5ac0ae42278abc975e9939a7fba094e8ce737654d6ba37fff2eff4c15a2a2196114d3085f53f6e294d5d5c4ff60285ef8e7ff5e83f9d94f0c72ca2fc75ebe4'
  '70072fcac1eccd558410974b7f329c2bb0b1c26225ee111ae2de4a1adc04b99f8c5cebbd7cad2df219ea56fd2bf5f94f78f366d696c85aab615b9eb20eeaf4fa'
  'f45618ad22a94657cbcf33e7aa485fe8bceeb7373b869bc2576f2fd31fd56425fda3549e97792b42eaf3902a18500a93a3d4cb06ea8408ab677806c9e35074e4'
  'f8c14cff6d83774ea4472cf3e170d79b54bf3963845a557b3fdcf1147da4212fa52535b9557ca7e6bd87288ed01c600797963512abf7680e1b6b36d8133bc0d1'
  '45d8835ee886ea7cf9dca5b08d69e043461558b8034dcc120c20d3059d3cbdd2c013b263dbc282a3b2654dfa9e95c4317f8943af5ca97275e36ec6c4497b6c98'
  '9cb222cc561ea79678df3b50f5dbb7e22021f458bef2e789bb330a00c4ba74c6a1c28e8b85264a389b1ab21c9b0cc10301b7f5c8c0cf701ead19b5da297418db'
  '0487559aa4f6e885233c51265496b201a555ffef26ddd12fc6a950d6d8d36e640d30a1484066bc02be2b40c7ef22344c2616c7e112a1e656549e4e98519c2b3d'
  '93f8efa8806ce455a31840595a82879a51ef73b2ba284095135fc6a224d1865448281370d7883c7bb1a2c3db5afead8f2d25fcb8fd0d580f3e68e7af98fe7692'
  '6609e66ef574f357edb1911bb13b1682131686d300c5cd73c5a71492c12ee534c9318c0d1984eeca9a55f9fbfaf6aef4040419df2a5b5e7cd3a50dd4af72c3a5')

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/share/desktop-directories"
  install -m755 -d "${pkgdir}/usr/share/applications"
  install -m755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -m755 -d "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
  install -m755 -d "${pkgdir}/etc/xdg/menus/applications-merged"

  install -m644 *.desktop "${pkgdir}/usr/share/applications/"
  install -m644 arch-logo.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"
  install -m644 arch-logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  install -m644 Archlinux.directory "${pkgdir}/usr/share/desktop-directories/"
  install -m644 Archlinux.menu "${pkgdir}/etc/xdg/menus/applications-merged/"
}
