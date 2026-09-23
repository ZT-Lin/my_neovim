return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
	--控制mason下载服务器
	--这里配置需要的编程语言
	ensure_installed = {
	    "lua_ls",
	    "pyright",
	    "clangd",
	    "hls",
	},
    },
    dependencies = {
	{
	    "williamboman/mason.nvim",
	    opts = {
		ui = {
		   icons = {
			package_installed = "󰄬",
			package_pending = "󰁔",
			package_uninstalled = "󰅖",
		    },
		},
	    },
	},
	{
	    "neovim/nvim-lspconfig",
	},
    }
}
