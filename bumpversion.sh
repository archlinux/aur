echo "Scraping latest aws-iam-authenticator version from https://api.github.com/repos/kubernetes-sigs/aws-iam-authenticator/releases"
latestversion=$(curl -sq https://api.github.com/repos/kubernetes-sigs/aws-iam-authenticator/releases | grep tag_name | sort | tail -1 | awk -F '"' '{print $4}')
echo "Latest aws-iam-authenticator version: ${latestversion}"

srcurl="https://github.com/kubernetes-sigs/aws-iam-authenticator/archive/${latestversion}.tar.gz"

echo "Determining sha512sum for ${srcurl}"
sha512sum=$(curl -sqLo - ${srcurl} | sha512sum | awk '{print $1}')
echo "aws-iam-authenticator sha512sum: ${sha512sum}"

echo "Updating PKGBUILD and .SRCINFO with new version and sha512sum"
# PKGBUILD
sed -i "s|^pkgver=.*$|pkgver=${latestversion/v/}|" PKGBUILD
sed -i "s|^sha512sums=('.*'|sha512sums=('${sha512sum}'|" PKGBUILD
# .SRCINFO
sed -i "s|\tpkgver = .*$|\tpkgver = ${latestversion/v/}|" .SRCINFO
sed -i "s|\tsource = aws-iam-authenticator-.*.tar.gz::|\tsource = aws-iam-authenticator-${latestversion/v/}.tar.gz::|" .SRCINFO
sed -i "s|::.*|::${srcurl}|" .SRCINFO
sed -i "0,/sha512sums/s|\tsha512sums = .*$|\tsha512sums = ${sha512sum}|" .SRCINFO
