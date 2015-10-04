echo 'Installing Particle Lite Browser...'

echo ''

cd ~/

mkdir .particle_browser

cd .particle_browser

git clone https://github.com/magnusbane413/particle-lite-browser.git

cd particle-lite-browser

chmod +x particle

sudo cp particle /usr/bin
