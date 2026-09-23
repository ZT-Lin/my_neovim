local o = vim.opt

o.relativenumber = true 
--相对数字
--数字+hjkl 垂直跳转

o.number = true
--数字功能

o.cursorline = true
--高亮所在行

o.shiftwidth = 4
--tab长度

-- 彻底禁用 netrw
 vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

  -- optionally enable 24-bit colour
  vim.opt.termguicolors = true
