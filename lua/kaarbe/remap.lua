vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Remap: file explorer" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Remap: move line down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Remap: move line up" })

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "C-d>zz")
keymap.set("n", "<C-u>", "C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("x", "<leader>p", "\"_dP")

keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")

keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Remap: replace word" }
)

keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {
  desc = "Remap: make file executable",
  silent = true
})

