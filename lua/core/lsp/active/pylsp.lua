lspconfig = require("lspconfig").pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                -- formatter options
                autopep8 = {enabled = false},
                black = {enabled = true},
                yapf = {enabled = false},

                -- linter options
                pycodestyle = {enabled = false},
                pyflakes = {enabled = false},
                pylint = {enabled = false, executable = "pylint"},
                ruff = {enabled = true},

                -- type checker
                pylsp_mypy = {enabled = false},

                -- auto-completion options
                jedi_completion = {fuzzy = true},

                -- import sorting
                pyls_isort = {enabled = true, profile = "black"},
            },
        },
    },
})
