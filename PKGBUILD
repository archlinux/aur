# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * Namcap warns that dependencies pacman and pkgfile are not needed, but these scripts obviously depend on them

pkgname=pacman-helper
pkgver=0.1
pkgrel=2
pkgdesc='Pacman helper scripts for those who can not remember the options'
arch=('any')
license=('GPL2')
depends=('pacman' 'pkgfile')
source=('package-cache-clean'
        'package-cache-delete'
        'package-contents'
        'package-contents-installed'
        'package-download-tarball'
        'package-file-owner'
        'package-get-new-package-lists'
        'package-help'
        'package-info'
        'package-info-installed'
        'package-install'
        'package-installed-check'
        'package-installed-dependency'
        'package-installed-explicit'
        'package-installed-manually'
        'package-install-file'
        'package-list-installed'
        'package-mark-dependency'
        'package-mark-explicit'
        'package-orphans'
        'package-provides'
        'package-remove'
        'package-remove-fully'
        'package-search'
        'package-search-installed'
        'package-sysupgrade')
md5sums=('95aaa3ed60c3c3e9686227746287b024'
         'f0d7dd1a3dbe5e3873b351a6115eec50'
         '4f875002075d371a93583c9c2919dd0b'
         'c5c28dcbca18ff6cf614c331d2af85d9'
         '127e85489e1ad4cfd1fcb33a84d6ca72'
         '0a44ceaa56ec290052baf4e8ca8ad10c'
         'd3fd28a5d6228138340aaaeade5f9a54'
         '2130edeb9d78ea0cb46679de2342f4fe'
         '539cfdfc41e577788aeb7bed1ac0627d'
         'c63fd5f18f8a15ba95944fd7b62a8e16'
         '88649a226d8c060b363e30aed01e088d'
         '5b9e295fa325e2d6bdf77dea0cb6fa96'
         '95c1c5317fe1ad822047a3821236cce3'
         '12f6deeb7e1f9ce3a56dde033cf4b8de'
         'fa6142c5be64c27544602c84ca120efd'
         'df51c0f70e8cd0bc28fea4c4ab1baf50'
         'baf569590df5225b54c2aee18f0484d6'
         '79fa17ec01bb6774a6709357a14e67f7'
         'd72f599b72a987673b221c20bbe126fc'
         '90ca3c273ea4b080ac6ed5211a6fb09c'
         'c7b2a01a958a9a9f3c3833c7a9fbb7b2'
         '988824924466bf8247c4b9679c3563d3'
         '306038d002f2209755f8cd26f117d4dc'
         '15836f96893fd2a1f4f8ab53578a0bf7'
         'f9cbfdf99be0bf7758164c88e810572f'
         '102911f9cf4cb9de918db2b99b1a6741')

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 package-cache-clean "${pkgdir}/usr/bin/package-cache-clean"
  install -Dm755 package-cache-delete "${pkgdir}/usr/bin/package-cache-delete"
  install -Dm755 package-contents "${pkgdir}/usr/bin/package-contents"
  install -Dm755 package-contents-installed "${pkgdir}/usr/bin/package-contents-installed"
  install -Dm755 package-download-tarball "${pkgdir}/usr/bin/package-download-tarball"
  install -Dm755 package-file-owner "${pkgdir}/usr/bin/package-file-owner"
  install -Dm755 package-get-new-package-list "${pkgdir}/usr/bin/package-get-new-package-list"
  install -Dm755 package-help "${pkgdir}/usr/bin/package-help"
  install -Dm755 package-info "${pkgdir}/usr/bin/package-info"
  install -Dm755 package-info-installed "${pkgdir}/usr/bin/package-info-installed"
  install -Dm755 package-install "${pkgdir}/usr/bin/package-install"
  install -Dm755 package-installed-check "${pkgdir}/usr/bin/package-installed-check"
  install -Dm755 package-installed-dependency "${pkgdir}/usr/bin/package-installed-dependency"
  install -Dm755 package-installed-explicit "${pkgdir}/usr/bin/package-installed-explicit"
  install -Dm755 package-installed-manually "${pkgdir}/usr/bin/package-installed-manually"
  install -Dm755 package-install-file "${pkgdir}/usr/bin/package-install-file"
  install -Dm755 package-list-installed "${pkgdir}/usr/bin/package-list-installed"
  install -Dm755 package-mark-dependency "${pkgdir}/usr/bin/package-mark-dependency"
  install -Dm755 package-mark-explicit "${pkgdir}/usr/bin/package-mark-explicit"
  install -Dm755 package-orphans "${pkgdir}/usr/bin/package-orphans"
  install -Dm755 package-provides "${pkgdir}/usr/bin/package-provides"
  install -Dm755 package-remove "${pkgdir}/usr/bin/package-remove"
  install -Dm755 package-remove-fully "${pkgdir}/usr/bin/package-remove-fully"
  install -Dm755 package-search "${pkgdir}/usr/bin/package-search"
  install -Dm755 package-search-installed "${pkgdir}/usr/bin/package-search-installed"
  install -Dm755 package-sysupgrade "${pkgdir}/usr/bin/package-sysupgrade"
}
