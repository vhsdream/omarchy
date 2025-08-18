-- Set leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Select all content in the file
vim.keymap.set("", "<C-a>", "gg<S-v>G", {})

-- Save, quit, save&quit
vim.keymap.set("", "<leader>w", ":w!<CR>", {})
vim.keymap.set("", "<leader>x", ":q!<CR>", {})
vim.keymap.set("", "<leader>q", ":wqa<CR>", {})

-- remove trailing whitespace
vim.keymap.set("n", "<leader>tw", [[:lua vim.lsp.buf.format()<cr> <bar> :%s/\s\+$//e<cr>]])

-- Resizing splits
vim.keymap.set("n", "<M-+>", ":res +5<CR>", { desc = "Increase window height by 5" })
vim.keymap.set("n", "<M-->", ":res -5<CR>", { desc = "Decrease window height by 5" })
vim.keymap.set("n", "<M->>", ":vert res +5<CR>", { desc = "Increase window width by 5" })
vim.keymap.set("n", "<M-<>", ":vert res -5<CR>", { desc = "Decrease window width by 5" })
vim.keymap.set("n", "<M-=>", ":wincmd =<CR>", { desc = "Make all windows equal size" })

-- moves a selected text block up or down rows
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append line below to current line, keeping cursor in place
vim.keymap.set("n", "J", "mzJ`z")

-- half-page jump up or down, keeping cursor in middle of page
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search results in middle of page
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- select # of lines to copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- copy entire line to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- pops you into global search & replace mode for the current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
