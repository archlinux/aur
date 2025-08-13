# aur.git

This is an experimental mirror of the aur.git repository backing [the AUR](https://aur.archlinux.org).

Every package has its own branch, so click "main" on the top left, and find the name of the package.

Then, you can download and install it with: 

```
git clone --branch NAME --single-branch https://github.com/archlinux/aur.git
cd aur
makepkg -si
```

Replace NAME with the name of the branch. 
