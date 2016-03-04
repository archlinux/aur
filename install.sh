post_install() {

  echo ""
  echo "Neovim users:"
  echo ""
  echo "    # ln -s /usr/share/vim/vimfiles/after/ftplugin/markdown/instant-markdown.vim"
  echo "            /usr/share/nvim/runtime/ftplugin/markdown/"

  echo ""
  echo "By default, vim-instant-markdown will automatically launch the preview window when you open a Markdown file."
  echo "If you want to manually control this behavior, you can specify"
  echo ""
  echo "    let g:instant_markdown_autostart = 0"
  echo ""
  echo "in your .vimrc. You can then manually trigger preview via the command :InstantMarkdownPreview."
  echo "This command is only available inside Markdown buffers and when the autostart option is turned off."
  echo ""
  echo "For more possible configurations, visit https://github.com/suan/vim-instant-markdown#configuration."
  echo ""
}

# vim: set ts=2 sw=2
