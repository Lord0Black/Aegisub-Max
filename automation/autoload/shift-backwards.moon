tr = aegisub.gettext

export script_name = tr'Duplicate and shift by 1 Frame backwards'
export script_description = tr'Duplicte selected lines and shift them to the frame before the original start frame'
export script_author = 'Thomas Goyne'
export script_version = '1'

contiguous_chunks = (arr) ->
  ret = {{}}
  last = ret[1]
  for value in *arr
    if not last[#last] or last[#last] + 1 == value
      last[#last + 1] = value
    else
      last = {value}
      ret[#ret + 1] = last
  ret

aegisub.register_macro script_name, script_description, (subs, selection, active) ->
  new_lines = {}
  for chunk in *contiguous_chunks selection
    continue unless #chunk > 0

    start = chunk[1]
    for sel in *chunk
      line = subs[sel]
      frame = aegisub.frame_from_ms(line.start_time)
      line.start_time = aegisub.ms_from_frame(frame - 1)
      line.end_time = aegisub.ms_from_frame(frame)

      if not new_lines[start]
        new_lines[start] = {}
      table.insert new_lines[start], line

  offset = 0
  new_selection = {}
  for line, chunk in pairs new_lines
    subs.insert line + offset, unpack chunk
    for i = 1, #chunk
      new_selection[#new_selection + 1] = line + offset + i - 1
    offset += #chunk

  aegisub.set_undo_point tr'duplicate lines'

  new_selection, new_selection[1]