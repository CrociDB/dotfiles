local M = {
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier
    },
    haskell = {
      require("formatter.filetypes.haskell").stylish_haskell
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whites
    }
  }
}

-- vim.api.nvim_create_autocmd({ "bufwritepost" }, {
--   command = "formatwritelock"
-- })

return M
