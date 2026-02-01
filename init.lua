-- VIM OPTIONS --------------------- 
vim.cmd("set expandtab")
vim.cmd("set relativenumber")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.g.mapleader = ' ' 
vim.g.maplocalleader = ' ' 


-- LAZY.NVIM & PLUGINS --------------------- 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
require("lazy").setup("plugins", opts)


-- CUSTOM STUFF --------------------- 
local function require_dir(modpath)
  local files = vim.fn.globpath(
    vim.fn.stdpath("config") .. "/lua/" .. modpath:gsub("%.", "/"),
    "*.lua",
    false,
    true
  )

  for _, f in ipairs(files) do
    local name = f:match("([^/]+)%.lua$")
    require(modpath .. "." .. name)
  end
end
-- loads the lua files from ~/.config/nvim/lua/custom 
require_dir("custom")
