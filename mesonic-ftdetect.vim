autocmd BufRead,BufNewFile * if (!exists("b:current_compiler") || b:current_compiler!=#"meson") && filereadable("meson.build") | compiler meson | endif
" overrides 'text' file type
autocmd BufRead,BufNewFile meson_options.txt set filetype=mesonopt
