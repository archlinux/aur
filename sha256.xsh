x=$(cat PKGBUILD).strip("\n")
o=$(grep --after-context=1 "^sha256" PKGBUILD).strip("\n")
n=$(makepkg -g).strip("\n")
with open("PKGBUILD", "w") as f:
    f.write(x.replace(o,n))