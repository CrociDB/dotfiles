-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local nvlsp = require "nvchad.configs.lspconfig"

vim.lsp.set_log_level("debug")

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
  capabilities = nvlsp.capabilities,
}

lspconfig.pyright.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = {"python"},
})

lspconfig.ts_ls.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
})

lspconfig.hls.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "haskell", "lhaskell", "cabal" },
})

lspconfig.zls.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "zig" },
})

lspconfig.gdscript.setup({
  on_attach = function()
    nvlsp.on_attach()

    vim.cmd("set noexpandtab")
    vim.cmd("set tabstop=4")
    vim.cmd("set shiftwidth=4")

    local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
    if not vim.loop.fs_stat(pipepath) then
      vim.fn.serverstart(pipepath)
    end
  end
})

lspconfig.ocamllsp.setup({})
lspconfig.racket_langserver.setup{}
lspconfig.html.setup{}
lspconfig.cssls.setup{}
