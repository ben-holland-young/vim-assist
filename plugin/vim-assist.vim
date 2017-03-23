function! Vimmer()
let cmd = input("What would you like to do?")
python << EOF
import vim,re
command = vim.eval("cmd")
def normal(str):
    vim.command("normal "+str)
#sep = command.split(" ")
vocab = {"visual": "v", "change": "c", "delete": "d", "yank" : "y", "copy" : "y", "paste": "p", "inside" : "i", "around" : "a", "till" : "t", "word" : "w", "sentence" : "s", "paragraph" : "p", "block" : "b", "tag" : "t", "quotes": "\"", "brackets" : "(", "go to line" : ":", "back to top" : "gg", "bottom" : "G", "start of line" : "0", "delete line" : "dd", "line above" : "O", "line below" : "o"}

pattern = re.compile(r'\b(' + '|'.join(vocab.keys()) + r')\b')
result = pattern.sub(lambda x: vocab[x.group()], command).replace(" ","")
normal(result)


EOF
endfunction

map <leader>vv :call Vimmer()<cr>
