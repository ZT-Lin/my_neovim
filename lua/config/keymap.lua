local keymap = vim.keymap

vim.g.mapleader = " "
--主要键

keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- 窗口模式
keymap.set("n", "<leader>sv", "<C-w>v")
-- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s")
-- 垂直新增窗口

-- 视觉模式
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--所选代码块下移
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--所选代码块上移
keymap.set("v", "H", "<gv")
--向右缩进
keymap.set("v", "L", ">gv")
--向左缩进


--LSP
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
	local opts = { buffer = ev.buf, silent = true }
		
	opts.desc = "Show LSP references"
	keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
	opts.desc = "Go to declaration"
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

	opts.desc = "Show LSP definition"
	keymap.set("n", "gd", vim.lsp.buf.definition, opts)

	opts.desc = "Show LSP implementations"
	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

	opts.desc = "Show LSP type definitions"
	keymap.set("n", "gt" , "<cmd>Telescope lsp_type_definitions<CR>", opts)

	opts.desc= "See available code actions"
	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

	opts.desc = "Smart rename"
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)


	opts.desc = "Show buffer diagnostics"
	keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics<CR>", opts)


	opts.desc = "Show line diagnostics"
	keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)


	opts.desc = "Go to prevoius diagnostic"
	keymap.set("n", "[d", function()
	    vim.diagnostic.jump({ count = -1, float = true })
	end, opts)


	opts.desc = "Go to next diagnostic"
	keymap.set("n", "]d", function()
	    vim.diagnostic.jump({ count = 1, float = true })
	end, opts)
		
	opts.desc = "Show documentation for what is uder..."
    	keymap.set("n","K",vim.lsp.buf.hover, opts)

	opts.desc = "Restart LSP"
	    keymap.set("n","<leaders>rs",":LspRestart<CR>", opts)
	end
	
})


local severity = vim.diagnostic.severity

vim.diagnostic.config({
    signs = {
	text = {
	    [severity.ERROR] = "󰅙",
	    [severity.WARN] = "",
	    [severity.HINT] = "",
	    [severity.INFO] = "",
	}
    }
})
