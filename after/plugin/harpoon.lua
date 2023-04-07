local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local keymap = vim.keymap

keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: add file" })
keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon: toggle quick menu" })

keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Harpoon: navigate to file 1" })
keymap.set("n", "<C-j>", function() ui.nav_file(2) end, { desc = "Harpoon: navigate to file 2" })
keymap.set("n", "<C-k>", function() ui.nav_file(3) end, { desc = "Harpoon: navigate to file 3" })
keymap.set("n", "<C-l>", function() ui.nav_file(4) end, { desc = "Harpoon: navigate to file 4" })
