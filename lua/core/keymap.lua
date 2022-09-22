local wk = require("which-key")

wk.register({
    s = {
        name = "Window",
        k = { "<cmd>sp<cr><c-w>k", "Split Window Down" },
        h = { "<cmd>vsp<cr><c-w>h", "Split Window Right" },
        j = { "<cmd>sp<cr>", "Split Window Up" },
        l = { "<cmd>vsp<cr>", "Split Winodw Left" },
        c = { "<C-w>c", "Close Window" },
        o = { "<C-w>o", "Close Other Windows" },
        ["="] = {"<C-w>=", "Make All Window Same Size"},
    },

    ["<leader>"] = {
        p = {
            name = "Project",
            p = { "<cmd>lua require('telescope').extensions.project.project{}<cr>", "Select Project" },
            r = { "<cmd>lua require('telescope').extensions.frecency.frecency{}<cr>", "Frecency" },
            e = { "<cmd>Telescope oldfiles<cr>", "OldFiles" },
            f = { "<cmd>lua require('modules.tools.telescope').find_files_under_project()<cr>", "Select File" },
            s = { "<cmd>lua require('modules.tools.telescope').search_under_project()<cr>", "Global Search" },
            g = { "<cmd>Telescope git_files<cr>", "Select Git File" },
            z = { "<cmd>Telescope zoxide list<cr>", "Zoxide List" },
        },
        f = {
            name = "Find Buffer",
            l = { "<cmd>HopChar1CurrentLineAC<cr>", "Jump Current Line By One Char After Cursor" },
            h = { "<cmd>HopChar1CurrentLineBC<cr>", "Jump Current Line By One Char Before Cursor" },
            j = { "<cmd>HopChar2AC<cr>", "Jump Visible Buffer By Two Chars After Cursor" },
            k = { "<cmd>HopChar2BC<cr>", "Jump Visible Buffer By Two Chars Before Cursor" },
            f = { "<cmd>HopChar2<cr>", "Jump Visible Buffer By Two Chars" },
            w = { "<cmd>HopWordcr<cr>", "Jump Visible Buffer By Word" },
            ["/"] = { "<cmd>HopPattern<cr>", "Jump Visible Buffer By Pattern" },
        },
        l = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        e = { "<cmd>NvimTreeToggle<cr>", "Toggle Explorer" },
        [";"] = {"<cmd>NvimTreeFindFile<cr>", "Focurs Current File In Explorer"},
        u = {"<cmd>UndotreeToggle<cr>", "Toggle UndoTree"},
        s = {
            name = "Session",
            s = {"<cmd>SaveSession<cr>", "Save Session"},
            r = {"<cmd>RestoreSession<cr>", "Save Session"},
            d = {"<cmd>DeleteSession<cr>", "Save Session"},
        },
        t = {
            name = "Terminal",
            t = {"<cmd>lua require('modules.editor.toggleterm').toggle_unname()<cr>)>", "Toggle GitUI"},
            o = {"<cmd>lua require('modules.editor.toggleterm').toggle_oneshot()<cr>)>", "Toggle GitUI"},
            g = {"<cmd>lua require('modules.editor.toggleterm').toggle_gitui()<cr>)>", "Toggle GitUI"},
        },
        g = {"<cmd>lua require('modules.editor.toggleterm').toggle_gitui()<cr>)>", "Toggle GitUI"},
    },
    g = {
        name = "Go",
        b = { "<cmd>BufferLinePick<cr>", "Select Tab" },
        h = { "<cmd>Lspsaga lsp_finder<cr>", "Lsp Finder" },
        l = { "<cmd>LSoutlineToggle<cr>", "Toggle Outline" },
        ["]"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go Next Diagnostic" },
        ["["] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go Prev Diagnostic" },
        s = { "<cmd>Lspsaga signature_help<cr>", "Show Signature" },
        re = { "<cmd>Lspsaga rename<cr>", "Rename" },
        k = { "<cmd>Lspsaga hover_doc<cr>", "Show Doc" },
        ["."] = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
        d = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
        D = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Peek Definition" },
        m = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
        M = { "<cmd>TroubleToggle lsp_references<cr>", "Toggle Trouble References" },
   }
})

vim.keymap.set('n', 'H', '^', {desc = ''})
vim.keymap.set('n', 'L', '$', {desc = ''})
vim.keymap.set('n', '<C-s>', '<cmd>write<cr>', {desc = ''})
vim.keymap.set('n', '<C-u>', '9k', {desc = ''})
vim.keymap.set('n', '<C-d>', '9j', {desc = ''})
vim.keymap.set('n', '<C-a>', 'ggVG', {desc = ''})
vim.keymap.set('n', '<Tab>', 'za', {desc = ''})
vim.keymap.set('n', 'n', 'nzzzv', {desc = ''})
vim.keymap.set('n', 'N', 'Nzzzv', {desc = ''})

vim.keymap.set('i', '<A-l>', "<Plug>(TaboutMulti)")
vim.keymap.set('i', '<A-h>', "<Plug>(TaboutBackMulti)")
vim.keymap.set('i', '<C-b>', "<Left>")
vim.keymap.set('i', '<C-f>', "<Right>")
vim.keymap.set('i', '<C-a>', "<esc>I")
vim.keymap.set('i', '<C-s>', "<esc><cmd>write<cr>")
vim.keymap.set('i', '<C-v>', "<C-r>+")

vim.keymap.set('c', '<C-f>', "<Right>")
vim.keymap.set('c', '<C-a>', "<Home>")
vim.keymap.set('c', '<C-b>', "<Left>")
vim.keymap.set('c', '<C-e>', "<End>")
vim.keymap.set('c', '<C-h>', "<BS>")
vim.keymap.set('c', '<C-d>', "<Del>")
vim.keymap.set('c', '<C-t>', "<C-R>=expand('%:p:h') . '\\' <CR>")

vim.keymap.set('v', 'J', ":m '>+1<cr>gv", {desc = ''})
vim.keymap.set('v', 'K', ":m '<-2<cr>gv", {desc = ''})
vim.keymap.set('v', '<', '<gv', {desc = ''})
vim.keymap.set('v', '>', '>gv', {desc = ''})
