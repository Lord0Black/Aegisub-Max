script_name="Poke-replacer"
script_description="Hanya berguna untuk rilisan Wire-Subs"
script_author="unanimated, dimodifikasi oleh Max FireHeart"
script_version="0"

function poke(subs, sel)
    for i=#subs,1,-1 do
      if subs[i].class=="dialogue" then
        local line=subs[i]
        local text=subs[i].text
		text=text
		:gsub("%/p","{#poke}")
		:gsub("%/c","{#char}")
		:gsub("%/t","{#tempat}")
		:gsub("%/s","{#serangan}")
		:gsub("%/i","{#item}")
		:gsub("%/h","{#istilah}")
		line.text=text
        subs[i]=line
      end
    end
end

aegisub.register_macro(script_name, script_description, poke)