function redo
    if test $status -ne 0
        if test $history[1] != "redo"
            eval command sudo $history[1]
        else
            echo "Last command was redo itself"
        end
    else
        echo "Last command was succesfully yayyyy"
    end
end