-- 解析器、自动高亮功能


return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "lua", "java", "python","markdown","markdown_inline","vim" },
        highlight = { enable = true },
        indent =  { enable = true },
        autotage =  { enable = true },
        auto_install = false,
      })
    end,
}
