--侧边栏文件树
return {
    {
        "nvim-tree/nvim-tree.lua",
        keys = {
            { "<leader>e", ":NvimTreeToggle<CR>", desc = "Explorer" },
        },
        config = function()
            require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
	    })
        end,
    }
}
