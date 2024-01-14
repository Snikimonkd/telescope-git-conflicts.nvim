# telescope-git-conflicts.nvim

Telescope git conflicts picker.

[out.webm](https://github.com/Snikimonkd/telescope-git-conflicts.nvim/assets/72211350/2106c640-ebe3-4086-aec2-77b655660db1)

## Setup

Using [lazy](https://github.com/folke/lazy.nvim):

```lua
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "Snikimonkd/telescope-git-conflicts.nvim",
    },
    config = function()
        require("telescope").setup({})
        require("telescope").load_extension("conflicts")
    end,
}
```
