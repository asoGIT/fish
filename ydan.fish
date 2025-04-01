function ydan
  if test (count $argv) -eq 0
    echo "Error: Missing YouTube URL" >&2
    return 1
  end

  set url "$argv[1]"

  # Prompt for filename
  read -l filename_base -P "Enter filename (without extension): "
  if test -z "$filename_base"
    echo "Error: Filename cannot be empty" >&2
    return 1
  end

  # Construct the output filename with extension
  set output_filename "$filename_base.%(ext)s"

  yt-dlp -f 'bestaudio[ext=m4a]' -x --audio-format mp3 -o "$output_filename" "$url"

  if test $status -ne 0
    echo "Error: yt-dlp failed with exit code $status" >&2
    return 1
  end
end

