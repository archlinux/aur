pkgname=neutrino
pkgver=0.400
pkgrel=2
arch=(x86_64)
source=("neutrino_auto_patch.sh")
md5sums=("SKIP")
prepare(){
    ./neutrino_auto_patch.sh
}
package(){
    rm -rf NEUTRINO/Run.sh
    mkdir -p "$pkgdir/opt/NEUTRINO/"
    rm -rf NEUTRINO/利用規約.txt
    cp -r NEUTRINO "$pkgdir/opt/"
    

}
