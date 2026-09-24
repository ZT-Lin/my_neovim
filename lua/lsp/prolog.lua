local find_port = function()
    local uv = vim.uv
    local tcp = uv.new_tcp()

    tcp:bind("127.0.0.1", 0)

    local port = tcp:getsockname().port

    tcp:close_reset()

    return port
end

return {
    cmd = function(...)
        local server_port = find_port()

        vim.system({
            "swipl",
            "-g", "use_module(library(lsp_server))",
            "-g", "lsp_server:main",
            "-t", "halt",
            "--", "port", server_port,
        }, {}, function(...)
            print("LSP PROCESS EXITED", ...)
        end)

        vim.uv.sleep(500)

        return vim.lsp.rpc.connect(
            "127.0.0.1",
            server_port
        )(...)
    end,

    root_markers = { ".git" },

    filetypes = { "prolog" },
}
