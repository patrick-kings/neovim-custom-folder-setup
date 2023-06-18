local auto_cmd = vim.api.nvim_create_autocmd

<<<<<<< HEAD
 -- open nvim tree when vim starts
=======
-- open vim tree immediately after launching nvim
>>>>>>> 2ef311e (add autosave autocmd)
auto_cmd({ "VimEnter" }, {
  pattern = "*",
  command = "NvimTreeToggle",
})
-- autosave on leaving a buffer
auto_cmd({ "BufLeave", "CmdlineEnter", "CmdWinEnter", "ExitPre"}, {
  pattern = "*",
  command = "update",
})
