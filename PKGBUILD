pkgname=neutrino
pkgver=0.400
pkgrel=1
arch=(x86_64)
source=("neutrino_auto_patch.sh" "neutrino.sh")
md5sums=("SKIP" "SKIP")
prepare(){
    ./neutrino_auto_patch.sh
}
package(){
    rm -rf NEUTRINO/Run.sh
    mkdir -p "$pkgdir/opt/NEUTRINO/"
    mkdir -p "$pkgdir/etc/profile.d/"
    rm -rf NEUTRINO/利用規約.txt
    cp -r NEUTRINO "$pkgdir/opt/"
    cp ./neutrino.sh "$pkgdir/etc/profile.d/"
    

}