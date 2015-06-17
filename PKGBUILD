# Maintainer: M0Rf30 <morf3089@gmail.com>

pkgname=cupp-v3	
pkgver=3.0
pkgrel=1
pkgdesc="Common User Passwords Profiler " 
arch=('i686' 'x86_64') 
url="http://www.remote-exploit.org/?page_id=418" 
depends=('python2') 
license=('GPL') 
source=(http://www.remote-exploit.org/content/cupp-$pkgver.tar.gz
        cupp-bin) 

package()
{
  # Organize the paths
    mkdir -p $pkgdir/usr/share/
    cp -r $srcdir/cupp $pkgdir/usr/share/
    
  # Create the executable link
    mkdir -p $pkgdir/usr/bin
    cp $srcdir/cupp-bin $pkgdir/usr/bin/cupp
    
}

md5sums=('d7bea1245095036a368566b9a15ddc86'
         'a44a6a199c7e80c926bffe95c1a5e8a7')
