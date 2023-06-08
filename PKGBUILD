# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatstudio-sources
pkgver=24.0w
pkgrel=1
pkgdesc="Source tarballs for the Gnatstudio project stack"

arch=(i686 x86_64)
url=https://github.com/AdaCore/gnatstudio
license=(GPL3)

source=(https://github.com/AdaCore/gnatstudio/releases/download/gnatstudio-cr-20230501/gnatstudio-sources-x86_64-linux.tar.gz)
sha256sums=(acacf5f971dd94dd08a464a05f4e02cf0f1fc5e81028bf7c13091ed08ad97218)


package()
{
   cd "$srcdir/$pkgname-x86_64-linux"

   mkdir -p $pkgdir/opt/gnatstudio-sources

   mv ada_libfswatch-24.0w-20230428-16626-src.tar.gz    $pkgdir/opt/gnatstudio-sources
   mv adasat-24.0w-20230324-16568-src.tar.gz            $pkgdir/opt/gnatstudio-sources
   mv als-24.0w-20230428-16420-src.tar.gz               $pkgdir/opt/gnatstudio-sources
   mv gnatcoll-bindings-24.0w-20230324-1636E-src.tar.gz $pkgdir/opt/gnatstudio-sources
   mv gnatcoll-core-24.0w-20230324-161A8-src.tar.gz     $pkgdir/opt/gnatstudio-sources
   mv gnatcoll-db-24.0w-20230324-166CC-src.tar.gz       $pkgdir/opt/gnatstudio-sources
   mv gnatdoc4-24.0w-20230428-16616-src.tar.gz          $pkgdir/opt/gnatstudio-sources
   mv gnathub-edge-24.0w-20230324-16293-src.tar.gz      $pkgdir/opt/gnatstudio-sources
   mv gnatstudio-24.0w-20230428-16588-src.tar.gz        $pkgdir/opt/gnatstudio-sources
   mv gpr2-24.0w-20230324-16151-src.tar.gz              $pkgdir/opt/gnatstudio-sources
   mv gprbuild-24.0w-20230324-1649D-src.tar.gz          $pkgdir/opt/gnatstudio-sources
   mv gprconfig-kb-24.0w-20230324-16644-src.tar.gz      $pkgdir/opt/gnatstudio-sources
   mv gtkada-24.0w-20230428-165F0-src.tar.gz            $pkgdir/opt/gnatstudio-sources
   mv langkit-24.0w-20230324-16391-src.tar.gz           $pkgdir/opt/gnatstudio-sources
   mv libadalang-24.0w-20230324-164A3-src.tar.gz        $pkgdir/opt/gnatstudio-sources
   mv libadalang-tools-24.0w-20230324-166A6-src.tar.gz  $pkgdir/opt/gnatstudio-sources
   mv markdown-24.0w-20230428-162F9-src.tar.gz          $pkgdir/opt/gnatstudio-sources
   mv spawn-24.0w-20230428-162D4-src.tar.gz             $pkgdir/opt/gnatstudio-sources
   mv templates_parser-24.0w-20230324-1619B-src.tar.gz  $pkgdir/opt/gnatstudio-sources
   mv vss-24.0w-20230324-16550-src.tar.gz               $pkgdir/opt/gnatstudio-sources
   mv vss-24.0w-20230428-1628B-src.tar.gz               $pkgdir/opt/gnatstudio-sources
   mv xmlada-24.0w-20230324-1684A-src.tar.gz            $pkgdir/opt/gnatstudio-sources
}