return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "jay-babu/mason-nvim-dap.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("mason").setup()

            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "debugpy",
                    "codelldb",
                    "java-debug-adapter",
                    "node-debug2-adapter",
                    "bash-debug-adapter",
                },
                automatic_installation = true,
                handlers = {}, -- Ensures automatic handlers don’t override manual adapters you define
            })
        end,
    },

    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            -- Keymaps
            vim.keymap.set("n", "<F5>", dap.continue)
            vim.keymap.set("n", "<F10>", dap.step_over)
            vim.keymap.set("n", "<F11>", dap.step_into)
            vim.keymap.set("n", "<F12>", dap.step_out)
            vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)

            -- Rust/C/C++
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
                    args = { "--port", "${port}" },
                },
            }

            dap.configurations.rust = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                }
            }
            dap.configurations.c = dap.configurations.rust
            dap.configurations.cpp = dap.configurations.rust

            -- JS/TS Debugging
            dap.adapters.node2 = {
                type = "executable",
                command = "node",
                args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
            }
            dap.configurations.javascript = {
                {
                    type = "node2",
                    request = "launch",
                    program = "${file}",
                    cwd = vim.fn.getcwd(),
                    sourceMaps = true,
                    protocol = "inspector",
                    console = "integratedTerminal",
                }
            }
            dap.configurations.typescript = dap.configurations.javascript

            -- Bash Debugging
            dap.adapters.bashdb = {
                type = "executable",
                command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
            }
            dap.configurations.sh = {
                {
                    type = "bashdb",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                    terminalKind = "integrated",
                }
            }

            -- Lua Debugging (Optional, requires external nlua server)
            dap.adapters.nlua = function(callback, config)
                callback({
                    type = "server",
                    host = config.host or "127.0.0.1",
                    port = config.port or 8086,
                })
            end
            dap.configurations.lua = {
                {
                    type = "nlua",
                    request = "attach",
                    name = "Attach to running Neovim instance",
                },
            }
        end,
    },

    {
        "mfussenegger/nvim-dap-python",
        config = function()
            require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
        end,
    },

    {
        "mfussenegger/nvim-jdtls",
        config = function()
            local jdtls = require("jdtls")
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "java",
                callback = function()
                    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
                    local root_dir = require("jdtls.setup").find_root(root_markers)
                    if not root_dir then return end
                    local workspace = vim.fn.stdpath("data") .. "/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

                    local bundles = vim.split(vim.fn.glob(
                        vim.fn.stdpath("data") ..
                        "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
                        1), "\n")

                    require("jdtls").start_or_attach({
                        cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls", "-data", workspace },
                        root_dir = root_dir,
                        init_options = { bundles = bundles },
                    })

                    require("jdtls.dap").setup_dap({ hotcodereplace = 'auto' })
                end,
            })
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dapui = require("dapui")
            local dap = require("dap")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
        end,
    },
}
