pkgname=('python-yappi')                                                                                         
pkgver=0.98                                                                                                      
pkgrel=1                                                                                                         
pkgdesc='Yet Another Python Profiler'                                                                            
url='https://bitbucket.org/sumerc/yappi'                                                                         
license=('MIT')                                                                                                  
arch=('any')                                                                                                     
source=("https://pypi.python.org/packages/35/43/489bf1dd0923c16b4abe09271da979ca0576662d02ba59f26cfb54e93be1/yappi-0.98.tar.gz#md5=dc56240575c99938a924eaeb7c0d8beb"
"https://bitbucket.org/sumerc/yappi/raw/f2ec7bda4fca19f8a6ef81fb9807ab8ee73f7033/LICENSE")
md5sums=('dc56240575c99938a924eaeb7c0d8beb'
  '084addf3f5099fe4c94ff0c220d493de'
)                                                                      
                                                                                                                 
package_python-yappi() {                                                                                         
  depends=('python')                                                                                             
  makedepends=('python-setuptools')                                                                              
                                                                                                                 
  cd "$srcdir/yappi-$pkgver"                                                                                     
  python setup.py install --root="$pkgdir" --optimize=1                                                          
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/${pkgname[0]}/LICENSE"                                   
}                                                                                                                
