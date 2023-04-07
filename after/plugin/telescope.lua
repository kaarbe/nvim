local builtin = require('telescope.builtin')
local keymap = vim.keymap

keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Telescope: search project files" })
keymap.set('n', '<C-p>', builtin.git_files, { desc = "Telescope: git files" })
keymap.set(
  'n',
  '<leader>ps',
  function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
  end,
  { desc = "Telescope: search for a text" }
)

