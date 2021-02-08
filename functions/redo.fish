function _check_github_command

    set -l GIT_CLONE_COMMAND "git clone"
    set -l GIT_HTTPS_HOST_NAME "https://github.com"
    set -l GIT_SSH_HOST_NAME "git@github.com"

    if string match -r -q "$GIT_CLONE_COMMAND" $history[1]
        echo "$history[1]"
    else
        if string match -r -q "$GIT_HTTPS_HOST_NAME|$GIT_SSH_HOST_NAME" $history[1]
            echo "$GIT_CLONE_COMMAND $history[1]"
        else
            echo "0"
        end
    end
end

function redo
    if test $status -ne 0
        if test $history[1] != "redo"
            set -l git_command (_check_github_command)
            if test $git_command != "0"
                eval command $git_command
            else
                eval command sudo $history[1]
            end
        else
            echo "Last command was redo itself"
        end
    else
        echo "Last command was succesfully yayy"
    end
end