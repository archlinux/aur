post_install() {
echo "Don't forget to update your webserver config. Nginx example:"
cat <<EOF
server {
  index index.html
  location /web {
    root /usr/share/webapps/owntracks-frontend;
  }
}
EOF
}
