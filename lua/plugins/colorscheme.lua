local onedark = {
  "navarasu/onedark.nvim",
  config = function()
    require("onedark").setup({
      style = "darker",
    })
  end,
}

local vscode = {
  "Mofiqul/vscode.nvim",
  config = function()
    require("vscode").setup({
      style = "dark",
      transparent = false,
    })
  end,
}

return {
	{"catppuccin/nvim"},
	{"xero/miasma.nvim"},
	{"folke/tokyonight.nvim"},
	{"morhetz/gruvbox"},
	{"projekt0n/github-nvim-theme"},
	onedark,
	vscode
}
