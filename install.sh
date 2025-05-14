post_install() {
  echo "Setting up Apollo Neo Environment Manager..."
  
  # Create necessary symbolic links
  ln -snf /opt/apollo/aem/aem /usr/bin/aem
  mkdir -p /etc/bash_completion.d && ln -snf /opt/apollo/aem/auto_complete.bash /etc/bash_completion.d/aem
  mkdir -p /usr/share/zsh/functions/Completion/Unix && ln -snf /opt/apollo/aem/auto_complete.zsh /usr/share/zsh/functions/Completion/Unix/_aem
  
  # Import GPG key
  if [ ! -d /etc/apt/keyrings ]; then
    mkdir -p /etc/apt/keyrings
  fi
  
  cat /usr/share/apollo-neo-env-manager-dev/apollo.gpg.key | gpg --dearmor > /etc/apt/keyrings/apolloauto.gpg
  chmod a+r /etc/apt/keyrings/apolloauto.gpg
  
  # Create Apollo repository configuration
  if [ ! -d /etc/apt/sources.list.d ]; then
    mkdir -p /etc/apt/sources.list.d
  fi
  
  # Add Apollo repository configuration for Ubuntu compatibility
  cat > /etc/apt/sources.list.d/apolloauto.list << EOF
deb [arch=amd64 signed-by=/etc/apt/keyrings/apolloauto.gpg] https://apollo-pkg-beta.cdn.bcebos.com/apollo/core jammy main
EOF
  
  echo "Installation complete. You can use the 'aem' command to start Apollo Environment Manager."
  echo "Note: This is a package ported from Ubuntu, some features may need adaptation for Arch Linux environment."
}

post_upgrade() {
  post_install
}

pre_remove() {
  echo "Cleaning up Apollo Neo Environment Manager..."
  
  # Clean up symbolic links
  rm -f /etc/bash_completion.d/aem
  rm -f /usr/share/zsh/functions/Completion/Unix/_aem
  rm -f /usr/bin/aem
  rm -rf /opt/apollo/neo/packages/env-manager-dev
  
  # Clean up GPG key
  if [ -f /etc/apt/keyrings/apolloauto.gpg ]; then
    rm -f /etc/apt/keyrings/apolloauto.gpg
  fi
  
  # Clean up repository configuration
  if [ -f /etc/apt/sources.list.d/apolloauto.list ]; then
    rm -f /etc/apt/sources.list.d/apolloauto.list
  fi
} 