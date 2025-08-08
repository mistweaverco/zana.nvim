<div align="center">

![Zana Logo](assets/logo.svg)

# zana.nvim

[![Made with love](assets/badge-made-with-love.svg)](https://github.com/mistweaverco/zana.nvim/graphs/contributors)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/mistweaverco/zana.nvim?style=for-the-badge)](https://github.com/mistweaverco/zana.nvim/releases/latest)
[![Discord](assets/badge-discord.svg)](https://getzana.net/discord)

[Requirements](#requirements) • [Install](#install) • [Documentation](https://neovim.getzana.net/)

<p></p>

A thin layer to use [packages](https://github.com/mistweaverco/zana-registry)
installed via [Zana](https://github.com/mistweaverco/zana-client) in Neovim.

You only need this, if you dont want to have your `PATH` modified by sourcing `zana env`.

<p></p>

</div>

## Requirements

- Neovim 0.10.0+

## Install

Via [lazy.nvim](https://github.com/folke/lazy.nvim):

### Configuration

```lua
{ 'mistweaverco/zana.nvim', opts = {} },
```

> `opts` needs to be an empty table.

