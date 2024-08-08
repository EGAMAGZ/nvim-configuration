local map = vim.api.nvim_set_keymap

-- Move to previous/next
map('n', '<Space>,', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true, desc="Go to previous buffer" })
map('n', '<Space>.', '<Cmd>BufferNext<CR>', { noremap = true, silent = true, desc="Go to nex buffer" })
-- Re-order to previous/next
map('n', '<Space><', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true, desc= "Move buffer to previous position" })
map('n', '<Space>>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true, desc="Move buffer to next position"})
-- Goto buffer in position...
map('n', '<Space>1', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true, desc="Go to 1st buffer" })
map('n', '<Space>2', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true, desc="Go to 2nd buffer" })
map('n', '<Space>3', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true, desc="Go to 3rd buffer"})
map('n', '<Space>4', '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true, desc="Go to 4th buffer"})
map('n', '<Space>5', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true, desc="Go to 5th buffer"})
map('n', '<Space>6', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true,desc="Go to 6th buffer"})
map('n', '<Space>7', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true, desc="Go to 7th buffer"})
map('n', '<Space>8', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true, desc="Go to 8th buffer"})
map('n', '<Space>9', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true, desc="Go to 9th buffer"})
map('n', '<Space>0', '<Cmd>BufferLast<CR>', { noremap = true, silent = true, desc="Go to last buffer" })
-- Pin/unpin buffer
map('n', '<Space>p', '<Cmd>BufferPin<CR>', { noremap = true, silent = true, desc="Pin/Unpin current buffer" })
-- Close buffer
map('n', '<Space>c', '<Cmd>BufferClose<CR>', { noremap = true, silent = true, desc="Close current buffer" })
-- Wipeout buffer
map('n', '<Space>w', '<Cmd>BufferWipeout<CR>', { noremap = true, silent = true, desc="Wipeout buffer(s)" })
-- Close commands
--                 :BufferCloseAllButCurrent
map('n', '<Space>cc', '<Cmd>BufferCloseAllButCurrent<CR>', { noremap = true, silent = true, desc="Close all buffers but current" })
--                 :BufferCloseAllButPinned
map('n', '<Space>cp', '<Cmd>BufferCloseAllButPinned<CR>', { noremap = true, silent = true, desc="Close all buffers but pinned" })
--                 :BufferCloseAllButCurrentOrPinned
map('n', '<Space>cb', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', { noremap = true, silent = true, desc="Close all buffers but current or pinned" })
--                 :BufferCloseBuffersLeft
map('n', '<Space>cl', '<Cmd>BufferCloseBuffersLeft<CR>', { noremap = true, silent = true, desc="Close all buffers to the left" })
--                 :BufferCloseBuffersRight
map('n', '<Space>cr', '<Cmd>BufferCloseBuffersRight<CR>', { noremap = true, silent = true, desc="Close all buffers to the right" })

-- Magic buffer-picking mode
map('n', '<Space>bp', '<Cmd>BufferPick<CR>', { noremap = true, silent = true, desc="Pick the current buffer" })
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', { noremap = true, silent = true, desc="Order buffers by buffer number" })
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', { noremap = true, silent = true,desc ="Order buffers by buffer name" })
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', { noremap = true, silent = true, desc="Order buffers by buffer directory" })
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', { noremap = true, silent = true, desc="Order buffers by buffer languague" })
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', { noremap = true, silent = true, desc="Order buffers by buffer window number" })
