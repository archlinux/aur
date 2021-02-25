REPO="ssh://aur@aur.archlinux.org/zoho-mail-desktop.git"

echo "[#] Generating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO

function GIT_MAKE { 
  echo "[?] What files would you like to commit?"
  ls -A | grep -v ".git" | grep -v ".gitignore"
  read -p "[>>] " GIT_FILES

  echo "[?] Please type a commit message."
  read -p "[>>] " GIT_MESSAGE

  echo "[#] Make sure this looks good."

  echo "[#] Committing:"
  echo "    ${GIT_FILES}"
  echo "    With message:"
  echo "    ${GIT_MESSAGE}"

  echo "[?] Look good?"
  echo "[?] Please type in 'yes' or 'no'."
  read -p "[>>] " GIT_CONFIRM; }

GIT_MAKE

while [[ ${GIT_CONFIRM} != "yes" ]] && [[ ${GIT_CONFIRM} != "no" ]]; do
  echo "[!] Invalid option provided."
  echo "[!] Please try again with 'yes' or 'no'."
  read -p "[>>] " GIT_CONFIRM; done

while [[ ${GIT_CONFIRM} == "no" ]]; do
  echo "[#] Kk, let's try this again."
  GIT_MAKE; done

echo "[@] Pushing to '${REPO}'"
git add ${GIT_FILES}
git commit -m "${GIT_MESSAGE}"
git push
