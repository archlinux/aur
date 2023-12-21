check-for-asdf() {
<<<<<<< HEAD
  if ! commands -v asdf &> /dev/null
=======
  if ! command -v asdf &> /dev/null
>>>>>>> 5292e5c (fix: still doesn't work)
  then
    echo "asdf could not be found"
    echo "Configuring asdf..."

    # Install asdf
    # for bash, fish, zsh - add more if needed
    if [[ $SHELL == *"bash"* ]]; then
<<<<<<< HEAD
      # If the .bashrc file does not contain the asdf source commands, we add it
=======
      # If the .bashrc file does not contain the asdf source command, we add it
>>>>>>> 5292e5c (fix: still doesn't work)
      if ! grep -q ". /opt/asdf-vm/asdf.sh" ~/.bashrc; then
        echo -e "\n. /opt/asdf-vm/asdf.sh" >> ~/.bashrc
      fi
      source ~/.bashrc
    elif [[ $SHELL == *"fish"* ]]; then
      echo "Patching config.fish"
<<<<<<< HEAD
      # If the config.fish file does not contain the asdf source commands, we add it
=======
      # If the config.fish file does not contain the asdf source command, we add it
>>>>>>> 5292e5c (fix: still doesn't work)
      if ! grep -q ". /opt/asdf-vm/asdf.fish" ~/.config/fish/config.fish; then
        echo -e "\n. /opt/asdf-vm/asdf.fish" >> ~/.config/fish/config.fish
      fi
      source ~/.config/fish/config.fish
    elif [[ $SHELL == *"zsh"* ]]; then
      echo "Patching .zshrc"
      # Just to make sure that an existing zsh config is not intervening,
      # we need to check that the .zshrc file contains the proper shebang #!/usr/bin/env zsh
      if ! grep -q "#!/usr/bin/env zsh" ~/.zshrc; then
        echo "The .zshrc file does not contain the proper shebang #!/usr/bin/env zsh"
        echo "This script is likely to fail."
        echo "For convenience, we will add it for you."
        echo "If you do not want this, please remove it manually after the installation has finished."
        echo -e "#!/usr/bin/env zsh\n# Shebang added by the dashlane-cli-git package\n\n$(cat ~/.zshrc)" > ~/.zshrc
      fi
<<<<<<< HEAD
      # If the .zshrc file does not contain the asdf source commands, we add it
=======
      # If the .zshrc file does not contain the asdf source command, we add it
>>>>>>> 5292e5c (fix: still doesn't work)
      if ! grep -q ". /opt/asdf-vm/asdf.sh" ~/.zshrc; then
        echo -e "\n. /opt/asdf-vm/asdf.sh" >> ~/.zshrc
      fi
      source ~/.zshrc
      # Check if asdf is available now
<<<<<<< HEAD
      if ! commands -v asdf &> /dev/null 
      then
=======
      if ! command -v asdf &> /dev/null then
>>>>>>> 5292e5c (fix: still doesn't work)
        echo "asdf could not be found"
        echo "You need to add asdf to your shell's initialization file manually."
      fi
    else
      echo "Unsupported shell. Please add asdf to your shell's initialization file manually."
      echo "Consider opening an issue or contribute a pull request to add support for your shell."
      echo "https://github.com/skf-funzt/dashlane-cli-git"
      exit 1
    fi
  fi
}

<<<<<<< HEAD
prepare_commands() {
  local srcdir=$1
  local pkgname=$2

=======
prepare_command() {
>>>>>>> 5292e5c (fix: still doesn't work)
  check-for-asdf

  # Install all plugins stated in .tool-versions
  awk '{print $1}' .tool-versions | xargs -n 1 asdf plugin-add
  asdf install

  cd "$srcdir/$pkgname"
  yarn install
}

<<<<<<< HEAD
build_commands() {
  local srcdir=$1
  local pkgname=$2

=======
build_command() {
>>>>>>> 5292e5c (fix: still doesn't work)
  check-for-asdf
  
  cd "$srcdir/$pkgname"
  yarn run build
  # Build linux binary
  yarn pkg:linux
}

<<<<<<< HEAD
package_commands() {
  local srcdir=$1
  local pkgname=$2
  local pkgdir=$3

=======
package_command() {
>>>>>>> 5292e5c (fix: still doesn't work)
  check-for-asdf

  cd "$srcdir/$pkgname"

  # Install the tool-versions file
  install -Dm755 "$srcdir/.tool-versions" "$pkgdir/usr/share/dashlane-cli-git/.tool-versions"

  # Install the binary
  install -Dm755 "$srcdir/$pkgname/bundle/dcli-linux" "$pkgdir/usr/share/dashlane-cli-git/dcli"

  # Create a symlink to the binary
  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -sf "./../share/dashlane-cli-git/dcli" "dcli"
}