require("null-ls").setup({
    sources = {
        -- Formatting
        require("null-ls").builtins.formatting.stylua,      --Formatter for lua
        require("null-ls").builtins.formatting.black,        --Formatter for python
        require("null-ls").builtins.formatting.prettier,        --Formatter for html, css, js, ts and others
        require("null-ls").builtins.formatting.sql_formatter,       --Formatter for sql
        require("null-ls").builtins.formatting.phpcbf,      --Formatter for php

        -- vim.lsp.buf.formatting_sync(nil, 2000)
        -- Diagnostics
        require("null-ls").builtins.diagnostics.eslint,     --Diagnostics for js, ts, and others
        require("null-ls").builtins.diagnostics.php,     --Diagnostics for php
        require("null-ls").builtins.diagnostics.flake8,     --Diagnostics for python
        require("null-ls").builtins.diagnostics.sqlfluff,     --Diagnostics for sql
        require("null-ls").builtins.diagnostics.stylelint,     --Diagnostics for css
        require("null-ls").builtins.diagnostics.tidy,     --Diagnostics for html
        require("null-ls").builtins.diagnostics.luacheck,     --Diagnostics for lua
    },
})
