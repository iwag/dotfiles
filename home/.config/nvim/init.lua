local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('base')

require('lazy').setup({
 -- coc.nvim
  {'neoclide/coc.nvim', branch = 'release'},   

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
  }, 

  {'nvim-lualine/lualine.nvim'},

  {'nvim-treesitter/nvim-treesitter'},

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {'fannheyward/telescope-coc.nvim'},
  {
  "nvim-telescope/telescope-frecency.nvim",
  config = function()
    require("telescope").load_extension "frecency"
  end,
  }
})

vim.cmd([[colorscheme everforest]])

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
