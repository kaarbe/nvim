local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["C-p"] = cmp.mapping.select_prev_item(cmp_select),
  ["C-n"] = cmp.mapping.select_next_item(cmp_select),
  ["C-y"] = cmp.mapping.confirm({ select = true }),
  ["C-space"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- Swift LSP
lsp.setup_servers({ "sourcekit" })
require("lspconfig").sourcekit.setup {
  cmd = { "/usr/bin/sourcekit-lsp" },
  filetypes = { "swift" },
}

lsp.on_attach(function(client, bufnr)
  local keymap = vim.keymap
  local vimLsp = vim.lsp
  local diagnostic = vim.diagnostic

  diagnostic.config({
    virtual_text = true
  })

  keymap.set("n", "gd", function() vimLsp.buf.definition() end, {
    buffer = bufnr, remap = false, desc = "Lsp: go to definition"
  })
  keymap.set("n", "K", function() vimLsp.buf.hover() end, {
    buffer = bufnr, remap = false, desc = "Lsp: view element info"
  })
  keymap.set("n", "<leader>vws", function() vimLsp.buf.workspace_symbol() end, {
    buffer = bufnr, remap = false, desc = "Lsp: view symbols matching string"
  })
  keymap.set("n", "<leader>vd", function() diagnostic.open_float() end, {
    buffer = bufnr, remap = false, desc = "Lsp: view diagnostic"
  })
  keymap.set("n", "<leader>vca", function() vimLsp.buf.code_action() end, {
    buffer = bufnr, remap = false, desc = "Lsp: view available code actions"
  })
  keymap.set("n", "<leader>vrr", function() vimLsp.buf.references() end, {
    buffer = bufnr, remap = false, desc = "Lsp: view references"
  })
  keymap.set("n", "<leader>vrn", function() vimLsp.buf.rename() end, {
    buffer = bufnr, remap = false, desc = "Lsp: rename symbol"
  })
  keymap.set("n", "[d", function() diagnostic.goto_next() end, {
    buffer = bufnr, remap = false, desc = "Lsp: go to next diagnostic"
  })
  keymap.set("n", "]d", function() diagnostic.goto_prev() end, {
    buffer = bufnr, remap = false, desc = "Lsp: go to preview diagnostic"
  })
  keymap.set("n", "C-g", function() vimLsp.buf.signature_help() end, {
    buffer = bufnr, remap = false, desc = "Lsp: signature help"
  })
end)

lsp.setup()

