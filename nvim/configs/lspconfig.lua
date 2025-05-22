-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local nvlsp = require "nvchad.configs.lspconfig"
local capabilities = require("blink.cmp").get_lsp_capabilities(nvlsp.capabilities)

vim.lsp.set_log_level("debug")

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.pyright.setup({
  on_attach = nvlsp.on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.ts_ls.setup({
  on_attach = nvlsp.on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
})

lspconfig.hls.setup({
  on_attach = nvlsp.on_attach,
  capabilities = capabilities,
  filetypes = { "haskell", "lhaskell", "cabal" },
})

lspconfig.zls.setup({
  on_attach = nvlsp.on_attach,
  capabilities = capabilities,
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

lspconfig.ocamllsp.setup({
  capabilities = capabilities
})

lspconfig.racket_langserver.setup({
  capabilities = capabilities
})

lspconfig.html.setup({
  capabilities = capabilities
})

lspconfig.cssls.setup({
  capabilities = capabilities
})

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" }
    }
  }
})
