#! /usr/bin/bash
#install all your programs at one hit:





TMUX="which tmux"
OUTPUT=eval $TMUX
echo "$OUTPUT"
if which tmux 2>/dev/null;
then
    OUTPUT=sudo apt install tmux
    echo "$OUTPUT"
else
    echo "You already have tmux"
fi

