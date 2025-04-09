function kindlegen_convert
  if test (count $argv) -eq 0
      echo "Usage: kindlegen_convert <input_file>"
      return 1
  end

  set input_file $argv[1]
  docker run -v (pwd):/source jagregory/kindlegen $input_file
end
