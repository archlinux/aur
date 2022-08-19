post_install(){
     echo "================================================================="
     echo "                       注     意                                 "
     echo "    asciidoc-static-pages 依赖插件 rouge 和 asciidoctor-kroki    "
     echo "                                                                 "
     echo "    请使用以下命令安装 ：                                        "
     echo "    gem install rouge asciidoctor-kroki                          "
     echo "================================================================="
}
post_upgrade() {
  post_install
}
