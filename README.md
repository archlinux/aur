Traffic-efficient way to update this package:

1. Clone the repository locally:
  cd /path/to/src_git_mirrors
  git clone --mirror --depth=1 https://github.com/organicmaps/organicmaps.git
2. Put a script like this in your $PATH:
```sh
    case $1 in
  https://*)
    printf "file:///path/to/src_git_mirrors/%s" ${1##*/}.git
    ;;
  *)
    printf "%s" "$1"
    ;;
esac
```
3. export $SOURCE_URL_REWRITER variable pointing to the script:
```
export SOURCE_URL_REWRITER="$HOME/scripts/source_url_rewriter.sh"
```
4. Run `makepkg`, it will fetch the necessary data in repo
   /path/to/src_git_mirrors/organicmaps and clone locally
