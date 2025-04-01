function yda
  if test (count $argv) -eq 0
    echo "Error: Missing YouTube URL" >&2
    return 1
  end

  set url "$argv[1]"

  yt-dlp -f 'bestaudio[ext=m4a]' -x --audio-format mp3 -o '%(title)s.%(ext)s' "$url"

  if test $status -ne 0
     echo "Error: yt-dlp failed with exit code $status" >&2
     return 1
  end

end

