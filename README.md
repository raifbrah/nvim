<h1 align="center">⌨️ Конфиг Neovim для разработки на VueJS</h1>

# Важно!

- Я буду описывать этапы установки Neovim под Ubuntu, на других системах установка может различаться

# Этапы установки

### Перед установкой конфигурационных файлов, необходимо убедиться что на вашем ПК установлены или установить следующие программы и плагины:

- <a href="https://git-scm.com/">Git</a> (для клонирования репозитория)
- <a href="https://nodejs.org/en/">Node.js</a> (для работы Neovim и его плагинов)
- <a href="https://gcc.gnu.org/">Компилятор gcc</a> (для работы Treesitter). Обычно на Unix системах он установлен по умолчанию
- <a href="https://github.com/junegunn/vim-plug">vim-plug</a> (менеджер плагинов Neovim)
- <a href="https://neovim.io/">Neovim</a> (не ниже 8 версии)
- <a href="https://github.com/BurntSushi/ripgrep">BurntSushi/ripgrep</a> (для работы ripgrep в Telescope)
- <a href="https://github.com/jesseduffield/lazygit">Lazygit</a> (Удобнее всего запускать через toogleterm.nvim)

###### Packages:

```sh
sudo apt install -y git gh nodejs-lts build-essential neovim ripgrep
```

###### Vim-plug:

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Установка конфигурационных файлов:

> Команды необходимо запускать в терминале Linux

###### Создаем директорию для конфига (Neovim берет конфиг именно из этой папки)

```sh
mkdir ~/.config
```

###### Клонируем конфиги из репозитория

```sh
git clone https://github.com/raifbrah/nvim ~/.config/
```

###### Далее необходимо запустить Neovim следующей командой:

```sh
nvim
```

###### Для установки плагинов необходимо запустить установщик vim-plug (внутри Neovim):

```vimscript
:PlugInstall
```

vim-plug установит плагины и затем автоматически запуститься установка плагинов coc-neovim

После следующего запуска Treesitter установит свои плагины

# Заключение

Всё установлено, теперь вы можете пользоваться данной конфигурацией или изменять по своему вкусу
