local global = {}
local os_name = vim.loop.os_uname().sysname

global.is_mac = os_name == "Darwin"
global.is_linux = os_name == "Linux"
global.is_windows = os_name == "Windows_NT"

local path_sep = global.is_windows and "\\" or "/"
local home = global.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")

global.vim_path = vim.fn.stdpath("config")
global.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
global.modules_dir = global.vim_path .. path_sep .. "modules"
global.home = home
global.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
global.root_dir = vim.fn.getcwd()

return global
