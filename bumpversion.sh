echo "Scraping latest Keeper version from https://keepersecurity.com/desktop_electron/desktop_electron_version.txt"
keeperversion=$(grep -oP '(?<="version": ")[^"]*'  <(curl -sqL https://keepersecurity.com/desktop_electron/desktop_electron_version.txt))
echo "Latest Keeper for Linux version: ${keeperversion}"

keeperurl="https://www.keepersecurity.com/desktop_electron/Linux/repo/deb/keeperpasswordmanager_${keeperversion}_amd64.deb"

echo "Determining sha512sum for ${keeperurl}"
keepersha512sum=$(curl -sqLo - ${keeperurl} | sha512sum | awk '{print $1}')
echo "Keeper sha512sum: ${keepersha512sum}"

echo "Updating PKGBUILD and .SRCINFO with new version and sha512sum"
# PKGBUILD
sed -i "s|^pkgver=.*$|pkgver=${keeperversion}|" PKGBUILD
sed -i "s|^sha512sums=('.*'$|sha512sums=('${keepersha512sum}'|" PKGBUILD
# .SRCINFO
sed -i "s|\tpkgver = .*$|\tpkgver = ${keeperversion}|" .SRCINFO
sed -i "s|\tsource = .*$|\tsource = ${keeperurl}|" .SRCINFO
sed -i "0,/sha512sums/s|\tsha512sums = .*$|\tsha512sums = ${keepersha512sum}|" .SRCINFO
