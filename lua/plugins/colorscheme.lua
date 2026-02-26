local onedark = {
  "navarasu/onedark.nvim",
  config = function()
    require("onedark").setup({
      style = "darker",
    })
  end,
}

return {
	{"catppuccin/nvim"},
	{"xero/miasma.nvim"},
	{"folke/tokyonight.nvim"},
	{"morhetz/gruvbox"},
	onedark
}
