function fh
  set -l history_lines
  if set -q ZSH_NAME
    set history_lines (fc -l 1)
  else
    set history_lines (history)
  end

  set -l selected (
    echo "$history_lines" | fzf +s --tac | sed 's/ *[0-9]* *//'
  )

  if test -n "$selected"
      for line in $selected
        echo "Executing: $line"
          # This line is more clear to the user than using eval
        commandline "$line"
      end
  else
     echo "No command selected"
  end
end

