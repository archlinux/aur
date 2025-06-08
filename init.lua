vim.g.LAZY_NVIM_SETUP_COMPLETE = true

local starter_path = debug.getinfo(1, "S").source:match("@?(.*[/\\])")
vim.opt.rtp:prepend(starter_path)