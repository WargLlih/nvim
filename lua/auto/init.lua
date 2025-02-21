function text_highlight()
  local augroup = vim.api.nvim_create_augroup      -- Create/get autocommand group
  local autocmd = vim.api.nvim_create_autocmd      -- Create autocommand
  -- local usercmd = vim.api.nvim_create_user_command -- Create user command
  autocmd("TextYankPost", {
    group = augroup("YankHighlight", { clear = true }),
    callback = function()
      vim.highlight.on_yank({ timeout = "700" })
    end,
  })
end

return {
  text_highlight=text_highlight
}
