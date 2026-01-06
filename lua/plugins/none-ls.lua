return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "jay-babu/mason-null-ls.nvim",
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local mason_null_ls = require("mason-null-ls")

        mason_null_ls.setup({
            ensure_installed = {
                "stylua",
                "black",
                "clang_format",
                "ast_grep",
            },
            automatic_installation = true,
        })

        local formatting = null_ls.builtins.formatting
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        -- Tentative de chargement sécurisée pour ast_grep
        local sources = {
            formatting.stylua,
            formatting.black,
            formatting.clang_format,
        }

        -- On vérifie si ast_grep est disponible via extras
        local ok, ast_grep = pcall(require, "none-ls.diagnostics.ast_grep")
        if not ok then
            -- Si le chemin ci-dessus échoue, on teste le chemin alternatif
            ok, ast_grep = pcall(require, "null_ls.diagnostics.ast_grep")
        end

        if ok then
            table.insert(sources, ast_grep)
        end

        null_ls.setup({
            sources = sources,
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                bufnr = bufnr,
                                filter = function(f_client)
                                    return f_client.name == "null-ls"
                                end,
                            })
                        end,
                    })
                end
            end,
        })
    end,
}
