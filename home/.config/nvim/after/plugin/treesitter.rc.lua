local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup {
-- ここでハイライトしたい言語を指定しておくと、起動時にインストールされます
  ensure_installed = {"vim","go","yaml","dockerfile","typescript","tsx","javascript","json","lua","html","markdown"},
  highlight = {
    enable = true, 
    additional_vim_regex_highlighting = false, 
    disable = {},
  },
  indent ={
    enable =true,
　},
  autotag = {
    enable = true,
  },
}
