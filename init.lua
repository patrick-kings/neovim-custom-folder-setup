local auto_cmd = vim.api.nvim_create_autocmd

-- open nvim tree when vim starts
-- auto_cmd({ "VimEnter" }, {
--   pattern = "*",
--   command = "NvimTreeToggle",
-- })

-- format rust files
-- auto_cmd({ "BufWritePre" }, {
--   pattern = "*.rs",
--   command = "RustFmt",
-- })
--

-- save files automatically
auto_cmd({
  "FocusLost",
  "BufLeave",
  "ExitPre",
  "UILeave",
  "QuitPre",
  "VimLeave",
}, {
  pattern = "*.*, ?akefile*",
  command = "write",
})
