local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
	-- Vim map

	---------
	-- 移动
	---------
	["n|<C-u>"] = map_cmd("9k"):with_noremap(), -- 向上滚屏
	["n|<C-d>"] = map_cmd("9j"):with_noremap(), -- 向下滚屏

	["n|H"] = map_cmd("^"):with_noremap(), -- 移动到行首
	["n|L"] = map_cmd("$"):with_noremap(), -- 移动到行尾

	-------------
	-- 窗口管理
	-------------
	["n|sj"] = map_cmd(":sp<CR><C-w>k"):with_noremap(), -- 向下分屏
	["n|sl"] = map_cmd(":vsp<CR><C-w>h"):with_noremap(), -- 向右分屏
	["n|sk"] = map_cmd(":sp<CR>"):with_noremap(), -- 向上分屏
	["n|sh"] = map_cmd(":vsp<CR>"):with_noremap(), -- 向左分屏

	["n|sc"] = map_cmd("<C-w>c"):with_noremap(), -- 关闭当前窗口
	["n|so"] = map_cmd("<C-w>o"):with_noremap(), -- 关闭其他窗口

	["n|<A-h>"] = map_cmd("<C-w>h"):with_noremap(), -- 移动到左侧窗口
	["n|<A-j>"] = map_cmd("<C-w>j"):with_noremap(), -- 移动到右侧窗口
	["n|<A-k>"] = map_cmd("<C-w>k"):with_noremap(), -- 移动到上侧窗口
	["n|<A-l>"] = map_cmd("<C-w>l"):with_noremap(), -- 移动到下侧窗口

	["n|<A-Right>"] = map_cmd(":vertical resize +5<CR>"):with_noremap(), -- 增加窗口水平方向大小
	["n|<A-Left>"] = map_cmd(":vertical resize -5<CR>"):with_noremap(), -- 减小窗口水平方向大小
	["n|<A-Up>"] = map_cmd(":resize +5<CR>"):with_noremap(), -- 增加窗口垂直方向大小
	["n|<A-Down>"] = map_cmd(":resize -5<CR>"):with_noremap(), -- 减小窗口垂直方向大小

	["n|s="] = map_cmd("<C-w>="):with_noremap(), -- 所有窗口均分大小

	---------
	-- 文件
	---------
	["n|<leader>f"] = map_cmd(":Telescope find_files<CR>"):with_noremap(),
	["n|<leader>g"] = map_cmd(":Telescope live_grep<CR>"):with_noremap(),

	-----------
	-- 缓冲区
	-----------
	["n|<leader>="] = map_cmd("gg=G"):with_noremap(), -- 格式化

	["n|<Tab>"] = map_cr("normal zc"):with_noremap():with_silent(),
	["n|<S-Tab>"] = map_cr("normal zo"):with_noremap():with_silent(),
	["n|<C-x>k"] = map_cr("bdelete"):with_noremap():with_silent(),
	["n|<C-s>"] = map_cu("write"):with_noremap(),
	["n|Y"] = map_cmd("y$"),
	["n|D"] = map_cmd("d$"),
	["n|n"] = map_cmd("nzzzv"):with_noremap(),
	["n|N"] = map_cmd("Nzzzv"):with_noremap(),
	["n|J"] = map_cmd("mzJ`z"):with_noremap(),
	["n|<C-q>"] = map_cmd(":wq<CR>"),
	["n|<A-q>"] = map_cmd(":Bwipeout<CR>"),
	["n|<A-S-q>"] = map_cmd(":q!<CR>"),
	["n|<leader>o"] = map_cr("setlocal spell! spelllang=en_us"),
	-- Insert
	["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap(),
	["i|<C-b>"] = map_cmd("<Left>"):with_noremap(),
	["i|<C-a>"] = map_cmd("<ESC>^i"):with_noremap(),
	["i|<C-s>"] = map_cmd("<Esc>:w<CR>"),
	["i|<C-q>"] = map_cmd("<Esc>:wq<CR>"),
	-- command line
	["c|<C-b>"] = map_cmd("<Left>"):with_noremap(),
	["c|<C-f>"] = map_cmd("<Right>"):with_noremap(),
	["c|<C-a>"] = map_cmd("<Home>"):with_noremap(),
	["c|<C-e>"] = map_cmd("<End>"):with_noremap(),
	["c|<C-d>"] = map_cmd("<Del>"):with_noremap(),
	["c|<C-h>"] = map_cmd("<BS>"):with_noremap(),
	["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
	["c|w!!"] = map_cmd("execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"),
	-- Visual
	["v|J"] = map_cmd(":m '>+1<cr>gv=gv"),
	["v|K"] = map_cmd(":m '<-2<cr>gv=gv"),
	["v|<"] = map_cmd("<gv"),
	["v|>"] = map_cmd(">gv"),
}

bind.nvim_load_mapping(def_map)
