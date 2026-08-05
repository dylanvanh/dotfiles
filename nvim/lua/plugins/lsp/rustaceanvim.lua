return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        cmd = { vim.fn.expand("~/.cargo/bin/rust-analyzer") },
      },
    },
  },
}
