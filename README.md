pim.vim
=======

This Vim plugin helps to make code sharing even easier over Pim.

Installation
------------

If you use the [Janus Vim distribution][Janus] then

    cd ~/.janus; git clone git://github.com/p-im/vim-pim.git pim

Otherwise if you use [pathogen.vim][vim-pathogen]:

    cd ~/.vim/bundle; git clone git://github.com/p-im/vim-pim.git pim

Otherwise do whatever it is you normally do...

&lt;Leader>
-----------
We'll assume that you have stuck with the Vim default `<leader>` of `\` -
if this is not the case then just replace all occurrences of `\` with
your `<leader>`

Functions
---------

### PimYank() `\py`

Yanks the selected text to the clipboard including Pim highlighting, for
example lines 25-29 of notify-webhook.py:

    def get_repo_name():
        if git(['rev-parse','--is-bare-repository']) == 'true':
            return os.path.basename(os.getcwd())
        else:
            return os.path.basename(os.path.dirname(os.getcwd()))

Would be yanked via `5\py` as:

    ```notify-webhook.py:25
    def get_repo_name():
        if git(['rev-parse','--is-bare-repository']) == 'true':
            return os.path.basename(os.getcwd())
        else:
            return os.path.basename(os.path.dirname(os.getcwd()))
    ```

Which would render in Pim as:

<img src="http://dl.dropbox.com/u/4404105/vim.pim_notify-webhook_example.png" width="625" height="116" />

### PimYankVisual() `\py`

As `PimYank()` above, except this runs in visual mode.

First enter visual mode (line-wise visual mode `V` works best) and make a
selection, e.g. `V}` to select all lines up to the end of the paragraph.

Next, invoke: `:call PimYankVisual()` or type `\py`.

Finally go to the target chat on Pim and paste.

[Janus]: https://github.com/carlhuda/janus
[vim-pathogen]: https://github.com/tpope/vim-pathogen
