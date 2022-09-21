local wk = require("which-key")

wk.register({
    ["<C-u>"] = { "9k" },
    ["<C-d>"] = { "9j" },
    ["<C-s>"] = { "<cmd>write<cr>" },
    ["<Tab>"] = { "za" },
    n = { "nzzzv" },
    N = { "Nzzzv" },
    H = { "^" },
    L = { "$" },

    s = {
        name = "Window",
        j = { "<cmd>sp<cr><c-w>k", "Split Window Down" },
        l = { "<cmd>vsp<cr><c-w>h", "Split Window Right" },
        k = { "<cmd>sp<cr>", "Split Window Up" },
        h = { "<cmd>vsp<cr>", "Split Winodw Left" },
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

wk.register({
        -- g = { "<esc><cmd>lua toggle_gitui()<cr>", "Toggle Gitui" },
}, {mode = "t"})

wk.register({
    ["<A-l>"] = {"<Plug>(TaboutMulti)", "Tabout Multi"},
    ["<A-h>"] = {"<Plug>(TaboutBackMulti)", "Tabout Back Multi"},
    ["<C-u>"] = {"<C-G>u<C-U>"},
    ["<C-b>"] = {"<LEFT>"},
    ["<C-a>"] = {"<esc>I"},
    ["<C-s>"] = {"<esc><cmd>w<cr>"},
}, {mode = "i"})

wk.register({
    ["<C-b>"] = {"<Left>"},
    ["<C-f>"] = {"<Right>"},
    ["<C-a>"] = {"<Home>"},
    ["<C-e>"] = {"<End>"},
    ["<C-d>"] = {"<Del>"},
    ["<C-h>"] = {"<BS>"},
    ["<C-t>"] = {"[[<C-R>=expand('%:p:h') . '/' <CR>]]"},
}, {mode = "c"})

wk.register({
    ["J"] = {"<cmd>m '>+1<cr>gv=gv"},
    ["K"] = {"<cmd>m '>-2<cr>gv=gv"},
    ["<"] = {"<gv"},
    [">"] = {">gv"},
}, {mode = "v"})
