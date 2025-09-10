vim.cmd([[command! -nargs=0 Nc lua require('vimasm').compile_and_run()]])
vim.cmd([[command! -nargs=0 Nd lua require('vimasm').compile_and_debug()]])

local M = {}

function M.compile_and_run()
  local asm = vim.fn.expand('%:p')
  if asm == '' then vim.cmd("echo 'No file'") return end
  local dir = vim.fn.fnamemodify(asm,":h")
  local base = vim.fn.expand('%:r')
  local com = base .. ".com"
  local lst = base .. ".lst"
  vim.cmd('write')
  vim.cmd("silent !/usr/bin/nasm -f bin " .. vim.fn.shellescape(asm) .. " -o " .. vim.fn.shellescape(com) .. " -l " .. vim.fn.shellescape(lst))
  if vim.v.shell_error == 0 then
    local run = string.format('silent !dosbox -noconsole -conf ~/.dosbox/dosbox-vimasm.conf -c "mount d %s" -c "d:" -c "%s"', dir, vim.fn.fnamemodify(com,":t"))
    vim.cmd(run)
  else
    vim.cmd("echo 'Compilation failed'")
  end
end

function M.compile_and_debug()
  local asm = vim.fn.expand('%:p')
  if asm == '' then vim.cmd("echo 'No file'") return end
  local dir = vim.fn.fnamemodify(asm,":h")
  local base = vim.fn.expand('%:r')
  local com = base .. ".com"
  local lst = base .. ".lst"
  vim.cmd('write')
  vim.cmd("silent !/usr/bin/nasm -f bin " .. vim.fn.shellescape(asm) .. " -o " .. vim.fn.shellescape(com) .. " -l " .. vim.fn.shellescape(lst))
  if vim.v.shell_error == 0 then
    local run = string.format('silent !dosbox -noconsole -conf ~/.dosbox/dosbox-vimasm.conf -c "mount d %s" -c "d:" -c "c:\\dos\\afd %s"', dir, vim.fn.fnamemodify(com,":t"))
    vim.cmd(run)
  else
    vim.cmd("echo 'Compilation failed'")
  end
end

vim.cmd([[autocmd BufRead,BufNewFile *.asm set filetype=nasm]])

return M

