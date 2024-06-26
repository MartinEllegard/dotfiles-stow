-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
local function augroup(name)
  return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

-- Add Blazor Support
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("blazor"),
  pattern = {
    "*.cshtml",
    "*.razor",
  },
  callback = function(event)
    vim.bu[event.buf].filetype = "html.cshtml.razor"
  end,
})
