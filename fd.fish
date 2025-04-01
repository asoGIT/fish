function fd
  if test (count $argv) -gt 1
    echo "Error: Only one search location allowed" >&2
    return 1
  end

  set -l start_dir $argv[1]
  if not set -q start_dir
    set start_dir .
  end

  set -l selected_dirs (
    find "$start_dir" -type d -print | fzf
  )

  if test $status -ne 0
    echo "Error: No directory selected." >&2
    return 1
  end

  if test -z "$selected_dirs"
    echo "Error: No directories found." >&2
    return 1
  end

  cd "$selected_dirs"
  if test $status -ne 0
    echo "Error: Could not change directory to '$selected_dirs': $status" >&2
    return 1
  end

  echo "Changed to directory '$selected_dirs'"
end
