local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 null-ls")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = { -- Formatting ---------------------
		--  brew install shfmt
		formatting.shfmt, -- StyLua
		formatting.stylua, -- frontend
		formatting.prettier.with({ -- 只比默认配置少了 markdown
			filetypes = {
				"rust",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"graphql",
			},
			prefer_local = "node_modules/.bin",
		}),
		-- rustfmt
		formatting.rustfmt,
		-- Diagnostics  ---------------------
		diagnostics.eslint.with({
			prefer_local = "node_modules/.bin",
		}), -- code actions ---------------------
		-- code_actions.gitsigns,
		code_actions.eslint.with({
			prefer_local = "node_modules/.bin",
		}),
	},
	-- #{m}: message
	-- #{s}: source name (defaults to null-ls if not specified)
	-- #{c}: code (if available)
	diagnostics_format = "[#{s}] #{m}",
	-- 保存自动格式化
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({
						bufnr = bufnr,
					})
					-- vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
