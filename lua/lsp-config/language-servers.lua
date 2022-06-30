-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>E", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>Q", vim.diagnostic.setloclist, opts)

local util = require 'vim.lsp.util'

local formatting_callback = function(client, bufnr)
  vim.keymap.set('n', '<leader>f', function()
    local params = util.make_formatting_params({})
    client.request('textDocument/formatting', params, nil, bufnr)
  end, { buffer = bufnr })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "{d", '<cmd>lua vim.diagnostic.goto_prev({ border="rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "d}", '<cmd>lua vim.diagnostic.goto_next({ border="rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>d", '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    vim.cmd[[ command! Format execute 'lua vim.lsp.buf.formatting_sync(nil, 2000)' ]]

    if client.name ~= 'html' then
      client.resolved_capabilities.document_formatting = false
    elseif client.name ~= 'tsserver' then
        client.resolved_capabilities.document_formatting = false
    elseif client.name ~= 'sumneko_lua' then
        client.resolved_capabilities.document_formatting = false
    end
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}
require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["bashls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["cssls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["html"].setup({
    on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["intelephense"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["sqlls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["tsserver"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
	capabilities = capabilities,
	root_dir = function()
		return vim.loop.cwd()
	end,
})
require("lspconfig")["sumneko_lua"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
	capabilities = capabilities,
	root_dir = function()
		return vim.loop.cwd()
	end,
})

-- This config is for the server lua recognize the vim variables
-- require'lspconfig'.sumneko_lua.setup {
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }
