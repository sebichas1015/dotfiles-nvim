-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy") -- colores sintaxis
vim.cmd.colorscheme("tokyonight")
-- Agregar una línea guía en la columna 80
vim.opt.colorcolumn = "80"
vim.o.relativenumber = false -- Desactiva la numeración de líneas relativa
