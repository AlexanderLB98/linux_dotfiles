return {
	{
		"lervag/vimtex",
		lazy = false, -- lazy-loading will disable inverse search
		config = function()
			vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
			vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "pdflatex" -- o cualquier otro compilador de tu elección
		end,
		keys = {
			{ "<localLeader>l", "", desc = "+vimtex" },
		},
	},
}
