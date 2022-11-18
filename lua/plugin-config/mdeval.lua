local status, mdeval = pcall(require, "mdeval")
if not status then
  vim.notify("没有找到 mdeval")
  return
end

mdeval.setup({
  -- Don't ask before executing code blocks
  require_confirmation = false,
  -- Change code blocks evaluation options.
  eval_options = {
    -- Set custom configuration for C++
    cpp = {
      command = { "g++", "-std=c++14", "-O0" },
      language_code = "cpp", -- Markdown language code
      exec_type = "compiled", -- compiled or interpreted
      default_header = [[
      ]],
    },
  },
  results_label = "*Results:*",
})
vim.api.nvim_set_keymap(
  "n",
  "<leader>c",
  "<cmd>lua require 'mdeval'.eval_code_block()<CR>",
  { silent = true, noremap = true }
)
vim.g.markdown_fenced_languages = { "python", "cpp" }
