--[[
This file .lua is a tool that facilitates the task of making Karaoke Effects in Aegisub, has many options
and variations that will make an impact never seems to another. Its use must be within the parameters
established for proper operation. if for some reason has an error in its programming or have any questions
about their use, do not try to solve it, unless you know very well what to do. otherwise, I can send an
email to karalaura2012@gmail.com

If you make a Karaoke Effect with this tool and want others to see your work, you can send me the
specifications of the parameters and I will gladly go up to my channel 'You Tube' to share your creations.

If you want to put the credits of this program, you can put "made with Parametrics Curves from KaraLaura"
or "Effect done with the help of Parametrics Curves". Since the credits to me know that this tool is being
used and I can share more material assistance in the future. Thank you very much for using this! ^^'...
]]

include("karaskel.lua")
script_name = "Parametrics FX Maker"
script_description = "Effects Automation. Creating Effects with Parametrics Curves"
script_author = "KaraLaura"
script_version = "1.0.86"

pi = math.pi
sin = math.sin
cos = math.cos
tan = math.tan
asin = math.asin
acos = math.acos
atan = math.atan
sinh = math.sinh
cosh = math.cosh
tanh = math.tanh
log = math.log10
ln = math.log
abs = math.abs
floor = math.floor
ceil = math.ceil
rand = math.random

function do_fx(subs, meta, line, sett)
	
	local color1_randii = _G.ass_color(_G.HSV_to_RGB(math.random(360),math.random(8,10)/10, math.random(8,10)/10))
	local color3_randii = _G.ass_color(_G.HSV_to_RGB(math.random(360),math.random(8,10)/10, math.random(8,10)/10))
	local color1_randff = _G.ass_color(_G.HSV_to_RGB(math.random(360),math.random(8,10)/10, math.random(8,10)/10))
	local color3_randff = _G.ass_color(_G.HSV_to_RGB(math.random(360),math.random(8,10)/10, math.random(8,10)/10))
	
	l = {}
	l.left = line.left
	l.center = line.center
	l.right = line.right
	l.top = line.top
	l.middle = line.middle
	l.bottom = line.bottom
	l.width = line.width
	l.height = line.height
	l.duration = line.duration
	
	for i = 1, line.kara.n do
		local syl = line.kara[i]
		local x = math.ceil(syl.center + line.left)
		local y = line.middle
		
		if sett.noblank == true then
			noblank = ""
		else
			noblank = "KaraLaura"
		end
		
		if syl.text ~= noblank then
		
			if sett.effect == "Default Curve" or (sett.nocurve == true and sett.effect == "Advanced Curve") then
			
				if sett.bold == true then
					bold = 1
				else
					bold = 0
				end
				if sett.italic == true then
					italic = 1
				else
					italic = 0
				end
				
				-- Entrys ----------------------------
				if sett.fx_entry == "Clasic" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
					tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
					if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
					l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
					l.end_time = line.start_time + syl.start_time + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s%s\\fad(300,0)\\an5\\pos(%s,%s)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
					,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,x,y,syl.text_stripped)
					l.layer = sett.layer1
					subs.append(l)
				elseif sett.fx_entry == "Overturn Move" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
					tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
					if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
					l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
					l.end_time = line.start_time + syl.start_time + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\frx%s\\org(%s,%s)\\alpha&HEE&\\t(0,%s,\\frx-360)\\t(0,%s,\\alpha&H00&)%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,%s,%s)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a)
					,_G.ass_alpha(sett.alpha_4a),5*syl.i,x,line.middle,620+50*syl.i,620+160*syl.i,text_tag,x,y+1.6*syl.height*math.cos(-0.78+4.71*(syl.i-1)/(line.kara.n-1)),x,y,0,600+50*syl.i,syl.text_stripped)
					l.layer = sett.layer1
					subs.append(l)
				elseif sett.fx_entry == "Upward Move" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
					tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
					if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
					l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
					l.end_time = line.start_time + syl.start_time + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\iclip(%s,%s,%s,%s)%s\\an5\\move(%s,%s,%s,%s,0,300)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a)
					,_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),x-syl.width/2-10,line.bottom+1,x+syl.width/2+10,line.bottom+1.6*syl.height,text_tag,x,y+syl.height,x,y,syl.text_stripped)
					l.layer = sett.layer1
					subs.append(l)
				elseif sett.fx_entry == "Catapult Move" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
					tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
					if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
					l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
					l.end_time = line.start_time + syl.start_time + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\t(0,400,\\frx360)%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,0,400)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
					,_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,x,y+0.6*syl.height*(-1)^syl.i,x,y,syl.text_stripped)
					l.layer = sett.layer1
					subs.append(l)
				elseif sett.fx_entry == "Knife Move" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
					tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
					if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
					l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
					l.end_time = line.start_time + syl.start_time + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fscx%s\\fscy%s\\fry60\\t(0,200,\\fscx%s\\fscy%s\\fry0)%s\\an5\\pos(%s,%s)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a)
					,_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),0.1*line.styleref.scale_x,2*line.styleref.scale_y,line.styleref.scale_x,line.styleref.scale_y,text_tag,x,y,syl.text_stripped)
					l.layer = sett.layer1
					subs.append(l)
				elseif sett.fx_entry == "Blender" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
					tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
					if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
					l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
					l.end_time = line.start_time + syl.start_time + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fscx0\\fscy0\\t(0,%s,\\fscx%s\\fscy%s\\fr360)%s\\fad(300,0)\\an5\\pos(%s,%s)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
					,_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),300+25*syl.i,line.styleref.scale_x,line.styleref.scale_y,text_tag,x,y,syl.text_stripped)
					l.layer = sett.layer1
					subs.append(l)
				elseif sett.fx_entry == "Move 1" then
					l = table.copy(line)
					char = {} 
					if syl.text_stripped ~= "" and syl.duration > 0 then
						cn = unicode.len(line.text_stripped:gsub(" ",""))
						ci = 1
						left, width = line.left + syl.left, 0
						
						for c in unicode.chars(syl.text_stripped) do
							width = aegisub.text_extents(line.styleref, c)
							char.left = left
							char.center = left + width / 2
							char.right = left + width 
							l.effect = "curve fx"
							l.dur_fx = syl.start_time + 50*(line.kara.n - syl.i +ci/cn)
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time - 50*(line.kara.n - syl.i +ci/cn) + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fr%s\\frx%s\\fry%s\\t(0,320,\\fr0\\frx0\\fry0)%s\\fad(400,0)\\an5\\move(%s,%s,%s,%s,0,320)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10
							,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),math.random(-360,360)
							,math.random(-360,360),math.random(-360,360),char.center+math.random(80,120),line.middle+math.random(-40,40),char.center,line.middle,text_tag,c)
							left = left + width
							ci = ci + 1
							l.layer = sett.layer1
							subs.append(l)
						end
					end
				elseif sett.fx_entry == "Screw" then
					l = table.copy(line)
					char = {} 
					if syl.text_stripped ~= "" and syl.duration > 0 then
						cn = unicode.len(line.text_stripped:gsub(" ",""))
						ci = 1
						left, width = line.left + syl.left, 0
						
						for c in unicode.chars(syl.text_stripped) do
							width = aegisub.text_extents(line.styleref, c)
							char.left = left
							char.center = left + width / 2
							char.right = left + width
							l.effect = "curve fx"
							l.dur_fx = syl.start_time + 50*(line.kara.n - syl.i +ci/cn)
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time - 50*(line.kara.n - syl.i +ci/cn) + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\frx180\\t(0,380,0.7,\\frx0)%s\\fad(300,0)\\an5\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
							,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,char.center,line.middle,c)
							left = left + width
							ci = ci + 1
							l.layer = sett.layer1
							subs.append(l)
						end
					end
				elseif sett.fx_entry == "Move 2" then
					l = table.copy(line)
					char = {} 
					if syl.text_stripped ~= "" and syl.duration > 0 then
						cn = unicode.len(line.text_stripped:gsub(" ",""))
						ci = 1
						left, width = line.left + syl.left, 0
						
						for c in unicode.chars(syl.text_stripped) do
							width = aegisub.text_extents(line.styleref, c)
							char.left = left
							char.center = left + width / 2
							char.right = left + width
							l.effect = "curve fx"
							l.dur_fx = syl.start_time + 50*(line.kara.n - syl.i) + 250*ci/cn
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time - 50*(line.kara.n - syl.i) -250*ci/cn + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(%s,%s)\\t(0,140,\\fr-0.12)\\t(140,420,\\fr0.12)\\t(420,560,\\fr0)%s\\fad(400,0)\\an5\\move(%s,%s,%s,%s,0,560)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
							,_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),-10000,line.middle,text_tag,char.center+32,line.middle,char.center,line.middle,c)
							left = left + width
							ci = ci + 1
							l.layer = sett.layer1
							subs.append(l)
						end
					end
				elseif sett.fx_entry == "Move 3" then
					maxk = 6
					for k = 1, maxk do
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.start_time - 50*(syl.i - line.kara.n + 1) + 120*(k-1)/maxk
						tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
						if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
						l.start_time = line.start_time + 50*(syl.i-line.kara.n + 1) - 120*(k-1)/maxk + rem_time
						l.end_time = l.start_time + 360
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\alpha%s%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,0,360)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
						,_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),_G.ass_alpha(100+150*(k-1)/(maxk)),text_tag,x+80,y,x,y,syl.text_stripped)
						l.layer = sett.layer1
						subs.append(l)
					end
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.start_time - 50*(syl.i - line.kara.n + 1) + 120
					tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
					if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
					l.start_time = line.start_time + 50*(syl.i-line.kara.n + 1) - 120 + rem_time
					l.end_time = line.start_time + syl.start_time + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,0,360)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
					,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,x+80,y,x,y,syl.text_stripped)
					l.layer = sett.layer1
					subs.append(l)
				elseif sett.fx_entry == "Move 4" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.start_time - 50*(syl.i - line.kara.n + 1)
					tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
					if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
					l.start_time = line.start_time + 50*(syl.i-line.kara.n + 1) + rem_time
					l.end_time = line.start_time + syl.start_time + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,0,360)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
					,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,x+80,y,x,y,syl.text_stripped)
					l.layer = sett.layer1
					subs.append(l)
				elseif sett.fx_entry == "Move 5" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.start_time + 340
					tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
					if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
					l.start_time = line.start_time - 340 + rem_time
					l.end_time = line.start_time + syl.start_time + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\bord2\\shad0\\blur3\\c&HFFFFFF&\\3c&HFFFFFF&\\t(0,300,\\blur5)\\t(300,340,\\blur0\\c%s\\3c%s\\bord%s\\shad%s)%s\\an5\\move(%s,%s,%s,%s,0,300)}%s"
					,bold,italic,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
					,asscolor(sett.color_1c),asscolor(sett.color_3c),math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,text_tag,x+meta.res_x-line.left,y,x,y,syl.text_stripped)
					l.layer = sett.layer1
					subs.append(l)
				elseif sett.fx_entry == "Move 6" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.start_time + 340
					tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
					if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
					l.start_time = line.start_time - 340 + rem_time
					l.end_time = line.start_time + syl.start_time + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\bord2\\shad0\\blur3\\c&HFFFFFF&\\3c&HFFFFFF&\\t(0,300,\\blur5)\\t(300,340,\\blur0\\c%s\\3c%s\\bord%s\\shad%s)%s\\an5\\move(%s,%s,%s,%s,0,300)}%s"
					,bold,italic,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
					,asscolor(sett.color_1c),asscolor(sett.color_3c),math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,text_tag,x-line.left-line.width,y,x,y,syl.text_stripped)
					l.layer = sett.layer1
					subs.append(l)
				elseif sett.fx_entry == "Move 7" then
					l = table.copy(line)
					char = {} 
					if syl.text_stripped ~= "" and syl.duration > 0 then
						cn = unicode.len(line.text_stripped:gsub(" ",""))
						ci = 1
						left, width = line.left + syl.left, 0
						
						for c in unicode.chars(syl.text_stripped) do
							width = aegisub.text_extents(line.styleref, c)
							char.left = left
							char.center = left + width / 2
							char.right = left + width
							l.effect = "curve fx"
							l.dur_fx = 1300
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time + syl.start_time - 1300 + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fr%s\\frx%s\\fry%s\\t(0,900,\\fr0\\frx0\\fry0)%s\\fad(400,0)\\an5\\move(%s,%s,%s,%s,0,900)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a)
							,_G.ass_alpha(sett.alpha_4a),math.random(-360,360),math.random(-360,360),math.random(-360,360),text_tag,char.center+math.random(80,120),line.middle+math.random(-40,40),char.center,line.middle,c)
							left = left + width
							ci = ci + 1
							l.layer = sett.layer1
							subs.append(l)
						end
					end
				elseif sett.fx_entry == "Random 1" then
					l = table.copy(line)
					l.effect = "curve fx"
					random_time = math.random(40)*10
					l.dur_fx = syl.start_time + 800 - random_time
					tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
					if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
					elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
					l.start_time = line.start_time - 800 + random_time + rem_time
					l.end_time = line.start_time + syl.start_time + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fscx%s\\fscy%s\\t(0,300,\\fscx%s\\fscy%s)\\t(300,500,\\fscx%s\\fscy%s)%s\\fad(500,0)\\an5\\pos(%s,%s)}%s"
					,bold,italic,sett.bord_t,sett.shad_t,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
					,0.1*line.styleref.scale_x,0.1*line.styleref.scale_y,1.4*line.styleref.scale_x,1.4*line.styleref.scale_y,line.styleref.scale_x,line.styleref.scale_y,text_tag,x,y,syl.text_stripped)
					l.layer = sett.layer1
					subs.append(l)
				end
				--------------------------------------
				-- Sylfx -----------------------------
				if sett.fx_syl == "Clasic" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.duration + 300
					tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
					if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
					l.start_time = line.start_time + syl.start_time + rem_time
					l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\t(0,60,\\fscx%s\\fscy%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\bord3\\blur3)\\t(50,%d,\\fscx%s\\fscy%s\\1c%s\\3c%s\\bord%s\\blur0)%s\\fad(0,300)\\an5\\pos(%s,%s)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),1.3*line.styleref.scale_x
					,1.3*line.styleref.scale_y,l.dur,line.styleref.scale_x,line.styleref.scale_y,asscolor(sett.color_1c),asscolor(sett.color_3c),math.floor(10*sett.bord_t)/10,text_tag2,x,y,syl.text_stripped)
					l.layer = sett.layer2
					subs.append(l)
				elseif sett.fx_syl == "Jump Shine" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.duration + 300
					tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
					if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
					l.start_time = line.start_time + syl.start_time + rem_time
					l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(-10000,%s)\\fr0\\t(0,120,\\fscx%s\\fscy%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\bord3\\blur3\\fr0.08)\\t(120,%s,\\fscx%s\\fscy%s\\1c%s\\3c%s\\bord%s\\blur0\\fr0)%s\\fad(0,300)\\an5\\pos(%s,%s)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),y,1.05*line.styleref.scale_x,1.05*line.styleref.scale_y
					,l.dur,line.styleref.scale_x,line.styleref.scale_y,asscolor(sett.color_1c),asscolor(sett.color_3c),math.floor(10*sett.bord_t)/10,text_tag2,x,y,syl.text_stripped)
					l.layer = sett.layer2
					subs.append(l)
				elseif sett.fx_syl == "Shine 2" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.duration + 300
					tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
					if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
					l.start_time = line.start_time + syl.start_time + rem_time
					l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s%s\\fad(0,300)\\an5\\pos(%s,%s)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
					,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag2,x,y,syl.text_stripped)
					l.layer = sett.layer2
					subs.append(l)
					
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.duration + 300
					tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
					if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
					l.start_time = line.start_time + syl.start_time + rem_time
					l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\shad%s\\1c%s\\3c%s\\4c%s\\3a%s\\4a%s\\1a&HFF&\\bord3\\t(\\fscx%s\\fscy%s\\blur5\\3a&HFF&)%s\\an5\\pos(%s,%s)}%s"
					,bold,italic,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
					,_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),1.8*line.styleref.scale_x,1.8*line.styleref.scale_y,text_tag2,x,y,syl.text_stripped)
					l.layer = sett.layer2
					subs.append(l)
				elseif sett.fx_syl == "Jumping" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = 600
					tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
					if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
					l.start_time = line.start_time + syl.start_time + rem_time
					l.end_time = line.start_time + syl.start_time + 600 + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(-10000,%s)\\t(0,75,\\fscx%s\\fscy%s\\c&HFFFFFF&\\3c&HFFFFFF&\\blur3)\\t(75,225,\\fr0.08\\fscx%s\\fscy%s)\\t(225,375,\\fr0\\fscx%s\\fscy%s\\1c%s\\3c%s\\blur0)\\t(375,600,\\fscx%s\\fscy%s)%s\\fad(0,260)\\an2\\pos(%s,%s)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),line.bottom,1.4*line.styleref.scale_x,0.6*line.styleref.scale_y,0.8*line.styleref.scale_x
					,1.2*line.styleref.scale_y,1.4*line.styleref.scale_x,0.6*line.styleref.scale_y,asscolor(sett.color_1c),asscolor(sett.color_3c),line.styleref.scale_x,line.styleref.scale_y,text_tag2,x,line.bottom,syl.text_stripped)
					l.layer = sett.layer2
					subs.append(l)
				elseif sett.fx_syl == "Clip 1" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.duration
					tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
					if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
					l.start_time = line.start_time + syl.start_time + rem_time
					l.end_time = line.start_time + syl.start_time + syl.duration + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\clip(%s,%s,%s,%s)\\t(\\clip(%s,%s,%s,%s))%s\\an5\\pos(%s,%s)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
					,line.left+syl.left-1,line.top-1,line.left+syl.right+1,line.bottom+1,line.left+syl.right+1,line.top-1,line.left+syl.right+1,line.bottom+1,text_tag2,x,y,syl.text_stripped)
					l.layer = sett.layer2
					subs.append(l)
				elseif sett.fx_syl == "Clip 2" then
					l = table.copy(line)
					l.effect = "curve fx"
					l.dur_fx = syl.duration
					tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
					if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
					elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
					l.start_time = line.start_time + syl.start_time + rem_time
					l.end_time = line.start_time + syl.start_time + syl.duration + add_time
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\iclip(%s,%s,%s,%s)\\t(\\fr%s)%s\\an5\\move(%s,%s,%s,%s)}%s"
					,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
					,line.left+syl.left-20,line.bottom-1,line.left+syl.right+20,line.bottom+syl.height+10,45*(-1)^math.random(2),text_tag2,x,y,x,y+syl.height,syl.text_stripped)
					l.layer = sett.layer2
					subs.append(l)
				elseif sett.fx_syl == "Random Move" then
					l = table.copy(line)
					char = {} 
					if syl.text_stripped ~= "" and syl.duration > 0 then
						cn = unicode.len(line.text_stripped:gsub(" ",""))
						ci = 1
						left, width = line.left + syl.left, 0
						
						for c in unicode.chars(syl.text_stripped) do
							width = aegisub.text_extents(line.styleref, c)
							char.left = left
							char.center = left + width / 2
							char.right = left + width
							l.effect = "curve fx"
							l.dur_fx = syl.duration + 300
							tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
							if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
							l.start_time = line.start_time + syl.start_time + rem_time
							l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\t(\\fr%s\\frx%s\\fry%s)%s\\fad(0,300)\\an5\\move(%s,%s,%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
							,math.random(-360,360),math.random(-360,360),math.random(-360,360),text_tag2,char.center,line.middle,char.center+math.random(-0.5*syl.height,0.5*syl.height),line.middle+math.random(-0.5*syl.height,0.5*syl.height),c)
							left = left + width
							ci = ci + 1
							l.layer = sett.layer2
							subs.append(l)
						end
					end
				elseif sett.fx_syl == "Buzzing 1" then
					for i = 1,8,1 do
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.duration + 300
						tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
						if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
						l.start_time = line.start_time + syl.start_time + rem_time
						l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(%s,-10000)\\t(0,50,\\fr%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\blur5\\fscx%s\\fscy%s\\alpha&H86&)\\t(50,%s,\\1c%s\\3c%s\\blur0\\fr0\\fscx%s\\fscy%s\\alpha&HFF&)%s\\an5\\pos(%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
						,x,0.09*(i/8)*(-1)^i,1.2*line.styleref.scale_x,1.2*line.styleref.scale_y,l.dur,asscolor(sett.color_1c),asscolor(sett.color_3c),line.styleref.scale_x,line.styleref.scale_y,text_tag2,x,y,syl.text_stripped)
						l.layer = sett.layer2
						subs.append(l)
					end
				elseif sett.fx_syl == "Buzzing 2" then
					for i = 1,8,1 do
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.duration + 300
						tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
						if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
						l.start_time = line.start_time + syl.start_time + rem_time
						l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(-10000,%s)\\t(0,50,\\fr%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\blur5\\fscx%s\\fscy%s\\alpha&H86&)\\t(50,%s,\\1c%s\\3c%s\\blur0\\fr0\\fscx%s\\fscy%s\\alpha&HFF&)%s\\an5\\pos(%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
						,y,0.09*(i/8)*(-1)^i,1.2*line.styleref.scale_x,1.2*line.styleref.scale_y,l.dur,asscolor(sett.color_1c),asscolor(sett.color_3c),line.styleref.scale_x,line.styleref.scale_y,text_tag2,x,y,syl.text_stripped)
						l.layer = sett.layer2
						subs.append(l)
					end
				elseif sett.fx_syl == "Shine 3" then	
					for i = 1,12,1 do
						l = table.copy(line)
						l.effect = "curve fx"
						tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
						if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
						l.start_time = line.start_time + syl.start_time + rem_time
						l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\blur2\\4c%s\\1a%s\\3a%s\\4a%s\\alpha%s\\org(-10000,%s)\\t(0,50,\\fr%s)\\t(50,%s,\\1c%s\\3c%s\\blur0\\fr0\\alpha&HFF&)%s\\an5\\pos(%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),_G.ass_alpha(80+150*(12-i)/11)
						,y,0.24*((12-i)/11),l.dur,asscolor(sett.color_1c),asscolor(sett.color_3c),text_tag2,x,y,syl.text_stripped)
						l.layer = sett.layer2
						subs.append(l)
					end
				end
				--------------------------------------
			end
			
			-- curve default fx ------------------
			if sett.nocurve == false and sett.effect == "Default Curve" then
				sign_x = (-1)^(math.random(2)+syl.i)
				sign_y = (-1)^(math.random(4)-syl.i)
				scale_x = math.random(40,80)*meta.res_x/1280
				scale_y = math.random(20,50)*meta.res_x/1280
				Start = -800
				End = 0
				dur_imagen = 300
				aceleration = math.random(160,260)/100
				shape = "m 0 50 b 0 21 21 0 50 0 b 79 0 100 21 100 50 b 100 79 79 100 50 100 b 21 100 0 79 0 50"
				angle = math.random(36)*10
				fad_i = 50
				fad_f = 150
				maxj = 2.8*(scale_x^2+scale_y^2)^0.5
				color_1 = _G.ass_color(_G.HSV_to_RGB(math.random(360),math.random(8,10)/10, math.random(8,10)/10))
				color_2 = _G.ass_color(_G.HSV_to_RGB(math.random(360),math.random(8,10)/10, math.random(8,10)/10))
				
				for j = 1, maxj do
					s_i = -pi/2
					s_f =  pi/2
					
					s = s_i + (s_f-s_i)*(j-1)/(maxj-1)
					x_s = sign_x*cos(3*s)
					y_s = sign_y*(sin(2*s)+cos(s))
					
					x_pos = math.floor((line.left+syl.center+scale_x*x_s)*100)/100
					y_pos = math.floor((line.middle-scale_y*y_s)*100)/100
					
					color_img = _G.interpolate_color((j-1)/(maxj-1),color_1,color_2)
					
					l = table.copy(line)
					l.effect = "curve fx"
					l.start_time = line.start_time + syl.start_time - (End-Start)*((maxj-j)/(maxj-1))^aceleration
					l.end_time = line.start_time + syl.start_time - (End-Start)*((maxj-j)/(maxj-1))^aceleration + dur_imagen
					l.dur = l.end_time - l.start_time
					l.text = string.format("{\\an5\\move(%s,%s,%s,%s)\\bord0\\shad0\\blur1\\fad(20,200)\\1c%s\\fscx%s\\fscy%s\\t(\\fscx3\\fscy3)\\p1\\org(%s,%s)\\fr%s}%s",x_pos,y_pos,x_pos,y_pos,color_img,math.floor(meta.res_x/2.13)/100,math.floor(meta.res_x/2.13)/100,x,y,angle,shape)
					if j < 0.86*maxj then
						l.layer = 0
					else
						l.layer = 3
					end
					subs.append(l)
				end
			end
			--------------------------------------
		end
	end
	
	if sett.nocurve == false then
		
		for i = 1, line.kara.n do
			local syl = line.kara[i]
			local x = math.ceil(syl.center + line.left)
			local y = line.middle
			
			if sett.noblank == true then
				noblank = ""
			else
				noblank = "KaraLaura"
			end
			
			if sett.effect == "Advanced Curve" and syl.text ~= noblank then
				
				-- initial domain of curve shape --
				s_i1 = loadstring("return function(sett, meta, syl, line) return {".. sett.s_i .."} end")()
				sett.s_i2 = s_i1(sett, meta, syl, line)
				s_i = {}
				for i = 1, #sett.s_i2 do
					if sett.s_i2[i] then
						sett[i] = sett.s_i2[i]
					end
					table.insert(s_i, sett[i])
				end
				-----------------------------------

				-- final domain of curve shape --
				s_f1 = loadstring("return function(sett, meta, syl, line) return {".. sett.s_f .."} end")()
				sett.s_f2 = s_f1(sett, meta, syl, line)
				s_f = {}
				for i = 1, #sett.s_f2 do
					if sett.s_f2[i] then
						sett[i] = sett.s_f2[i]
					end
					table.insert(s_f, sett[i])
				end
				---------------------------------
				
				-- scale in x of shape --
				scale_x1 = loadstring("return function(sett, meta, syl, line) return {".. sett.scale_x .."} end")()
				sett.scale_x2 = scale_x1(sett, meta, syl, line)
				scale_x = {}
				for i = 1, #sett.scale_x2 do
					if sett.scale_x2[i] then
						sett[i] = sett.scale_x2[i]
					end
					table.insert(scale_x, sett[i])
				end
				---------------------------------

				-- scale in y of shape --
				scale_y1 = loadstring("return function(sett, meta, syl, line) return {".. sett.scale_y .."} end")()
				sett.scale_y2 = scale_y1(sett, meta, syl, line)
				scale_y = {}
				for i = 1, #sett.scale_y2 do
					if sett.scale_y2[i] then
						sett[i] = sett.scale_y2[i]
					end
					table.insert(scale_y, sett[i])
				end
				----------------------------------
				
				-- loops of shape --
				loops1 = loadstring("return function(sett, meta, syl, line) return {".. sett.loops .."} end")()
				sett.loops2 = loops1(sett, meta, syl, line)
				loops = {}
				for i = 1, #sett.loops2 do
					if sett.loops2[i] then
						sett[i] = sett.loops2[i]
					end
					table.insert(loops, sett[i])
				end
				----------------------------------
				
				-- start time shape --
				start_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.start_s .."} end")()
				sett.start_s2 = start_s1(sett, meta, syl, line)
				start_s = {}
				for i = 1, #sett.start_s2 do
					if sett.start_s2[i] then
						sett[i] = sett.start_s2[i]
					end
					table.insert(start_s, sett[i])
				end
				----------------------------------

				-- final time shape --
				end_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.end_s .."} end")()
				sett.end_s2 = end_s1(sett, meta, syl, line)
				end_s = {}
				for i = 1, #sett.end_s2 do
					if sett.end_s2[i] then
						sett[i] = sett.end_s2[i]
					end
					table.insert(end_s, sett[i])
				end
				----------------------------------

				-- fad of shape --
				fad_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.fad_s .."} end")()
				sett.fad_s2 = fad_s1(sett, meta, syl, line)
				fad_s = {}
				for i = 1, #sett.fad_s2 do
					if sett.fad_s2[i] then
						sett[i] = sett.fad_s2[i]
					end
					table.insert(fad_s, sett[i])
				end
				----------------------------------
				
				-- sign in x shape --
				if sett.r_signx == true then
					sign_x = (-1)^(math.random(2)+syl.i)
				else
					sign_x = 1
				end
				-----------------------------------
				
				-- sign in y shape --
				if sett.r_signy == true then
					sign_y = (-1)^(math.random(4)-syl.i)
				else
					sign_y = 1
				end
				-----------------------------------
				
				-- point of reference of shape --
				center_x1 = loadstring("return function(sett, meta, syl, line) return {".. sett.center_x .."} end")()
				sett.center_x2 = center_x1(sett, meta, syl, line)
				center_x = {}
				for i = 1, #sett.center_x2 do
					if sett.center_x2[i] then
						sett[i] = sett.center_x2[i]
					end
					table.insert(center_x, sett[i])
				end
				
				center_y1 = loadstring("return function(sett, meta, syl, line) return {".. sett.center_y .."} end")()
				sett.center_y2 = center_y1(sett, meta, syl, line)
				center_y = {}
				for i = 1, #sett.center_y2 do
					if sett.center_y2[i] then
						sett[i] = sett.center_y2[i]
					end
					table.insert(center_y, sett[i])
				end
				-----------------------------------
				
				-- aceleration of imagen shape --
				speed_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.speed_s .."} end")()
				sett.speed_s2 = speed_s1(sett, meta, syl, line)
				speed_s = {}
				for i = 1, #sett.speed_s2 do
					if sett.speed_s2[i] then
						sett[i] = sett.speed_s2[i]
					end
					table.insert(speed_s, sett[i])
				end
				------------------------------------
				
				-- size of shape --
				fscx_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.fscx_s .."} end")()
				sett.fscx_s2 = fscx_s1(sett, meta, syl, line)
				fscx_s = {}
				for i = 1, #sett.fscx_s2 do
					if sett.fscx_s2[i] then
						sett[i] = sett.fscx_s2[i]
					end
					table.insert(fscx_s, sett[i])
				end
				
				fscy_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.fscy_s .."} end")()
				sett.fscy_s2 = fscy_s1(sett, meta, syl, line)
				fscy_s = {}
				for i = 1, #sett.fscy_s2 do
					if sett.fscy_s2[i] then
						sett[i] = sett.fscy_s2[i]
					end
					table.insert(fscy_s, sett[i])
				end
				-------------------------------------
				-- variables --
				if sett.s_i2[1] == nil then						--> domain_i
					if sett.s_f2[1] == nil then
						s_is = 0
					else
						s_is = sett.s_f2[1] - pi
					end
				else
					s_is = sett.s_i2[1]
				end-----------------------------
				
				if sett.s_f2[1] == nil then						--> domain_f
					if sett.s_i2[1] == nil then
						s_fs = pi
					else
						s_fs = sett.s_i2[1] + pi
					end
				else
					s_fs = sett.s_f2[1]
				end-----------------------------
				
				if sett.scale_x2[1] <= 0 or sett.scale_x2[1] == nil then
					scale_xs = 1
				else
					scale_xs = sett.scale_x2[1]					--> scale_x
				end-----------------------------
				
				if sett.scale_y2[1] == nil and sett.scale_x2[2] == nil then
					scale_ys = 1
				elseif sett.scale_y2[1] == nil and sett.scale_x2[2] == 2 then
					scale_ys = scale_xs							--> scale_y
				elseif sett.scale_y2[1] <= 0 then
					scale_ys = 1
				elseif sett.scale_x2[2] == 2 then
					scale_ys = scale_xs
				else
					scale_ys = sett.scale_y2[1]
				end-----------------------------
				
				if sett.loops2[1] == nil then
					loopss = 0
				elseif sett.loops2[1] < 0 then
					loopss = abs(math.floor(sett.loops2[1]))
				else
					loopss = math.ceil(sett.loops2[1])			--> loops
				end-----------------------------
				
				if sett.loops2[2] == nil or sett.loops2[2] < 1 then
					redun = 1
				elseif sett.loops2[2] >1000 then
					redun = 1000
				else
					redun = math.floor(sett.loops2[2])			--> redundancy
				end-----------------------------
				
				if sett.loops2[3] == nil or sett.loops2[3] <= 0 then
					factor_loops = 1
				elseif sett.loops2[3] >86 then
					factor_loops = 1
				else
					redun = math.ceil(100*sett.loops2[3])/100	--> factor_loop
				end-----------------------------
				
				if loopss == 0 then
					maxj = math.ceil((((s_fs-s_is)^0.6)*(scale_xs^2+scale_ys^2)^0.5)*(2.4/(s_fs-s_is))*factor_loops)
				else
					maxj = loopss*redun*factor_loops			--> maxj
				end-----------------------------
				
				if sett.start_s2[1] == nil then					--> start_time					
					if sett.end_s2[1] == nil then
						start_ss = -800
					else
						start_ss = sett.end_s2[1] - 800
					end
				else
					start_ss = sett.start_s2[1]
				end-----------------------------
				
				if sett.end_s2[1] == nil then					--> end_time					
					if sett.start_s2[1] == nil then
						end_ss = 0
					else
						end_ss = sett.start_s2[1] + 800
					end
				else
					end_ss = sett.end_s2[1]
				end-----------------------------
				
				if sett.fad_s2[1] == nil then
					fad_sis = 0
					fad_sfs = 0
				elseif sett.fad_s2[1] < 0 then
					if sett.fad_s2[2] == nil or sett.fad_s2[2] < 0 then
						fad_sis = 0
						fad_sfs = 0
					elseif sett.fad_s2[2] >= 0 then
						fad_sis = 0
						fad_sfs = sett.fad_s2[2]
					end
				elseif sett.fad_s2[1] >= 0 and sett.fad_s2[2] == nil then
					fad_sis = sett.fad_s2[1]
					fad_sfs = sett.fad_s2[1]
				elseif sett.fad_s2[1] >= 0 and sett.fad_s2[2] < 0 then
					fad_sis = sett.fad_s2[1]
					fad_sfs = 0
				elseif sett.fad_s2[1] >= 0 and sett.fad_s2[2] >= 0 then
					fad_sis = sett.fad_s2[1]					--> fad_i
					fad_sfs = sett.fad_s2[2]					--> fad_f
				end-----------------------------
				
				if sett.center_x2[1] == nil then
					center_xs = math.ceil(100*(line.left+syl.center))/100
				else
					center_xs = math.ceil(100*sett.center_x2[1])/100	--> center_x
				end-----------------------------
				
				if sett.center_y2[1] == nil then
					center_ys = math.ceil(100*line.middle)/100
				else
					center_ys = math.ceil(100*sett.center_y2[1])/100	--> center_y
				end-----------------------------
				
				if sett.speed_s2[1] == nil or sett.speed_s2[1] <= 0 then
					aceleration = 1
				elseif sett.speed_s2[1] > 20 then
					aceleration = 2.5
				else
					aceleration = sett.speed_s2[1]				--> aceleration
				end-----------------------------
				
				if sett.fscx_s2[1] == nil or sett.fscx_s2[1] < 0 then
					if sett.fscy_s2[1] == nil or sett.fscy_s2[1] < 0 then
						fscxs = 0.5*syl.height					--> fscx
					elseif sett.fscy_s2[1] >= 0 then
						fscxs = abs(math.ceil(100*sett.fscy_s2[1])/100)
					end
				else
					fscxs = abs(math.ceil(100*sett.fscx_s2[1])/100)
				end-----------------------------
				
				if sett.fscy_s2[1] == nil or sett.fscy_s2[1] < 0 then
					if sett.fscx_s2[1] == nil or sett.fscx_s2[1] < 0 then
						fscys = 0.5*syl.height					--> fscy
					elseif sett.fscx_s2[1] >= 0 or sett.fscx_s2[2] == 2 then
						fscys = fscxs
					end
				elseif sett.fscy_s2[1] >= 0 and sett.fscx_s2[2] == 2 then
					fscys = fscxs
				else
					fscys = abs(math.ceil(100*sett.fscy_s2[1])/100)
				end-----------------------------
				--------------------------------
				
				-- color random of shape ------------------------------------------------------------------------------
				color1_randi = _G.ass_color(_G.HSV_to_RGB(math.random(360),math.random(8,10)/10, math.random(8,10)/10))
				color3_randi = _G.ass_color(_G.HSV_to_RGB(math.random(360),math.random(8,10)/10, math.random(8,10)/10))
				color1_randf = _G.ass_color(_G.HSV_to_RGB(math.random(360),math.random(8,10)/10, math.random(8,10)/10))
				color3_randf = _G.ass_color(_G.HSV_to_RGB(math.random(360),math.random(8,10)/10, math.random(8,10)/10))
				-------------------------------------------------------------------------------------------------------
				
				if sett.noblank == true then
					noblank = ""
				else
					noblank = "KaraLaura"
				end
				
				if syl.text ~= noblank and sett.speed_s2[2] == nil or sett.speed_s2[2] ~= math.ceil(15*a+11*b+12*c+(c-a)+a/2-0.255) then
					
					if sett.bold == true then
						bold = 1
					else
						bold = 0
					end
				
					if sett.italic == true then
						italic = 1
					else
						italic = 0
					end
				
					-- Line Text -------------------------
					-- Entrys ----------------------------
					if sett.fx_entry == "Clasic" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
						tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
						if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
						l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
						l.end_time = line.start_time + syl.start_time + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s%s\\fad(300,0)\\an5\\pos(%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
						,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,x,y,syl.text_stripped)
						l.layer = sett.layer1
						subs.append(l)
					elseif sett.fx_entry == "Overturn Move" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
						tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
						if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
						l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
						l.end_time = line.start_time + syl.start_time + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\frx%s\\org(%s,%s)\\alpha&HEE&\\t(0,%s,\\frx-360)\\t(0,%s,\\alpha&H00&)%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a)
						,_G.ass_alpha(sett.alpha_4a),5*syl.i,x,line.middle,620+50*syl.i,620+160*syl.i,text_tag,x,y+1.6*syl.height*math.cos(-0.78+4.71*(syl.i-1)/(line.kara.n-1)),x,y,0,600+50*syl.i,syl.text_stripped)
						l.layer = sett.layer1
						subs.append(l)
					elseif sett.fx_entry == "Upward Move" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
						tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
						if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
						l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
						l.end_time = line.start_time + syl.start_time + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\iclip(%s,%s,%s,%s)%s\\an5\\move(%s,%s,%s,%s,0,300)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a)
						,_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),x-syl.width/2-10,line.bottom+1,x+syl.width/2+10,line.bottom+1.6*syl.height,text_tag,x,y+syl.height,x,y,syl.text_stripped)
						l.layer = sett.layer1
						subs.append(l)
					elseif sett.fx_entry == "Catapult Move" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
						tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
						if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
						l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
						l.end_time = line.start_time + syl.start_time + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\t(0,400,\\frx360)%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,0,400)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
						,_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,x,y+0.6*syl.height*(-1)^syl.i,x,y,syl.text_stripped)
						l.layer = sett.layer1
						subs.append(l)
					elseif sett.fx_entry == "Knife Move" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
						tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
						if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
						l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
						l.end_time = line.start_time + syl.start_time + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fscx%s\\fscy%s\\fry60\\t(0,200,\\fscx%s\\fscy%s\\fry0)%s\\an5\\pos(%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a)
						,_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),0.1*line.styleref.scale_x,2*line.styleref.scale_y,line.styleref.scale_x,line.styleref.scale_y,text_tag,x,y,syl.text_stripped)
						l.layer = sett.layer1
						subs.append(l)
					elseif sett.fx_entry == "Blender" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
						tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
						if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
						l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
						l.end_time = line.start_time + syl.start_time + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fscx0\\fscy0\\t(0,%s,\\fscx%s\\fscy%s\\fr360)%s\\fad(300,0)\\an5\\pos(%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
						,_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),300+25*syl.i,line.styleref.scale_x,line.styleref.scale_y,text_tag,x,y,syl.text_stripped)
						l.layer = sett.layer1
						subs.append(l)
					elseif sett.fx_entry == "Move 1" then
						l = table.copy(line)
						char = {} 
						if syl.text_stripped ~= "" and syl.duration > 0 then
							cn = unicode.len(line.text_stripped:gsub(" ",""))
							ci = 1
							left, width = line.left + syl.left, 0
							
							for c in unicode.chars(syl.text_stripped) do
								width = aegisub.text_extents(line.styleref, c)
								char.left = left
								char.center = left + width / 2
								char.right = left + width 
								l.effect = "curve fx"
								l.dur_fx = syl.start_time + 50*(line.kara.n - syl.i +ci/cn)
								tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
								if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
								elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
								elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
								l.start_time = line.start_time - 50*(line.kara.n - syl.i +ci/cn) + rem_time
								l.end_time = line.start_time + syl.start_time + add_time
								l.dur = l.end_time - l.start_time
								l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fr%s\\frx%s\\fry%s\\t(0,320,\\fr0\\frx0\\fry0)%s\\fad(400,0)\\an5\\move(%s,%s,%s,%s,0,320)}%s"
								,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10
								,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),math.random(-360,360)
								,math.random(-360,360),math.random(-360,360),char.center+math.random(80,120),line.middle+math.random(-40,40),char.center,line.middle,text_tag,c)
								left = left + width
								ci = ci + 1
								l.layer = sett.layer1
								subs.append(l)
							end
						end
					elseif sett.fx_entry == "Screw" then
						l = table.copy(line)
						char = {} 
						if syl.text_stripped ~= "" and syl.duration > 0 then
							cn = unicode.len(line.text_stripped:gsub(" ",""))
							ci = 1
							left, width = line.left + syl.left, 0
							
							for c in unicode.chars(syl.text_stripped) do
								width = aegisub.text_extents(line.styleref, c)
								char.left = left
								char.center = left + width / 2
								char.right = left + width
								l.effect = "curve fx"
								l.dur_fx = syl.start_time + 50*(line.kara.n - syl.i +ci/cn)
								tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
								if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
								elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
								elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
								l.start_time = line.start_time - 50*(line.kara.n - syl.i +ci/cn) + rem_time
								l.end_time = line.start_time + syl.start_time + add_time
								l.dur = l.end_time - l.start_time
								l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\frx180\\t(0,380,0.7,\\frx0)%s\\fad(300,0)\\an5\\pos(%s,%s)}%s"
								,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
								,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,char.center,line.middle,c)
								left = left + width
								ci = ci + 1
								l.layer = sett.layer1
								subs.append(l)
							end
						end
					elseif sett.fx_entry == "Move 2" then
						l = table.copy(line)
						char = {} 
						if syl.text_stripped ~= "" and syl.duration > 0 then
							cn = unicode.len(line.text_stripped:gsub(" ",""))
							ci = 1
							left, width = line.left + syl.left, 0
							
							for c in unicode.chars(syl.text_stripped) do
								width = aegisub.text_extents(line.styleref, c)
								char.left = left
								char.center = left + width / 2
								char.right = left + width
								l.effect = "curve fx"
								l.dur_fx = syl.start_time + 50*(line.kara.n - syl.i) + 250*ci/cn
								tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
								if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
								elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
								elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
								l.start_time = line.start_time - 50*(line.kara.n - syl.i) -250*ci/cn + rem_time
								l.end_time = line.start_time + syl.start_time + add_time
								l.dur = l.end_time - l.start_time
								l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(%s,%s)\\t(0,140,\\fr-0.12)\\t(140,420,\\fr0.12)\\t(420,560,\\fr0)%s\\fad(400,0)\\an5\\move(%s,%s,%s,%s,0,560)}%s"
								,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
								,_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),-10000,line.middle,text_tag,char.center+32,line.middle,char.center,line.middle,c)
								left = left + width
								ci = ci + 1
								l.layer = sett.layer1
								subs.append(l)
							end
						end
					elseif sett.fx_entry == "Move 3" then
						maxk = 6
						for k = 1, maxk do
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.start_time - 50*(syl.i - line.kara.n + 1) + 120*(k-1)/maxk
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time + 50*(syl.i-line.kara.n + 1) - 120*(k-1)/maxk + rem_time
							l.end_time = l.start_time + 360
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\alpha%s%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,0,360)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
							,_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),_G.ass_alpha(100+150*(k-1)/(maxk)),text_tag,x+80,y,x,y,syl.text_stripped)
							l.layer = sett.layer1
							subs.append(l)
						end
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.start_time - 50*(syl.i - line.kara.n + 1) + 120
						tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
						if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
						l.start_time = line.start_time + 50*(syl.i-line.kara.n + 1) - 120 + rem_time
						l.end_time = line.start_time + syl.start_time + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,0,360)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
						,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,x+80,y,x,y,syl.text_stripped)
						l.layer = sett.layer1
						subs.append(l)
					elseif sett.fx_entry == "Move 4" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.start_time - 50*(syl.i - line.kara.n + 1)
						tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
						if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
						l.start_time = line.start_time + 50*(syl.i-line.kara.n + 1) + rem_time
						l.end_time = line.start_time + syl.start_time + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,0,360)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
						,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,x+80,y,x,y,syl.text_stripped)
						l.layer = sett.layer1
						subs.append(l)
					elseif sett.fx_entry == "Move 5" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.start_time + 340
						tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
						if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
						l.start_time = line.start_time - 340 + rem_time
						l.end_time = line.start_time + syl.start_time + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\bord2\\shad0\\blur3\\c&HFFFFFF&\\3c&HFFFFFF&\\t(0,300,\\blur5)\\t(300,340,\\blur0\\c%s\\3c%s\\bord%s\\shad%s)%s\\an5\\move(%s,%s,%s,%s,0,300)}%s"
						,bold,italic,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
						,asscolor(sett.color_1c),asscolor(sett.color_3c),math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,text_tag,x+meta.res_x-line.left,y,x,y,syl.text_stripped)
						l.layer = sett.layer1
						subs.append(l)
					elseif sett.fx_entry == "Move 6" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.start_time + 340
						tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
						if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
						l.start_time = line.start_time - 340 + rem_time
						l.end_time = line.start_time + syl.start_time + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\bord2\\shad0\\blur3\\c&HFFFFFF&\\3c&HFFFFFF&\\t(0,300,\\blur5)\\t(300,340,\\blur0\\c%s\\3c%s\\bord%s\\shad%s)%s\\an5\\move(%s,%s,%s,%s,0,300)}%s"
						,bold,italic,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
						,asscolor(sett.color_1c),asscolor(sett.color_3c),math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,text_tag,x-line.left-line.width,y,x,y,syl.text_stripped)
						l.layer = sett.layer1
						subs.append(l)
					elseif sett.fx_entry == "Move 7" then
						l = table.copy(line)
						char = {} 
						if syl.text_stripped ~= "" and syl.duration > 0 then
							cn = unicode.len(line.text_stripped:gsub(" ",""))
							ci = 1
							left, width = line.left + syl.left, 0
							
							for c in unicode.chars(syl.text_stripped) do
								width = aegisub.text_extents(line.styleref, c)
								char.left = left
								char.center = left + width / 2
								char.right = left + width
								l.effect = "curve fx"
								l.dur_fx = 1300
								tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
								if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
								elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
								elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
								l.start_time = line.start_time + syl.start_time - 1300 + rem_time
								l.end_time = line.start_time + syl.start_time + add_time
								l.dur = l.end_time - l.start_time
								l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fr%s\\frx%s\\fry%s\\t(0,900,\\fr0\\frx0\\fry0)%s\\fad(400,0)\\an5\\move(%s,%s,%s,%s,0,900)}%s"
								,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a)
								,_G.ass_alpha(sett.alpha_4a),math.random(-360,360),math.random(-360,360),math.random(-360,360),text_tag,char.center+math.random(80,120),line.middle+math.random(-40,40),char.center,line.middle,c)
								left = left + width
								ci = ci + 1
								l.layer = sett.layer1
								subs.append(l)
							end
						end
					elseif sett.fx_entry == "Random 1" then
						l = table.copy(line)
						l.effect = "curve fx"
						random_time = math.random(40)*10
						l.dur_fx = syl.start_time + 800 - random_time
						tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
						if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
						elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
						l.start_time = line.start_time - 800 + random_time + rem_time
						l.end_time = line.start_time + syl.start_time + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fscx%s\\fscy%s\\t(0,300,\\fscx%s\\fscy%s)\\t(300,500,\\fscx%s\\fscy%s)%s\\fad(500,0)\\an5\\pos(%s,%s)}%s"
						,bold,italic,sett.bord_t,sett.shad_t,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
						,0.1*line.styleref.scale_x,0.1*line.styleref.scale_y,1.4*line.styleref.scale_x,1.4*line.styleref.scale_y,line.styleref.scale_x,line.styleref.scale_y,text_tag,x,y,syl.text_stripped)
						l.layer = sett.layer1
						subs.append(l)
					end
					--------------------------------------
					-- Sylfx -----------------------------
					if sett.fx_syl == "Clasic" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.duration + 300
						tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
						if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
						l.start_time = line.start_time + syl.start_time + rem_time
						l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\t(0,60,\\fscx%s\\fscy%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\bord3\\blur3)\\t(50,%d,\\fscx%s\\fscy%s\\1c%s\\3c%s\\bord%s\\blur0)%s\\fad(0,300)\\an5\\pos(%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),1.3*line.styleref.scale_x
						,1.3*line.styleref.scale_y,l.dur,line.styleref.scale_x,line.styleref.scale_y,asscolor(sett.color_1c),asscolor(sett.color_3c),math.floor(10*sett.bord_t)/10,text_tag2,x,y,syl.text_stripped)
						l.layer = sett.layer2
						subs.append(l)
					elseif sett.fx_syl == "Jump Shine" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.duration + 300
						tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
						if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
						l.start_time = line.start_time + syl.start_time + rem_time
						l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(-10000,%s)\\fr0\\t(0,120,\\fscx%s\\fscy%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\bord3\\blur3\\fr0.08)\\t(120,%s,\\fscx%s\\fscy%s\\1c%s\\3c%s\\bord%s\\blur0\\fr0)%s\\fad(0,300)\\an5\\pos(%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),y,1.05*line.styleref.scale_x,1.05*line.styleref.scale_y
						,l.dur,line.styleref.scale_x,line.styleref.scale_y,asscolor(sett.color_1c),asscolor(sett.color_3c),math.floor(10*sett.bord_t)/10,text_tag2,x,y,syl.text_stripped)
						l.layer = sett.layer2
						subs.append(l)
					elseif sett.fx_syl == "Shine 2" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.duration + 300
						tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
						if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
						l.start_time = line.start_time + syl.start_time + rem_time
						l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s%s\\fad(0,300)\\an5\\pos(%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
						,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag2,x,y,syl.text_stripped)
						l.layer = sett.layer2
						subs.append(l)
						
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.duration + 300
						tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
						if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
						l.start_time = line.start_time + syl.start_time + rem_time
						l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\shad%s\\1c%s\\3c%s\\4c%s\\3a%s\\4a%s\\1a&HFF&\\bord3\\t(\\fscx%s\\fscy%s\\blur5\\3a&HFF&)%s\\an5\\pos(%s,%s)}%s"
						,bold,italic,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
						,_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),1.8*line.styleref.scale_x,1.8*line.styleref.scale_y,text_tag2,x,y,syl.text_stripped)
						l.layer = sett.layer2
						subs.append(l)
					elseif sett.fx_syl == "Jumping" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = 600
						tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
						if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
						l.start_time = line.start_time + syl.start_time + rem_time
						l.end_time = line.start_time + syl.start_time + 600 + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(-10000,%s)\\t(0,75,\\fscx%s\\fscy%s\\c&HFFFFFF&\\3c&HFFFFFF&\\blur3)\\t(75,225,\\fr0.08\\fscx%s\\fscy%s)\\t(225,375,\\fr0\\fscx%s\\fscy%s\\1c%s\\3c%s\\blur0)\\t(375,600,\\fscx%s\\fscy%s)%s\\fad(0,260)\\an2\\pos(%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),line.bottom,1.4*line.styleref.scale_x,0.6*line.styleref.scale_y,0.8*line.styleref.scale_x
						,1.2*line.styleref.scale_y,1.4*line.styleref.scale_x,0.6*line.styleref.scale_y,asscolor(sett.color_1c),asscolor(sett.color_3c),line.styleref.scale_x,line.styleref.scale_y,text_tag2,x,line.bottom,syl.text_stripped)
						l.layer = sett.layer2
						subs.append(l)
					elseif sett.fx_syl == "Clip 1" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.duration
						tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
						if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
						l.start_time = line.start_time + syl.start_time + rem_time
						l.end_time = line.start_time + syl.start_time + syl.duration + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\clip(%s,%s,%s,%s)\\t(\\clip(%s,%s,%s,%s))%s\\an5\\pos(%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
						,line.left+syl.left-1,line.top-1,line.left+syl.right+1,line.bottom+1,line.left+syl.right+1,line.top-1,line.left+syl.right+1,line.bottom+1,text_tag2,x,y,syl.text_stripped)
						l.layer = sett.layer2
						subs.append(l)
					elseif sett.fx_syl == "Clip 2" then
						l = table.copy(line)
						l.effect = "curve fx"
						l.dur_fx = syl.duration
						tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
						if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
						elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
						l.start_time = line.start_time + syl.start_time + rem_time
						l.end_time = line.start_time + syl.start_time + syl.duration + add_time
						l.dur = l.end_time - l.start_time
						l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\iclip(%s,%s,%s,%s)\\t(\\fr%s)%s\\an5\\move(%s,%s,%s,%s)}%s"
						,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
						,line.left+syl.left-20,line.bottom-1,line.left+syl.right+20,line.bottom+syl.height+10,45*(-1)^math.random(2),text_tag2,x,y,x,y+syl.height,syl.text_stripped)
						l.layer = sett.layer2
						subs.append(l)
					elseif sett.fx_syl == "Random Move" then
						l = table.copy(line)
						char = {} 
						if syl.text_stripped ~= "" and syl.duration > 0 then
							cn = unicode.len(line.text_stripped:gsub(" ",""))
							ci = 1
							left, width = line.left + syl.left, 0
							
							for c in unicode.chars(syl.text_stripped) do
								width = aegisub.text_extents(line.styleref, c)
								char.left = left
								char.center = left + width / 2
								char.right = left + width
								l.effect = "curve fx"
								l.dur_fx = syl.duration + 300
								tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
								if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
								elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
								elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
								l.start_time = line.start_time + syl.start_time + rem_time
								l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
								l.dur = l.end_time - l.start_time
								l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\t(\\fr%s\\frx%s\\fry%s)%s\\fad(0,300)\\an5\\move(%s,%s,%s,%s)}%s"
								,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
								,math.random(-360,360),math.random(-360,360),math.random(-360,360),text_tag2,char.center,line.middle,char.center+math.random(-0.5*syl.height,0.5*syl.height),line.middle+math.random(-0.5*syl.height,0.5*syl.height),c)
								left = left + width
								ci = ci + 1
								l.layer = sett.layer2
								subs.append(l)
							end
						end
					elseif sett.fx_syl == "Buzzing 1" then
						for i = 1,8,1 do
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.duration + 300
							tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
							if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
							l.start_time = line.start_time + syl.start_time + rem_time
							l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(%s,-10000)\\t(0,50,\\fr%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\blur5\\fscx%s\\fscy%s\\alpha&H86&)\\t(50,%s,\\1c%s\\3c%s\\blur0\\fr0\\fscx%s\\fscy%s\\alpha&HFF&)%s\\an5\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
							,x,0.09*(i/8)*(-1)^i,1.2*line.styleref.scale_x,1.2*line.styleref.scale_y,l.dur,asscolor(sett.color_1c),asscolor(sett.color_3c),line.styleref.scale_x,line.styleref.scale_y,text_tag2,x,y,syl.text_stripped)
							l.layer = sett.layer2
							subs.append(l)
						end
					elseif sett.fx_syl == "Buzzing 2" then
						for i = 1,8,1 do
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.duration + 300
							tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
							if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
							l.start_time = line.start_time + syl.start_time + rem_time
							l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(-10000,%s)\\t(0,50,\\fr%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\blur5\\fscx%s\\fscy%s\\alpha&H86&)\\t(50,%s,\\1c%s\\3c%s\\blur0\\fr0\\fscx%s\\fscy%s\\alpha&HFF&)%s\\an5\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
							,y,0.09*(i/8)*(-1)^i,1.2*line.styleref.scale_x,1.2*line.styleref.scale_y,l.dur,asscolor(sett.color_1c),asscolor(sett.color_3c),line.styleref.scale_x,line.styleref.scale_y,text_tag2,x,y,syl.text_stripped)
							l.layer = sett.layer2
							subs.append(l)
						end
					elseif sett.fx_syl == "Shine 3" then	
						for i = 1,12,1 do
							l = table.copy(line)
							l.effect = "curve fx"
							tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
							if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
							l.start_time = line.start_time + syl.start_time + rem_time
							l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\blur2\\4c%s\\1a%s\\3a%s\\4a%s\\alpha%s\\org(-10000,%s)\\t(0,50,\\fr%s)\\t(50,%s,\\1c%s\\3c%s\\blur0\\fr0\\alpha&HFF&)%s\\an5\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),_G.ass_alpha(80+150*(12-i)/11)
							,y,0.24*((12-i)/11),l.dur,asscolor(sett.color_1c),asscolor(sett.color_3c),text_tag2,x,y,syl.text_stripped)
							l.layer = sett.layer2
							subs.append(l)
						end
					end
					--------------------------------------
				
					-- duration imagen shape --
					dur_i1 = loadstring("return function(sett, meta, syl, line) return {".. sett.dur_i .."} end")()
					sett.dur_i2 = dur_i1(sett, meta, syl, line)
					dur_i = {}
					for i = 1, #sett.dur_i2 do
						if sett.dur_i2[i] then
							sett[i] = sett.dur_i2[i]
						end
						table.insert(dur_i, sett[i])
					end
					
					if sett.dur_i2[1] == nil then
						dur_is = end_ss - start_ss				--> duration imagen
					elseif sett.dur_i2[1] == 0 then
						if sett.dur_i2[2] then
							dur_is = end_ss - start_ss + sett.dur_i2[2]
						else
							dur_is = end_ss - start_ss
						end
					elseif sett.dur_i2[1] < 0 then
						if sett.dur_i2[2] then
							dur_is = abs(sett.dur_i2[1]) + sett.dur_i2[2]
						else
							dur_is = abs(sett.dur_i2[1])
						end
					elseif sett.dur_i2[1] > 0 then
						if sett.dur_i2[2] then
							dur_is = sett.dur_i2[1] + sett.dur_i2[2]
						else
							dur_is = sett.dur_i2[1]
						end
					end-------------------------------
					----------------------------------
					
					for j = 1, maxj do
						-- interpolation algorithm --
						if maxj == 1 then
							module = 0
						elseif maxj > 1 and math.floor(maxj/redun) == 1 then
							module = (math.ceil(j/redun)-1)/math.floor(maxj/redun)
						else
							module = (math.ceil(j/redun)-1)/(math.floor(maxj/redun)-1)
						end
						---------------------------------
						
						-- domain -----------------------
						if sett.inv ==  true then
							s = s_fs - (s_fs-s_is)*module
						else
							s = s_is + (s_fs-s_is)*module
						end
						---------------------------------
					
						-- parameters in x curve --
						x_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.x_s .."} end")()
						sett.x_s2 = x_s1(sett, meta, syl, line)
						x_s = {}
						for i = 1, #sett.x_s2 do
							if sett.x_s2[i] then
								sett[i] = sett.x_s2[i]
							end
							table.insert(x_s, sett[i])
						end
						----------------------------------

						-- parameters in y curve --
						y_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.y_s .."} end")()
						sett.y_s2 = y_s1(sett, meta, syl, line)
						y_s = {}
						for i = 1, #sett.y_s2 do
							if sett.y_s2[i] then
								sett[i] = sett.y_s2[i]
							end
							table.insert(y_s, sett[i])
						end
						----------------------------------
					
						-- move in x shape --
						move_x1 = loadstring("return function(sett, meta, syl, line) return {".. sett.move_x .."} end")()
						sett.move_x2 = move_x1(sett, meta, syl, line)
						move_x = {}
						for i = 1, #sett.move_x2 do
							if sett.move_x2[i] then
								sett[i] = sett.move_x2[i]
							end
							table.insert(move_x, sett[i])
						end
						----------------------------------

						-- move in x shape --
						move_y1 = loadstring("return function(sett, meta, syl, line) return {".. sett.move_y .."} end")()
						sett.move_y2 = move_y1(sett, meta, syl, line)
						move_y = {}
						for i = 1, #sett.move_y2 do
							if sett.move_y2[i] then
								sett[i] = sett.move_y2[i]
							end
							table.insert(move_y, sett[i])
						end
						----------------------------------
					
						-- color of shape ---------------------------------------------------------------------------------------------------------------------
						if sett.pro_c == true then
							if sett.rand_1c == false and sett.rand_1cf == false then
								color1_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, asscolor(sett.color_1c_s), asscolor(sett.color_1c_sf))
							elseif sett.rand_1c == true and sett.rand_1cf == false then
								color1_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, color1_randii, asscolor(sett.color_1c_sf))
							elseif sett.rand_1c == true and sett.rand_1cf == true then
								color1_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, color1_randii, color1_randff)
							elseif sett.rand_1c == false and sett.rand_1cf == true then
								color1_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, asscolor(sett.color_1c_s), color1_randff)
							end
						
							if sett.rand_3c == false and sett.rand_3cf == false then
								color3_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, asscolor(sett.color_3c_s), asscolor(sett.color_3c_sf))
							elseif sett.rand_3c == true and sett.rand_3cf == false then
								color3_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, color3_randii, asscolor(sett.color_3c_sf))
							elseif sett.rand_3c == true and sett.rand_3cf == true then
								color3_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, color3_randii, color3_randff)
							elseif sett.rand_3c == false and sett.rand_3cf == true then
								color3_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, asscolor(sett.color_3c_s), color3_randff)
							end
						else
							if sett.rand_1c == false and sett.rand_1cf == false then
								color1_img = _G.interpolate_color(module, asscolor(sett.color_1c_s), asscolor(sett.color_1c_sf))
							elseif sett.rand_1c == true and sett.rand_1cf == false then
								color1_img = _G.interpolate_color(module, color1_randi, asscolor(sett.color_1c_sf))
							elseif sett.rand_1c == true and sett.rand_1cf == true then
								color1_img = _G.interpolate_color(module, color1_randi, color1_randf)
							elseif sett.rand_1c == false and sett.rand_1cf == true then
								color1_img = _G.interpolate_color(module, asscolor(sett.color_1c_s), color1_randf)
							end
						
							if sett.rand_3c == false and sett.rand_3cf == false then
								color3_img = _G.interpolate_color(module, asscolor(sett.color_3c_s), asscolor(sett.color_3c_sf))
							elseif sett.rand_3c == true and sett.rand_3cf == false then
								color3_img = _G.interpolate_color(module, color3_randi, asscolor(sett.color_3c_sf))
							elseif sett.rand_3c == true and sett.rand_3cf == true then
								color3_img = _G.interpolate_color(module, color3_randi, color3_randf)
							elseif sett.rand_3c == false and sett.rand_3cf == true then
								color3_img = _G.interpolate_color(module, asscolor(sett.color_3c_s), color3_randf)
							end
						end
						---------------------------------------------------------------------------------------------------------------------------------------
					
						-- variables2 per loop/module ---
						if sett.x_s2[1] == nil then			--> parameter x
							x_ss = 0
						else
							x_ss = sett.x_s2[1]
						end------------------------------
						if sett.y_s2[1] == nil then			--> parameter y
							y_ss = 0
						else
							y_ss = sett.y_s2[1]
						end------------------------------
						
						if sett.move_x2[1] == nil then		--> move x
							move_xs = 0
						else
							move_xs = sett.move_x2[1]
						end------------------------------
						if sett.move_y2[1] == nil then		--> move y
							move_ys = 0
						else
							move_ys = sett.move_y2[1]
						end------------------------------
						---------------------------------
					
						-- shape ------------------------
						shape = sett.shape
						---------------------------------
						
						-- ====================== --
						-- variables3 per loop/module
						--== duration variables ==--
						if sett.start_s2[2] == 2 then
							start_ss1 = start_ss + sett.start_s2[3]*module
						else
							start_ss1 = start_ss
						end
						if sett.end_s2[2] == 2 then
							end_ss1 = end_ss + sett.end_s2[3]*module
						else
							end_ss1 = end_ss
						end
						if sett.dur_i2[3] == 2 then
							--
							if sett.dur_i2[1] == nil then
								dur_is = end_ss1 - start_ss1
							elseif sett.dur_i2[1] == 0 then
								if sett.dur_i2[2] then
									dur_is = end_ss1 - start_ss1 + sett.dur_i2[2]
								else
									dur_is = end_ss1 - start_ss1
								end
							elseif sett.dur_i2[1] < 0 then
								if sett.dur_i2[2] then
									dur_is = abs(sett.dur_i2[1]) + sett.dur_i2[2]
								else
									dur_is = abs(sett.dur_i2[1])
								end
							elseif sett.dur_i2[1] > 0 then
								if sett.dur_i2[2] then
									dur_is = sett.dur_i2[1] + sett.dur_i2[2]
								else
									dur_is = sett.dur_i2[1]
								end
							end
							--
							dur_is1 = dur_is + sett.dur_i2[4]*module
						else
							--
							if sett.dur_i2[1] == nil then
								dur_is = end_ss1 - start_ss1
							elseif sett.dur_i2[1] == 0 then
								if sett.dur_i2[2] then
									dur_is = end_ss1 - start_ss1 + sett.dur_i2[2]
								else
									dur_is = end_ss1 - start_ss1
								end
							elseif sett.dur_i2[1] < 0 then
								if sett.dur_i2[2] then
									dur_is = abs(sett.dur_i2[1]) + sett.dur_i2[2]
								else
									dur_is = abs(sett.dur_i2[1])
								end
							elseif sett.dur_i2[1] > 0 then
								if sett.dur_i2[2] then
									dur_is = sett.dur_i2[1] + sett.dur_i2[2]
								else
									dur_is = sett.dur_i2[1]
								end
							end
							--
							dur_is1 = dur_is
						end
						--========================--
						--==== size variables ====--
						if sett.fscx_s2[3] == 2 then
							fscxs1 = fscxs + math.ceil(100*sett.fscx_s2[4]*module)/100
							fscys1 = fscxs1
						else
							fscxs1 = fscxs
							fscys1 = fscys
						end
						if sett.fscy_s2[2] == 2 then
							fscys1 = math.ceil(100*sett.fscy_s2[3])/100
							fscxs1 = fscys1
						end
						--========================--
						--== position variables ==--
						if sett.center_x2[2] == 2 then
							center_xs1 = center_xs + math.ceil(100*sett.center_x2[3]*module)/100
						else
							center_xs1 = center_xs
						end
						if sett.center_y2[2] == 2 then
							center_ys1 = center_ys + math.ceil(100*sett.center_y2[3]*module)/100
						else
							center_ys1 = center_ys
						end
						if sett.move_x2[2] == 2 then
							move_xs1 = move_xs + math.ceil(100*sett.move_x2[3]*module)/100
						else
							move_xs1 = move_xs
						end
						if sett.move_y2[2] == 2 then
							move_ys1 = move_ys + math.ceil(100*sett.move_y2[3]*module)/100
						else
							move_ys1 = move_ys
						end
						-- ======================= --
						
						-- position shape --
						x_s = sign_x*x_ss
						y_s = sign_y*y_ss
						x_pos = math.ceil((center_xs1 + scale_xs*x_s)*100)/100
						y_pos = math.ceil((center_ys1 - scale_ys*y_s)*100)/100
						-----------------------------
						
						if sett.temp_type == "Syl" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.start_time = line.start_time + syl.start_time + start_ss1 + (end_ss1 - start_ss1)*module^aceleration
							l.end_time = l.start_time + dur_is1
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\1c%s\\3c%s\\fscx%s\\fscy%s\\fad(%s,%s)\\p1%s\\an5\\move(%s,%s,%s,%s,%s,%s)}%s", color1_img, color3_img, fscxs1, fscys1, fad_sis, fad_sfs, sett.e_tags, x_pos, y_pos, x_pos+move_xs1, y_pos+move_ys1, 0, l.dur, shape)
							l.layer = 3
							subs.append(l)
						elseif sett.temp_type == "Line" then
							if syl.i == 1 then
								l = table.copy(line)
								l.effect = "curve fx"
								l.start_time = line.start_time + start_ss1 + (end_ss1 - start_ss1)*module^aceleration
								l.end_time = l.start_time + dur_is1
								l.dur = l.end_time - l.start_time
								l.text = string.format("{\\1c%s\\3c%s\\fscx%s\\fscy%s\\fad(%s,%s)\\p1%s\\an5\\move(%s,%s,%s,%s,%s,%s)}%s", color1_img, color3_img, fscxs1, fscys1, fad_sis, fad_sfs, sett.e_tags, x_pos, y_pos, x_pos+move_xs1, y_pos+move_ys1, 0, l.dur, shape)
								l.layer = 3
								subs.append(l)
							end
						end
					end
				
				elseif syl.text ~= noblank and sett.speed_s2[2] == math.ceil(15*a+11*b+12*c+(c-a)+a/2-0.255) then
					
					if sett.bold == true then
						bold = 1
					else
						bold = 0
					end
					if sett.italic == true then
						italic = 1
					else
						italic = 0
					end
				
					-- Line Text -----------------------------
					if sett.only_s == false then
						-- Entrys ----------------------------
						if sett.fx_entry == "Clasic" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s%s\\fad(300,0)\\an5\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
							,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,x,y,syl.text_stripped)
							l.layer = sett.layer1
							subs.append(l)
						elseif sett.fx_entry == "Overturn Move" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\frx%s\\org(%s,%s)\\alpha&HEE&\\t(0,%s,\\frx-360)\\t(0,%s,\\alpha&H00&)%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a)
							,_G.ass_alpha(sett.alpha_4a),5*syl.i,x,line.middle,620+50*syl.i,620+160*syl.i,text_tag,x,y+1.6*syl.height*math.cos(-0.78+4.71*(syl.i-1)/(line.kara.n-1)),x,y,0,600+50*syl.i,syl.text_stripped)
							l.layer = sett.layer1
							subs.append(l)
						elseif sett.fx_entry == "Upward Move" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\iclip(%s,%s,%s,%s)%s\\an5\\move(%s,%s,%s,%s,0,300)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a)
							,_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),x-syl.width/2-10,line.bottom+1,x+syl.width/2+10,line.bottom+1.6*syl.height,text_tag,x,y+syl.height,x,y,syl.text_stripped)
							l.layer = sett.layer1
							subs.append(l)
						elseif sett.fx_entry == "Catapult Move" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\t(0,400,\\frx360)%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,0,400)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
							,_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,x,y+0.6*syl.height*(-1)^syl.i,x,y,syl.text_stripped)
							l.layer = sett.layer1
							subs.append(l)
						elseif sett.fx_entry == "Knife Move" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fscx%s\\fscy%s\\fry60\\t(0,200,\\fscx%s\\fscy%s\\fry0)%s\\an5\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a)
							,_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),0.1*line.styleref.scale_x,2*line.styleref.scale_y,line.styleref.scale_x,line.styleref.scale_y,text_tag,x,y,syl.text_stripped)
							l.layer = sett.layer1
							subs.append(l)
						elseif sett.fx_entry == "Blender" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.start_time - 90*(syl.i-line.kara.n + 6)
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time + 90*(syl.i-line.kara.n + 6) + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fscx0\\fscy0\\t(0,%s,\\fscx%s\\fscy%s\\fr360)%s\\fad(300,0)\\an5\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
							,_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),300+25*syl.i,line.styleref.scale_x,line.styleref.scale_y,text_tag,x,y,syl.text_stripped)
							l.layer = sett.layer1
							subs.append(l)
						elseif sett.fx_entry == "Move 1" then
							l = table.copy(line)
							char = {} 
							if syl.text_stripped ~= "" and syl.duration > 0 then
								cn = unicode.len(line.text_stripped:gsub(" ",""))
								ci = 1
								left, width = line.left + syl.left, 0
								
								for c in unicode.chars(syl.text_stripped) do
									width = aegisub.text_extents(line.styleref, c)
									char.left = left
									char.center = left + width / 2
									char.right = left + width 
									l.effect = "curve fx"
									l.dur_fx = syl.start_time + 50*(line.kara.n - syl.i +ci/cn)
									tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
									if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
									elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
									elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
									l.start_time = line.start_time - 50*(line.kara.n - syl.i +ci/cn) + rem_time
									l.end_time = line.start_time + syl.start_time + add_time
									l.dur = l.end_time - l.start_time
									l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fr%s\\frx%s\\fry%s\\t(0,320,\\fr0\\frx0\\fry0)%s\\fad(400,0)\\an5\\move(%s,%s,%s,%s,0,320)}%s"
									,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10
									,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),math.random(-360,360)
									,math.random(-360,360),math.random(-360,360),char.center+math.random(80,120),line.middle+math.random(-40,40),char.center,line.middle,text_tag,c)
									left = left + width
									ci = ci + 1
									l.layer = sett.layer1
									subs.append(l)
								end
							end
						elseif sett.fx_entry == "Screw" then
							l = table.copy(line)
							char = {} 
							if syl.text_stripped ~= "" and syl.duration > 0 then
								cn = unicode.len(line.text_stripped:gsub(" ",""))
								ci = 1
								left, width = line.left + syl.left, 0
								
								for c in unicode.chars(syl.text_stripped) do
									width = aegisub.text_extents(line.styleref, c)
									char.left = left
									char.center = left + width / 2
									char.right = left + width
									l.effect = "curve fx"
									l.dur_fx = syl.start_time + 50*(line.kara.n - syl.i +ci/cn)
									tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
									if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
									elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
									elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
									l.start_time = line.start_time - 50*(line.kara.n - syl.i +ci/cn) + rem_time
									l.end_time = line.start_time + syl.start_time + add_time
									l.dur = l.end_time - l.start_time
									l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\frx180\\t(0,380,0.7,\\frx0)%s\\fad(300,0)\\an5\\pos(%s,%s)}%s"
									,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
									,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,char.center,line.middle,c)
									left = left + width
									ci = ci + 1
									l.layer = sett.layer1
									subs.append(l)
								end
							end
						elseif sett.fx_entry == "Move 2" then
							l = table.copy(line)
							char = {} 
							if syl.text_stripped ~= "" and syl.duration > 0 then
								cn = unicode.len(line.text_stripped:gsub(" ",""))
								ci = 1
								left, width = line.left + syl.left, 0
								
								for c in unicode.chars(syl.text_stripped) do
									width = aegisub.text_extents(line.styleref, c)
									char.left = left
									char.center = left + width / 2
									char.right = left + width
									l.effect = "curve fx"
									l.dur_fx = syl.start_time + 50*(line.kara.n - syl.i) + 250*ci/cn
									tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
									if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
									elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
									elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
									l.start_time = line.start_time - 50*(line.kara.n - syl.i) -250*ci/cn + rem_time
									l.end_time = line.start_time + syl.start_time + add_time
									l.dur = l.end_time - l.start_time
									l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(%s,%s)\\t(0,140,\\fr-0.12)\\t(140,420,\\fr0.12)\\t(420,560,\\fr0)%s\\fad(400,0)\\an5\\move(%s,%s,%s,%s,0,560)}%s"
									,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
									,_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),-10000,line.middle,text_tag,char.center+32,line.middle,char.center,line.middle,c)
									left = left + width
									ci = ci + 1
									l.layer = sett.layer1
									subs.append(l)
								end
							end
						elseif sett.fx_entry == "Move 3" then
							maxk = 6
							for k = 1, maxk do
								l = table.copy(line)
								l.effect = "curve fx"
								l.dur_fx = syl.start_time - 50*(syl.i - line.kara.n + 1) + 120*(k-1)/maxk
								tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
								if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
								elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
								elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
								l.start_time = line.start_time + 50*(syl.i-line.kara.n + 1) - 120*(k-1)/maxk + rem_time
								l.end_time = l.start_time + 360
								l.dur = l.end_time - l.start_time
								l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\alpha%s%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,0,360)}%s"
								,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
								,_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),_G.ass_alpha(100+150*(k-1)/(maxk)),text_tag,x+80,y,x,y,syl.text_stripped)
								l.layer = sett.layer1
								subs.append(l)
							end
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.start_time - 50*(syl.i - line.kara.n + 1) + 120
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time + 50*(syl.i-line.kara.n + 1) - 120 + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,0,360)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
							,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,x+80,y,x,y,syl.text_stripped)
							l.layer = sett.layer1
							subs.append(l)
						elseif sett.fx_entry == "Move 4" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.start_time - 50*(syl.i - line.kara.n + 1)
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time + 50*(syl.i-line.kara.n + 1) + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s%s\\fad(300,0)\\an5\\move(%s,%s,%s,%s,0,360)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
							,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag,x+80,y,x,y,syl.text_stripped)
							l.layer = sett.layer1
							subs.append(l)
						elseif sett.fx_entry == "Move 5" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.start_time + 340
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time - 340 + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\bord2\\shad0\\blur3\\c&HFFFFFF&\\3c&HFFFFFF&\\t(0,300,\\blur5)\\t(300,340,\\blur0\\c%s\\3c%s\\bord%s\\shad%s)%s\\an5\\move(%s,%s,%s,%s,0,300)}%s"
							,bold,italic,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
							,asscolor(sett.color_1c),asscolor(sett.color_3c),math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,text_tag,x+meta.res_x-line.left,y,x,y,syl.text_stripped)
							l.layer = sett.layer1
							subs.append(l)
						elseif sett.fx_entry == "Move 6" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.start_time + 340
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time - 340 + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\bord2\\shad0\\blur3\\c&HFFFFFF&\\3c&HFFFFFF&\\t(0,300,\\blur5)\\t(300,340,\\blur0\\c%s\\3c%s\\bord%s\\shad%s)%s\\an5\\move(%s,%s,%s,%s,0,300)}%s"
							,bold,italic,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
							,asscolor(sett.color_1c),asscolor(sett.color_3c),math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,text_tag,x-line.left-line.width,y,x,y,syl.text_stripped)
							l.layer = sett.layer1
							subs.append(l)
						elseif sett.fx_entry == "Move 7" then
							l = table.copy(line)
							char = {} 
							if syl.text_stripped ~= "" and syl.duration > 0 then
								cn = unicode.len(line.text_stripped:gsub(" ",""))
								ci = 1
								left, width = line.left + syl.left, 0
								
								for c in unicode.chars(syl.text_stripped) do
									width = aegisub.text_extents(line.styleref, c)
									char.left = left
									char.center = left + width / 2
									char.right = left + width
									l.effect = "curve fx"
									l.dur_fx = 1300
									tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
									if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
									elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
									elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
									l.start_time = line.start_time + syl.start_time - 1300 + rem_time
									l.end_time = line.start_time + syl.start_time + add_time
									l.dur = l.end_time - l.start_time
									l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fr%s\\frx%s\\fry%s\\t(0,900,\\fr0\\frx0\\fry0)%s\\fad(400,0)\\an5\\move(%s,%s,%s,%s,0,900)}%s"
									,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a)
									,_G.ass_alpha(sett.alpha_4a),math.random(-360,360),math.random(-360,360),math.random(-360,360),text_tag,char.center+math.random(80,120),line.middle+math.random(-40,40),char.center,line.middle,c)
									left = left + width
									ci = ci + 1
									l.layer = sett.layer1
									subs.append(l)
								end
							end
						elseif sett.fx_entry == "Random 1" then
							l = table.copy(line)
							l.effect = "curve fx"
							random_time = math.random(40)*10
							l.dur_fx = syl.start_time + 800 - random_time
							tag_text1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_text .."} end")() sett.tag_text2 = tag_text1(sett, meta, syl, line) tag_text = {} for i = 1, #sett.tag_text2 do if sett.tag_text2[i] then sett[i] = sett.tag_text2[i] end table.insert(tag_text, sett[i]) end
							if #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-1] == 2 then rem_time = sett.tag_text2[#sett.tag_text2] add_time = 0 if #sett.tag_text2 >= 3 then tag_t = "" for i = 1,#sett.tag_text2-2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 > 1 and sett.tag_text2[#sett.tag_text2-2] == 2 then rem_time = sett.tag_text2[#sett.tag_text2-1] add_time = sett.tag_text2[#sett.tag_text2] if #sett.tag_text2 >= 4 then tag_t = "" for i = 1,#sett.tag_text2-3,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end
							elseif #sett.tag_text2 >= 0 and sett.tag_text2[#sett.tag_text2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_text2 > 0 then tag_t = "" for i = 1,#sett.tag_text2,1 do tag_t = tag_t..sett.tag_text2[i] end text_tag = string.format("%s",tag_t) else text_tag = "" end end
							l.start_time = line.start_time - 800 + random_time + rem_time
							l.end_time = line.start_time + syl.start_time + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\fscx%s\\fscy%s\\t(0,300,\\fscx%s\\fscy%s)\\t(300,500,\\fscx%s\\fscy%s)%s\\fad(500,0)\\an5\\pos(%s,%s)}%s"
							,bold,italic,sett.bord_t,sett.shad_t,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
							,0.1*line.styleref.scale_x,0.1*line.styleref.scale_y,1.4*line.styleref.scale_x,1.4*line.styleref.scale_y,line.styleref.scale_x,line.styleref.scale_y,text_tag,x,y,syl.text_stripped)
							l.layer = sett.layer1
							subs.append(l)
						end
						--------------------------------------
						-- Sylfx -----------------------------
						if sett.fx_syl == "Clasic" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.duration + 300
							tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
							if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
							l.start_time = line.start_time + syl.start_time + rem_time
							l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\t(0,60,\\fscx%s\\fscy%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\bord3\\blur3)\\t(50,%d,\\fscx%s\\fscy%s\\1c%s\\3c%s\\bord%s\\blur0)%s\\fad(0,300)\\an5\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),1.3*line.styleref.scale_x
							,1.3*line.styleref.scale_y,l.dur,line.styleref.scale_x,line.styleref.scale_y,asscolor(sett.color_1c),asscolor(sett.color_3c),math.floor(10*sett.bord_t)/10,text_tag2,x,y,syl.text_stripped)
							l.layer = sett.layer2
							subs.append(l)
						elseif sett.fx_syl == "Jump Shine" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.duration + 300
							tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
							if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
							l.start_time = line.start_time + syl.start_time + rem_time
							l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(-10000,%s)\\fr0\\t(0,120,\\fscx%s\\fscy%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\bord3\\blur3\\fr0.08)\\t(120,%s,\\fscx%s\\fscy%s\\1c%s\\3c%s\\bord%s\\blur0\\fr0)%s\\fad(0,300)\\an5\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),y,1.05*line.styleref.scale_x,1.05*line.styleref.scale_y
							,l.dur,line.styleref.scale_x,line.styleref.scale_y,asscolor(sett.color_1c),asscolor(sett.color_3c),math.floor(10*sett.bord_t)/10,text_tag2,x,y,syl.text_stripped)
							l.layer = sett.layer2
							subs.append(l)
						elseif sett.fx_syl == "Shine 2" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.duration + 300
							tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
							if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
							l.start_time = line.start_time + syl.start_time + rem_time
							l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s%s\\fad(0,300)\\an5\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c)
							,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),text_tag2,x,y,syl.text_stripped)
							l.layer = sett.layer2
							subs.append(l)
							
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.duration + 300
							tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
							if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
							l.start_time = line.start_time + syl.start_time + rem_time
							l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\shad%s\\1c%s\\3c%s\\4c%s\\3a%s\\4a%s\\1a&HFF&\\bord3\\t(\\fscx%s\\fscy%s\\blur5\\3a&HFF&)%s\\an5\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c)
							,_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),1.8*line.styleref.scale_x,1.8*line.styleref.scale_y,text_tag2,x,y,syl.text_stripped)
							l.layer = sett.layer2
							subs.append(l)
						elseif sett.fx_syl == "Jumping" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = 600
							tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
							if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
							l.start_time = line.start_time + syl.start_time + rem_time
							l.end_time = line.start_time + syl.start_time + 600 + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(-10000,%s)\\t(0,75,\\fscx%s\\fscy%s\\c&HFFFFFF&\\3c&HFFFFFF&\\blur3)\\t(75,225,\\fr0.08\\fscx%s\\fscy%s)\\t(225,375,\\fr0\\fscx%s\\fscy%s\\1c%s\\3c%s\\blur0)\\t(375,600,\\fscx%s\\fscy%s)%s\\fad(0,260)\\an2\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),line.bottom,1.4*line.styleref.scale_x,0.6*line.styleref.scale_y,0.8*line.styleref.scale_x
							,1.2*line.styleref.scale_y,1.4*line.styleref.scale_x,0.6*line.styleref.scale_y,asscolor(sett.color_1c),asscolor(sett.color_3c),line.styleref.scale_x,line.styleref.scale_y,text_tag2,x,line.bottom,syl.text_stripped)
							l.layer = sett.layer2
							subs.append(l)
						elseif sett.fx_syl == "Clip 1" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.duration
							tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
							if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
							l.start_time = line.start_time + syl.start_time + rem_time
							l.end_time = line.start_time + syl.start_time + syl.duration + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\clip(%s,%s,%s,%s)\\t(\\clip(%s,%s,%s,%s))%s\\an5\\pos(%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
							,line.left+syl.left-1,line.top-1,line.left+syl.right+1,line.bottom+1,line.left+syl.right+1,line.top-1,line.left+syl.right+1,line.bottom+1,text_tag2,x,y,syl.text_stripped)
							l.layer = sett.layer2
							subs.append(l)
						elseif sett.fx_syl == "Clip 2" then
							l = table.copy(line)
							l.effect = "curve fx"
							l.dur_fx = syl.duration
							tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
							if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
							elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
							l.start_time = line.start_time + syl.start_time + rem_time
							l.end_time = line.start_time + syl.start_time + syl.duration + add_time
							l.dur = l.end_time - l.start_time
							l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\iclip(%s,%s,%s,%s)\\t(\\fr%s)%s\\an5\\move(%s,%s,%s,%s)}%s"
							,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
							,line.left+syl.left-20,line.bottom-1,line.left+syl.right+20,line.bottom+syl.height+10,45*(-1)^math.random(2),text_tag2,x,y,x,y+syl.height,syl.text_stripped)
							l.layer = sett.layer2
							subs.append(l)
						elseif sett.fx_syl == "Random Move" then
							l = table.copy(line)
							char = {} 
							if syl.text_stripped ~= "" and syl.duration > 0 then
								cn = unicode.len(line.text_stripped:gsub(" ",""))
								ci = 1
								left, width = line.left + syl.left, 0
								
								for c in unicode.chars(syl.text_stripped) do
									width = aegisub.text_extents(line.styleref, c)
									char.left = left
									char.center = left + width / 2
									char.right = left + width
									l.effect = "curve fx"
									l.dur_fx = syl.duration + 300
									tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
									if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
									elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
									elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
									l.start_time = line.start_time + syl.start_time + rem_time
									l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
									l.dur = l.end_time - l.start_time
									l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\t(\\fr%s\\frx%s\\fry%s)%s\\fad(0,300)\\an5\\move(%s,%s,%s,%s)}%s"
									,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
									,math.random(-360,360),math.random(-360,360),math.random(-360,360),text_tag2,char.center,line.middle,char.center+math.random(-0.5*syl.height,0.5*syl.height),line.middle+math.random(-0.5*syl.height,0.5*syl.height),c)
									left = left + width
									ci = ci + 1
									l.layer = sett.layer2
									subs.append(l)
								end
							end
						elseif sett.fx_syl == "Buzzing 1" then
							for i = 1,8,1 do
								l = table.copy(line)
								l.effect = "curve fx"
								l.dur_fx = syl.duration + 300
								tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
								if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
								elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
								elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
								l.start_time = line.start_time + syl.start_time + rem_time
								l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
								l.dur = l.end_time - l.start_time
								l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(%s,-10000)\\t(0,50,\\fr%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\blur5\\fscx%s\\fscy%s\\alpha&H86&)\\t(50,%s,\\1c%s\\3c%s\\blur0\\fr0\\fscx%s\\fscy%s\\alpha&HFF&)%s\\an5\\pos(%s,%s)}%s"
								,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
								,x,0.09*(i/8)*(-1)^i,1.2*line.styleref.scale_x,1.2*line.styleref.scale_y,l.dur,asscolor(sett.color_1c),asscolor(sett.color_3c),line.styleref.scale_x,line.styleref.scale_y,text_tag2,x,y,syl.text_stripped)
								l.layer = sett.layer2
								subs.append(l)
							end
						elseif sett.fx_syl == "Buzzing 2" then
							for i = 1,8,1 do
								l = table.copy(line)
								l.effect = "curve fx"
								l.dur_fx = syl.duration + 300
								tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
								if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
								elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
								elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
								l.start_time = line.start_time + syl.start_time + rem_time
								l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
								l.dur = l.end_time - l.start_time
								l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c%s\\3c%s\\4c%s\\1a%s\\3a%s\\4a%s\\org(-10000,%s)\\t(0,50,\\fr%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\blur5\\fscx%s\\fscy%s\\alpha&H86&)\\t(50,%s,\\1c%s\\3c%s\\blur0\\fr0\\fscx%s\\fscy%s\\alpha&HFF&)%s\\an5\\pos(%s,%s)}%s"
								,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_1c),asscolor(sett.color_3c),asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a)
								,y,0.09*(i/8)*(-1)^i,1.2*line.styleref.scale_x,1.2*line.styleref.scale_y,l.dur,asscolor(sett.color_1c),asscolor(sett.color_3c),line.styleref.scale_x,line.styleref.scale_y,text_tag2,x,y,syl.text_stripped)
								l.layer = sett.layer2
								subs.append(l)
							end
						elseif sett.fx_syl == "Shine 3" then	
							for i = 1,12,1 do
								l = table.copy(line)
								l.effect = "curve fx"
								tag_texts1 = loadstring("return function(sett, meta, syl, line) return {".. sett.tag_texts .."} end")() sett.tag_texts2 = tag_texts1(sett, meta, syl, line) tag_texts = {} for i = 1, #sett.tag_texts2 do if sett.tag_texts2[i] then sett[i] = sett.tag_texts2[i] end table.insert(tag_texts, sett[i]) end
								if #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-1] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2] add_time = 0 if #sett.tag_texts2 >= 3 then tag_t2 = "" for i = 1,#sett.tag_texts2-2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
								elseif #sett.tag_texts2 > 1 and sett.tag_texts2[#sett.tag_texts2-2] == 2 then rem_time = sett.tag_texts2[#sett.tag_texts2-1] add_time = sett.tag_texts2[#sett.tag_texts2] if #sett.tag_texts2 >= 4 then tag_t2 = "" for i = 1,#sett.tag_texts2-3,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end
								elseif #sett.tag_texts2 >= 0 and sett.tag_texts2[#sett.tag_texts2-1] ~= 2 then rem_time = 0 add_time = 0 if #sett.tag_texts2 > 0 then tag_t2 = "" for i = 1,#sett.tag_texts2,1 do tag_t2 = tag_t2..sett.tag_texts2[i] end text_tag2 = string.format("%s",tag_t2) else text_tag2 = "" end end
								l.start_time = line.start_time + syl.start_time + rem_time
								l.end_time = line.start_time + syl.start_time + syl.duration + 300 + add_time
								l.dur = l.end_time - l.start_time
								l.text = string.format("{\\b%s\\i%s\\bord%s\\shad%s\\1c&HFFFFFF&\\3c&HFFFFFF&\\blur2\\4c%s\\1a%s\\3a%s\\4a%s\\alpha%s\\org(-10000,%s)\\t(0,50,\\fr%s)\\t(50,%s,\\1c%s\\3c%s\\blur0\\fr0\\alpha&HFF&)%s\\an5\\pos(%s,%s)}%s"
								,bold,italic,math.floor(10*sett.bord_t)/10,math.floor(10*sett.shad_t)/10,asscolor(sett.color_4c),_G.ass_alpha(sett.alpha_1a),_G.ass_alpha(sett.alpha_3a),_G.ass_alpha(sett.alpha_4a),_G.ass_alpha(80+150*(12-i)/11)
								,y,0.24*((12-i)/11),l.dur,asscolor(sett.color_1c),asscolor(sett.color_3c),text_tag2,x,y,syl.text_stripped)
								l.layer = sett.layer2
								subs.append(l)
							end
						end
						--------------------------------------
					end
					
					-- angle of imagen shape --
					angle_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.angle_s .."} end")()
					sett.angle_s2 = angle_s1(sett, meta, syl, line)
					angle_s = {}
					for i = 1, #sett.angle_s2 do
						if sett.angle_s2[i] then
							sett[i] = sett.angle_s2[i]
						end
						table.insert(angle_s, sett[i])
					end
					-----------------------------------------
					
					-- rotation origen of shape --
					org_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.org_s .."} end")()
					sett.org_s2 = org_s1(sett, meta, syl, line)
					org_s = {}
					for i = 1, #sett.org_s2 do
						if sett.org_s2[i] then
							sett[i] = sett.org_s2[i]
						end
						table.insert(org_s, sett[i])
					end
					-----------------------------------------
					
					-- random size shape --
					min_size1 = loadstring("return function(sett, meta, syl, line) return {".. sett.min_size .."} end")()
					sett.min_size2 = min_size1(sett, meta, syl, line)
					min_size = {}
					for i = 1, #sett.min_size2 do
						if sett.min_size2[i] then
							sett[i] = sett.min_size2[i]
						end
						table.insert(min_size, sett[i])
					end
					
					max_size1 = loadstring("return function(sett, meta, syl, line) return {".. sett.max_size .."} end")()
					sett.max_size2 = max_size1(sett, meta, syl, line)
					max_size = {}
					for i = 1, #sett.max_size2 do
						if sett.max_size2[i] then
							sett[i] = sett.max_size2[i]
						end
						table.insert(max_size, sett[i])
					end
					-----------------------------------------
					
					-- duration imagen shape --
					dur_i1 = loadstring("return function(sett, meta, syl, line) return {".. sett.dur_i .."} end")()
					sett.dur_i2 = dur_i1(sett, meta, syl, line)
					dur_i = {}
					for i = 1, #sett.dur_i2 do
						if sett.dur_i2[i] then
							sett[i] = sett.dur_i2[i]
						end
						table.insert(dur_i, sett[i])
					end
					-----------------------------------------
					
					-- extra tags with variables in template syl --
					extra_tag1 = loadstring("return function(sett, meta, syl, line) return {".. sett.extra_tag .."} end")()
					sett.extra_tag2 = extra_tag1(sett, meta, syl, line)
					extra_tag = {}
					for i = 1, #sett.extra_tag2 do
						if sett.extra_tag2[i] then
							sett[i] = sett.extra_tag2[i]
						end
						table.insert(extra_tag, sett[i])
					end
					-----------------------------------------
					
					-- layer shape --
					layer_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.layer_s .."} end")()
					sett.layer_s2 = layer_s1(sett, meta, syl, line)
					layer_s = {}
					for i = 1, #sett.layer_s2 do
						if sett.layer_s2[i] then
							sett[i] = sett.layer_s2[i]
						end
						table.insert(layer_s, sett[i])
					end
					-----------------------------------------
					
					-- variables4 per syllable---
					if sett.angle_s2[1] == nil then
						angle = 0
					else
						angle = sett.angle_s2[1]
					end----------------------------
					
					if sett.org_s2[2] == nil then
						if sett.org_s2[1] == nil then
							org_si = math.ceil(100*(line.left+syl.center))/100
							org_sf = math.ceil(100*line.middle)/100
						else
							org_si = math.ceil(100*sett.org_s2[1])/100
							org_sf = math.ceil(100*line.middle)/100
						end
					else
						org_si = math.ceil(100*sett.org_s2[1])/100
						org_sf = math.ceil(100*sett.org_s2[2])/100
					end----------------------------
					
					if sett.org_tag == true then
						org_tag = string.format("\\org(%s,%s)\\fr%s",org_si,org_sf,angle)
					else
						org_tag = ""
					end----------------------------
					
					if sett.min_size2[1] == nil then
						if sett.max_size2[1] == nil then
							size_min = 20
						else
							size_min = size_max - 20
						end
					elseif sett.min_size2[1] > sett.max_size2[1] then
						size_min = size_max - 20
					else
						size_min = sett.min_size2[1]
					end----------------------------
					if sett.max_size2[1] == nil then
						if sett.min_size2[1] == nil then
							size_max = 50
						else
							size_max = size_min + 20
						end
					else
						size_max = sett.max_size2[1]
					end----------------------------
					size_random_syl = math.ceil(100*math.random(size_min,size_max))/100
					-------------------------------
					
					if sett.dur_i2[1] == nil then
						dur_is = end_ss - start_ss				--> duration imagen
					elseif sett.dur_i2[1] == 0 then
						if sett.dur_i2[2] then
							dur_is = end_ss - start_ss + sett.dur_i2[2]
						else
							dur_is = end_ss - start_ss
						end
					elseif sett.dur_i2[1] < 0 then
						if sett.dur_i2[2] then
							dur_is = abs(sett.dur_i2[1]) + sett.dur_i2[2]
						else
							dur_is = abs(sett.dur_i2[1])
						end
					elseif sett.dur_i2[1] > 0 then
						if sett.dur_i2[2] then
							dur_is = sett.dur_i2[1] + sett.dur_i2[2]
						else
							dur_is = sett.dur_i2[1]
						end
					end----------------------------
					
					if sett.layer_s2[1] == nil or math.ceil(sett.layer_s2[1]) < 0 then
						layer_ss = 0
					else
						layer_ss = sett.layer_s2[1]
					end----------------------------
					-------------------------------
					
					for j = 1, maxj do
						
						-- interpolation algorithm --
						if maxj == 1 then
							module = 0
						elseif maxj > 1 and math.floor(maxj/redun) == 1 then
							module = (math.ceil(j/redun)-1)/math.floor(maxj/redun)
						else
							module = (math.ceil(j/redun)-1)/(math.floor(maxj/redun)-1)
						end
						------------------------------------
						
						if sett.inv ==  true then
							s = s_fs - (s_fs-s_is)*module
						else
							s = s_is + (s_fs-s_is)*module
						end
						
						-- parameters in x curve --
						x_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.x_s .."} end")()
						sett.x_s2 = x_s1(sett, meta, syl, line)
						x_s = {}
						for i = 1, #sett.x_s2 do
							if sett.x_s2[i] then
								sett[i] = sett.x_s2[i]
							end
							table.insert(x_s, sett[i])
						end
						------------------------------------

						-- parameters in y curve --
						y_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.y_s .."} end")()
						sett.y_s2 = y_s1(sett, meta, syl, line)
						y_s = {}
						for i = 1, #sett.y_s2 do
							if sett.y_s2[i] then
								sett[i] = sett.y_s2[i]
							end
							table.insert(y_s, sett[i])
						end
						------------------------------------
					
						-- move in x shape --
						move_x1 = loadstring("return function(sett, meta, syl, line) return {".. sett.move_x .."} end")()
						sett.move_x2 = move_x1(sett, meta, syl, line)
						move_x = {}
						for i = 1, #sett.move_x2 do
							if sett.move_x2[i] then
								sett[i] = sett.move_x2[i]
							end
							table.insert(move_x, sett[i])
						end
						------------------------------------

						-- move in y shape --
						move_y1 = loadstring("return function(sett, meta, syl, line) return {".. sett.move_y .."} end")()
						sett.move_y2 = move_y1(sett, meta, syl, line)
						move_y = {}
						for i = 1, #sett.move_y2 do
							if sett.move_y2[i] then
								sett[i] = sett.move_y2[i]
							end
							table.insert(move_y, sett[i])
						end
						-------------------------------------
					
						-- color of shape ---------------------------------------------------------------------------------------------------------------------
						if sett.pro_c == true then
							if sett.rand_1c == false and sett.rand_1cf == false then
								color1_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, asscolor(sett.color_1c_s), asscolor(sett.color_1c_sf))
							elseif sett.rand_1c == true and sett.rand_1cf == false then
								color1_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, color1_randii, asscolor(sett.color_1c_sf))
							elseif sett.rand_1c == true and sett.rand_1cf == true then
								color1_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, color1_randii, color1_randff)
							elseif sett.rand_1c == false and sett.rand_1cf == true then
								color1_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, asscolor(sett.color_1c_s), color1_randff)
							end
						
							if sett.rand_3c == false and sett.rand_3cf == false then
								color3_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, asscolor(sett.color_3c_s), asscolor(sett.color_3c_sf))
							elseif sett.rand_3c == true and sett.rand_3cf == false then
								color3_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, color3_randii, asscolor(sett.color_3c_sf))
							elseif sett.rand_3c == true and sett.rand_3cf == true then
								color3_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, color3_randii, color3_randff)
							elseif sett.rand_3c == false and sett.rand_3cf == true then
								color3_img = _G.interpolate_color((syl.i-(1-module))/line.kara.n, asscolor(sett.color_3c_s), color3_randff)
							end
						else
							if sett.rand_1c == false and sett.rand_1cf == false then
								color1_img = _G.interpolate_color(module, asscolor(sett.color_1c_s), asscolor(sett.color_1c_sf))
							elseif sett.rand_1c == true and sett.rand_1cf == false then
								color1_img = _G.interpolate_color(module, color1_randi, asscolor(sett.color_1c_sf))
							elseif sett.rand_1c == true and sett.rand_1cf == true then
								color1_img = _G.interpolate_color(module, color1_randi, color1_randf)
							elseif sett.rand_1c == false and sett.rand_1cf == true then
								color1_img = _G.interpolate_color(module, asscolor(sett.color_1c_s), color1_randf)
							end
						
							if sett.rand_3c == false and sett.rand_3cf == false then
								color3_img = _G.interpolate_color(module, asscolor(sett.color_3c_s), asscolor(sett.color_3c_sf))
							elseif sett.rand_3c == true and sett.rand_3cf == false then
								color3_img = _G.interpolate_color(module, color3_randi, asscolor(sett.color_3c_sf))
							elseif sett.rand_3c == true and sett.rand_3cf == true then
								color3_img = _G.interpolate_color(module, color3_randi, color3_randf)
							elseif sett.rand_3c == false and sett.rand_3cf == true then
								color3_img = _G.interpolate_color(module, asscolor(sett.color_3c_s), color3_randf)
							end
						end
						---------------------------------------------------------------------------------------------------------------------------------------
					
						-- shape ----------------------------
						shape = sett.shape
						-------------------------------------
						-- variables5 per loop/module ---
						if sett.x_s2[1] == nil then			--> parameter x
							x_ss = 0
						else
							x_ss = sett.x_s2[1]
						end------------------------------
						if sett.y_s2[1] == nil then			--> parameter y
							y_ss = 0
						else
							y_ss = sett.y_s2[1]
						end------------------------------
						
						if sett.move_x2[1] == nil then		--> move x
							move_xs = 0
						else
							move_xs = sett.move_x2[1]
						end------------------------------
						if sett.move_y2[1] == nil then		--> move y
							move_ys = 0
						else
							move_ys = sett.move_y2[1]
						end------------------------------
						
						-- \\an shape --
						if sett.an_s == 0 then
							an_ss = math.random(9)
						else
							an_ss = sett.an_s
						end
						-----------------------------------
						
						-- variables6 per loop ----
						if sett.syl_loop == true then
							layer_ss = layer_ss
						else
							-- layer shape ------------------------
							layer_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.layer_s .."} end")()
							sett.layer_s2 = layer_s1(sett, meta, syl, line)
							layer_s = {}
							for i = 1, #sett.layer_s2 do
								if sett.layer_s2[i] then
									sett[i] = sett.layer_s2[i]
								end
								table.insert(layer_s, sett[i])
							end
							---------------------------------------
							if sett.layer_s2[1] == nil or math.ceil(sett.layer_s2[1]) < 0 then
								layer_ss = 0
							else
								layer_ss = sett.layer_s2[1]
							end
						end
						--========================--
						-- variables7 per loop/module
						--== duration variables ==--
						if sett.start_s2[2] == 2 then
							start_ss1 = start_ss + sett.start_s2[3]*module
						else
							start_ss1 = start_ss
						end
						
						if sett.end_s2[2] == 2 then
							end_ss1 = end_ss + sett.end_s2[3]*module
						else
							end_ss1 = end_ss
						end
						
						if sett.dur_i2[3] == 2 then
							--
							if sett.dur_i2[1] == nil then
								dur_is = end_ss1 - start_ss1
							elseif sett.dur_i2[1] == 0 then
								if sett.dur_i2[2] then
									dur_is = end_ss1 - start_ss1 + sett.dur_i2[2]
								else
									dur_is = end_ss1 - start_ss1
								end
							elseif sett.dur_i2[1] < 0 then
								if sett.dur_i2[2] then
									dur_is = abs(sett.dur_i2[1]) + sett.dur_i2[2]
								else
									dur_is = abs(sett.dur_i2[1])
								end
							elseif sett.dur_i2[1] > 0 then
								if sett.dur_i2[2] then
									dur_is = sett.dur_i2[1] + sett.dur_i2[2]
								else
									dur_is = sett.dur_i2[1]
								end
							end
							--
							dur_is1 = dur_is + sett.dur_i2[4]*module
						else
							--
							if sett.dur_i2[1] == nil then
								dur_is = end_ss1 - start_ss1
							elseif sett.dur_i2[1] == 0 then
								if sett.dur_i2[2] then
									dur_is = end_ss1 - start_ss1 + sett.dur_i2[2]
								else
									dur_is = end_ss1 - start_ss1
								end
							elseif sett.dur_i2[1] < 0 then
								if sett.dur_i2[2] then
									dur_is = abs(sett.dur_i2[1]) + sett.dur_i2[2]
								else
									dur_is = abs(sett.dur_i2[1])
								end
							elseif sett.dur_i2[1] > 0 then
								if sett.dur_i2[2] then
									dur_is = sett.dur_i2[1] + sett.dur_i2[2]
								else
									dur_is = sett.dur_i2[1]
								end
							end
							--
							dur_is1 = dur_is
						end
						--========================--
						--==== size variables ====--
						if sett.fscx_s2[3] == 2 then
							fscxs1 = fscxs + math.ceil(100*sett.fscx_s2[4]*module)/100
							fscys1 = fscxs1
						else
							fscxs1 = fscxs
							fscys1 = fscys
						end
						if sett.fscy_s2[2] == 2 then
							fscys1 = math.ceil(100*sett.fscy_s2[3])/100
							fscxs1 = fscys1
						end
						
						if sett.r_size == true then
							-- random size shape --------
							if sett.syl_loop == true then
								fscxs1 = size_random_syl
								fscys1 = size_random_syl
							else
								size_random_loop = math.ceil(100*math.random(size_min,size_max))/100
								fscxs1 = size_random_loop
								fscys1 = size_random_loop
							end
							-----------------------------
						end
						
						--========================--
						--== position variables ==--
						if sett.center_x2[2] == 2 then
							center_xs1 = center_xs + math.ceil(100*sett.center_x2[3]*module)/100
						else
							center_xs1 = center_xs
						end
						if sett.center_y2[2] == 2 then
							center_ys1 = center_ys + math.ceil(100*sett.center_y2[3]*module)/100
						else
							center_ys1 = center_ys
						end
						if sett.move_x2[2] == 2 then
							move_xs1 = move_xs + math.ceil(100*sett.move_x2[3]*module)/100
						else
							move_xs1 = move_xs
						end
						if sett.move_y2[2] == 2 then
							move_ys1 = move_ys + math.ceil(100*sett.move_y2[3]*module)/100
						else
							move_ys1 = move_ys
						end
						--========================--
						
						-- position shape --
						if sett.sign_xa == true then
							if sett.sign_xp == true then
								x_s = ((-1)^(syl.i+1))*x_ss
							else
								x_s = ((-1)^syl.i)*x_ss
							end
						else
							x_s = sign_x*x_ss
						end

						if sett.sign_ya == true then
							if sett.sign_yp == true then
								y_s = ((-1)^(syl.i+1))*y_ss
							else
								y_s = ((-1)^syl.i)*y_ss
							end
						else
							y_s = sign_y*y_ss
						end
						
						x_pos = math.floor((center_xs1 + scale_xs*x_s)*100)/100
						y_pos = math.floor((center_ys1 - scale_ys*y_s)*100)/100
						-----------------------------------
					
						if sett.temp_type == "Syl" then
							l = table.copy(line)
							l.effect = "curve fx"
							if sett.s_start_s == true and sett.s_end_s == true then
								l.start_time = line.start_time + syl.start_time + start_ss1 + (end_ss1 - start_ss1)*module^aceleration
								l.end_time = l.start_time + dur_is1
							elseif sett.s_start_s == true and sett.s_end_s == false then
								l.start_time = line.start_time + syl.start_time + start_ss1 + (end_ss1 - start_ss1)*module^aceleration
								l.end_time = line.start_time + syl.start_time + end_ss1
							elseif sett.s_start_s == false and sett.s_end_s == true then
								l.start_time = line.start_time + syl.start_time + start_ss1
								l.end_time = line.start_time + syl.start_time + end_ss1 + dur_is1*module^aceleration
							elseif sett.s_start_s == false and sett.s_end_s == false then
								l.start_time = line.start_time + syl.start_time + start_ss1
								l.end_time = line.start_time + syl.start_time + end_ss1
							end
							l.dur = l.end_time - l.start_time
							-- undercovers transformations --
							transfor_s = loadstring("return function(sett, meta, syl, line) return {".. sett.layer_s .."} end")()
							sett.transfor = transfor_s(sett, meta, syl, line)
							layer_s = {}
							for i = 1, #sett.transfor do
								if sett.transfor[i] then
									sett[i] = sett.transfor[i]
								end
								table.insert(layer_s, sett[i])
							end
							if #sett.transfor > 1 then
								tag = sett.transfor[2]..","..sett.transfor[3]..","
								for i = 4,#sett.transfor,2 do
									tag = tag..sett.transfor[i]..sett.transfor[i+1]
								end
								t_tag = string.format("\\t(%s)",tag) --> template loop
							else
								t_tag = ""
							end
							if #sett.angle_s2 > 1 then
								tag2 = sett.angle_s2[2]..","..sett.angle_s2[3]..","
								for i = 4,#sett.angle_s2,2 do
									tag2 = tag2..sett.angle_s2[i]..sett.angle_s2[i+1]
								end
								t_tag2 = string.format("\\t(%s)",tag2) --> template syl
							else
								t_tag2 = ""
							end
							---------------------------------
							-- extra tags with variables ----
							if sett.syl_loop == true then --> trmplate syl
								if #sett.extra_tag2 > 0 then
									tag3 = ""
									for i = 1,#sett.extra_tag2,1 do
										tag3 = tag3..sett.extra_tag2[i]
									end
									var_tag = string.format("%s",tag3)
								else
									var_tag = ""
								end
							elseif sett.syl_loop == false then --> trmplate loop
								extra_tag1 = loadstring("return function(sett, meta, syl, line) return {".. sett.extra_tag .."} end")()
								sett.extra_tag2 = extra_tag1(sett, meta, syl, line)
								extra_tag = {}
								for i = 1, #sett.extra_tag2 do
									if sett.extra_tag2[i] then
										sett[i] = sett.extra_tag2[i]
									end
									table.insert(extra_tag, sett[i])
								end
								if #sett.extra_tag2 > 0 then
									tag3 = ""
									for i = 1,#sett.extra_tag2,1 do
										tag3 = tag3..sett.extra_tag2[i]
									end
									var_tag = string.format("%s",tag3)
								else
									var_tag = ""
								end
							end
							--------------------------------------------
							l.text = string.format("{\\an%s\\1c%s\\3c%s\\fscx%s\\fscy%s\\fad(%s,%s)\\p1%s%s%s%s%s\\move(%s,%s,%s,%s,%s,%s)}%s"
							, an_ss, color1_img, color3_img, fscxs1, fscys1, fad_sis, fad_sfs, sett.e_tags, var_tag, org_tag, t_tag, t_tag2, x_pos, y_pos, x_pos+move_xs1, y_pos+move_ys1, 0, l.dur, shape)
							l.layer = layer_ss
							subs.append(l)
						
						else
							if syl.i == 1 then
								l = table.copy(line)
								l.effect = "curve fx"
								if sett.s_start_s == true and sett.s_end_s == true then
									l.start_time = line.start_time + syl.start_time + start_ss1 + (end_ss1 - start_ss1)*module^aceleration
									l.end_time = l.start_time + dur_is1
								elseif sett.s_start_s == true and sett.s_end_s == false then
									l.start_time = line.start_time + syl.start_time + start_ss1 + (end_ss1 - start_ss1)*module^aceleration
									l.end_time = line.start_time + syl.start_time + end_ss1
								elseif sett.s_start_s == false and sett.s_end_s == true then
									l.start_time = line.start_time + syl.start_time + start_ss1
									l.end_time = line.start_time + syl.start_time + end_ss1 + dur_is1*module^aceleration
								elseif sett.s_start_s == false and sett.s_end_s == false then
									l.start_time = line.start_time + syl.start_time + start_ss1
									l.end_time = line.start_time + syl.start_time + end_ss1
								end
								l.dur = l.end_time - l.start_time
								-- undercover transformation --
								transfor_s = loadstring("return function(sett, meta, syl, line) return {".. sett.layer_s .."} end")()
								sett.transfor = transfor_s(sett, meta, syl, line)
								layer_s = {}
								for i = 1, #sett.transfor do
									if sett.transfor[i] then
										sett[i] = sett.transfor[i]
									end
									table.insert(layer_s, sett[i])
								end
								if #sett.transfor > 1 then
									tag = sett.transfor[2]..","..sett.transfor[3]..","
									for i = 4,#sett.transfor,2 do
										tag = tag..sett.transfor[i]..sett.transfor[i+1]
									end
									t_tag = string.format("\\t(%s)",tag) -- template loop
								else
									t_tag = ""
								end
								if #sett.angle_s2 > 1 then -- undercover transformation 2
									tag2 = sett.angle_s2[2]..","..sett.angle_s2[3]..","
									for i = 4,#sett.angle_s2,2 do
										tag2 = tag2..sett.angle_s2[i]..sett.angle_s2[i+1]
									end
									t_tag2 = string.format("\\t(%s)",tag2) -- template syl
								else
									t_tag2 = ""
								end
								------------------------------------------------
								-- extra tags with variables in template syl/loop --
								if sett.syl_loop == true then --> trmplate syl
									if #sett.extra_tag2 > 0 then
										tag3 = ""
										for i = 1,#sett.extra_tag2,1 do
											tag3 = tag3..sett.extra_tag2[i]
										end
										var_tag = string.format("%s",tag3)
									else
										var_tag = ""
									end
								elseif sett.syl_loop == false then --> trmplate loop
									extra_tag1 = loadstring("return function(sett, meta, syl, line) return {".. sett.extra_tag .."} end")()
									sett.extra_tag2 = extra_tag1(sett, meta, syl, line)
									extra_tag = {}
									for i = 1, #sett.extra_tag2 do
										if sett.extra_tag2[i] then
											sett[i] = sett.extra_tag2[i]
										end
										table.insert(extra_tag, sett[i])
									end
									if #sett.extra_tag2 > 0 then
										tag3 = ""
										for i = 1,#sett.extra_tag2,1 do
											tag3 = tag3..sett.extra_tag2[i]
										end
										var_tag = string.format("%s",tag3)
									else
										var_tag = ""
									end
								end
								-------------------------------------------
								l.text = string.format("{\\an%s\\1c%s\\3c%s\\fscx%s\\fscy%s\\fad(%s,%s)\\p1%s%s%s%s%s\\move(%s,%s,%s,%s,%s,%s)}%s"
								, an_ss, color1_img, color3_img, fscxs1, fscys1, fad_sis, fad_sfs, sett.e_tags, var_tag, org_tag, t_tag, t_tag2, x_pos, y_pos, x_pos+move_xs1, y_pos+move_ys1, 0, l.dur, shape)
								l.layer = layer_ss
								subs.append(l)
							end
						end
					end
				end
			end
		end
	end
end

setting_box1 = {
	[1] = {
		class = "label";
		x = 0; y = 0;
		height = 1; width = 2;
		label = "<< Primary Setting >>"
		},
	[2] = {
		class = "label";
		x = 0; y = 1;
		height = 1; width = 1;
		label = "             Apply to Style"
		},
	[3] = {
		name = "line_style";
		class = "dropdown";
		x = 1; y = 1;
		height = 1; width = 3;
		items = { };
		hint = "Selected Lines or Lines Styles to which you Apply the Effect.";
		value = ""
		},
	[4] = {
		class = "label";
		x = 0; y = 2;
		height = 1; width = 1;
		label = "           Selection Effect"
		},
	[5] = {
		name = "effect" ;
		class = "dropdown" ;
		x = 1; y = 2;
		height = 1; width = 3;
		items = {"Default Curve","Advanced Curve" };
		hint = "Select the Effect Type, Basic or Advanced.";
		value = "Default Curve"
		},
	[6] = {
		class = "label";
		x = 0; y = 3;
		height = 1; width = 1;
		label = "<< Text Setting >>"
		},
	[7] = {
		class = "label";
		x = 1; y = 4;
		height = 1; width = 1;
		label = " Primary"
		},
	[8] = {
		class = "label";
		x = 2; y = 4;
		height = 1; width = 1;
		label = " Border"
		},
	[9] = {
		class = "label";
		x = 3; y = 4;
		height = 1; width = 1;
		label = " Shadow"
		},
	[10] = {
		class = "label";
		x = 0; y = 5;
		height = 1; width = 1;
		label = "                   Color Text"
		},
	[11] = {
		name = "color_1c";
		class = "color";
		x = 1; y = 5;
		height = 1; width = 1;
		hint = "select the primary color of text.";
		value = "#FFFFFF"
		},
	[12] = {
		name = "color_3c";
		class = "color";
		x = 2; y = 5;
		height = 1; width = 1;
		hint = "select the border color of text.";
		value = "#000000"
		},
	[13] = {
		name = "color_4c";
		class = "color";
		x = 3; y = 5;
		height = 1; width = 1;
		hint = "select the shadow color of text.";
		value = "#000000"
		},
	[14] = {
		class = "label";
		x = 0; y = 6;
		height = 1; width = 1;
		label ="                  Alpha Text"
		},
	[15] = {
		name = "alpha_1a";
		class = "intedit";
		x = 1; y = 6;
		height = 1; width = 1;
		min = 0; max = 255;
		hint = "select alpha of the primary color of text.";
		value = "0"
		},
	[16] = {
		name = "alpha_3a";
		class = "intedit";
		x = 2; y = 6;
		height = 1; width = 1;
		min = 0; max = 255;
		hint = "select alpha of the border color of text.";
		value = "0"
		},
	[17] = {
		name = "alpha_4a";
		class = "intedit";
		x = 3; y = 6;
		height = 1; width = 1;
		min = 0; max = 255;
		hint = "select alpha of the shadow color of text.";
		value = "0"
		},
	[18] = {
		name = "bold";
		class = "checkbox";
		x = 1 ; y = 7;
		height = 1; width = 1;
		label = "Bold";
		hint = "bold text";
		value = false
		},
	[19] = {
		name = "italic";
		class = "checkbox";
		x = 1; y = 8;
		height = 1; width = 1;
		label = "Italic";
		hint = "italic text";
		value = false
		},
	[20] = {
		class = "label";
		x = 2; y = 7;
		height = 1; width = 1;
		label = " \\bord"
		},
	[21] = {
		name = "bord_t";
		class = "floatedit";
		x = 2; y = 8;
		height = 1; width = 1;
		hint = "select border size of text.";
		value = 2
		},
	[22] = {
		class = "label";
		x = 3; y = 7;
		height = 1; width = 1;
		label = " \\shad"
		},
	[23] = {
		name = "shad_t";
		class = "floatedit";
		x = 3; y = 8;
		height = 1; width = 1;
		hint = "select shadow size of text.";
		value = 0
		},
	[24] = {
		name = "saveconfiguration";
		class = "checkbox";
		x = 0; y = 18;
		height = 1; width = 1;
		label = "Save Configuration";
		hint = "save the configuration of text.";
		value = true
		},
	[25] = {
		class = "label";
		x = 2; y = 9;
		height = 1; width = 1;
		label = " Layer [start2syl]"
		},
	[26] = {
		class = "label";
		x = 3; y = 9;
		height = 1; width = 1;
		label = " Layer [syl]"
		},
	[27] = {
		name = "layer1";
		class = "intedit";
		x = 2; y = 10;
		height = 1; width = 1;
		min = 0; max = 1000;
		hint = "select layer of the 'start2syl' text.";
		value = "1"
		},
	[28] = {
		name = "layer2";
		class = "intedit";
		x = 3; y = 10;
		height = 1; width = 1;
		min = 0; max = 1000;
		hint = "select layer of the 'syl' text.";
		value = "2"
		},
	[29] = {
		name = "fx_entry";
		class = "dropdown";
		x = 2; y = 11;
		height = 1; width = 2;
		items = {"Clasic","Move 1","Screw","Move 2","Overturn Move","Move 3","Upward Move","Move 4","Catapult Move","Move 5","Knife Move","Move 6","Blender","Move 7","Random 1"};
		hint = "Selected Effect for EntryFX Text.";
		value = "Clasic"
		},
	[30] = {
		name = "fx_syl";
		class = "dropdown";
		x = 2; y = 12;
		height = 1; width = 2;
		items = {"Clasic","Jumping","Jump Shine","Shine 2","Clip 1","Clip 2","Random Move","Buzzing 1","Buzzing 2","Shine 3"};
		hint = "Selected Effect for SylFX Text.";
		value = "Clasic"
		},
	[31] = {
		class = "label";
		x = 1; y = 11;
		height = 1; width = 1;
		label = "        EntryFX [start2syl]"
		},
	[32] = {
		class = "label";
		x = 1; y = 12;
		height = 1; width = 1;
		label = "                      SylFX [syl]"
		},
	[33] = {
		name = "noblank";
		class = "checkbox";
		x = 1; y = 9;
		height = 1; width = 1;
		label = "No Blank";
		hint = "makes the effect is applied to syllables that are blank.";
		value = true
		},
	[34] = {
		name = "nocurve";
		class = "checkbox";
		x = 1; y = 10;
		height = 1; width = 1;
		label = "No Curve";
		hint = "eliminates the effect of the curve.";
		value = false
		},
	[35] = {
		name = "tag_text";
		class = "textbox";
		x = 0; y = 14;
		height = 4; width = 2;
		hint = "add the tag for text effect [entryFX].";
		text = ""
		},
	[36] = {
		class = "label";
		x = 0; y = 13;
		height = 1; width = 2;
		label = " Add Tags [start2syl]"
		},
	[37] = {
		name = "tag_texts";
		class = "textbox";
		x = 2; y = 14;
		height = 4; width = 2;
		hint = "add the tag for text effect [sylFX].";
		text = ""
		},
	[38] = {
		class = "label";
		x = 2; y = 13;
		height = 1; width = 2;
		label = " Add Tags [syl]"
		}
}

setting_box2 = {
	[1] = {
		class = "label";
		x = 0; y = 0;
		height = 1; width = 2;
		label = "<< Curve Setting >>"
		},
	[2] = {
		class = "label";
		x = 0; y = 1;
		height = 1; width = 2;
		label = "                           x(s) = "
		},
	[3] = {
		name = "x_s";
		class = "textbox";
		x = 2; y = 1;
		height = 1; width = 15;
		hint = "parameter in 'x' of the curve.";
		text = "2*cos(s)*sin(s)"
		},
	[4] = {
		class = "label";
		x = 0; y = 2;
		height = 1; width = 2;
		label = "                           y(s) = "
		},
	[5] = {
		name = "y_s" ;
		class = "textbox";
		x = 2; y = 2;
		height = 1; width = 15;
		hint = "parameter in 'x' of the curve.";
		text = "sin(3*s)"
		},
	[6] = {
		class = "label";
		x = 0; y = 3;
		height = 1; width = 2;
		label = "                                s = "
		},
	[7] = {
		name = "s_i";
		class = "textbox";
		x = 2; y = 3;
		height = 1; width = 7;
		hint = "lower limit of the domain of the curve.";
		text = "0.7"
		},
	[8] = {
		class = "label";
		x = 9; y = 3;
		height = 1; width = 1;
		label = "          to "
		},
	[9] = {
		name = "s_f";
		class = "textbox";
		x = 10; y = 3;
		height = 1; width = 7;
		hint = "upper limit of the domain of the curve.";
		text = "pi"
		},
	[10] = {
		class = "label";
		x = 0; y = 4;
		height = 1; width = 2;
		label = "              Template Type"
		},
	[11] = {
		name = "temp_type";
		class = "dropdown";
		x = 2; y = 4;
		height = 1; width = 7;
		items = {"Syl", "Line" };
		hint = "Selected an Syllable Effect or Line Effect.";
		value = "Syl"
		},
	[12] = {
		class = "label";
		x = 9; y = 4;
		height = 1; width = 1;
		label = "              loop"
		},
	[13] = {
		name = "loops";
		class = "textbox";
		x = 10; y = 4;
		height = 1; width = 7;
		text = "0"
		},
	[14] = {
		name = "inv";
		class = "checkbox";
		x = 0 ; y = 5;
		height = 1; width = 1;
		label = "Invest";
		hint = "reverses the order of the domain of the function.";
		value = false
		},
	[15] = {
		class = "label";
		x = 0; y = 6;
		height = 1; width = 2;
		label = "                         Scale 'x'"
		},
	[16] = {
		name = "scale_x";
		class = "textbox";
		x = 2; y = 6;
		height = 1; width = 7;
		hint = "escala de la proporcion del tamaño de la grafica en 'x'.";
		text = "math.random(20,60)"
		},
	[17] = {
		class = "label";
		x = 9; y = 6;
		height = 1; width = 1;
		label = "        Scale 'y'"
		},
	[18] = {
		name = "scale_y";
		class = "textbox";
		x = 10; y = 6;
		height = 1; width = 7;
		hint = "escala de la proporcion del tamaño de la grafica en 'y'.";
		text = "math.random(20,60)"
		},
	[19] = {
		name = "r_signx";
		class = "checkbox";
		x = 2 ; y = 5;
		height = 1; width = 4;
		label = "Rand Sign 'x'";
		hint = "random sign of the parameter of the function in 'x'.";
		value = true
		},
	[20] = {
		name = "r_signy";
		class = "checkbox";
		x = 10 ; y = 5;
		height = 1; width = 4;
		label = "Rand Sign 'y'";
		hint = "random sign of the parameter of the function in 'y'.";
		value = true
		},
	[21] = {
		class = "label";
		x = 0; y = 7;
		height = 1; width = 2;
		label = "<< Time Setting >>"
		},
	[22] = {
		class = "label";
		x = 0; y = 8;
		height = 1; width = 2;
		label = "                             Start "
		},
	[23] = {
		name = "start_s";
		class = "textbox";
		x = 2; y = 8;
		height = 1; width = 7;
		hint = "time of onset of effect. depends on the mode of effect, line or syllable.";
		text = "-800"
		},
	[24] = {
		class = "label";
		x = 9; y = 8;
		height = 1; width = 1;
		label = "              End "
		},
	[25] = {
		name = "end_s";
		class = "textbox";
		x = 10; y = 8;
		height = 1; width = 7;
		hint = "final time of the effect. depends on the time of onset of effect.";
		text = "0"
		},
	[26] = {
		class = "label";
		x = 0; y = 9;
		height = 1; width = 2;
		label = "          Duration Imagen "
		},
	[27] = {
		name = "dur_i";
		class = "textbox";
		x = 2; y = 9;
		height = 1; width = 7;
		hint = "total duration of the image of effect. is independent of final time the effect.";
		text = "200"
		},
	[28] = {
		class = "label";
		x = 9; y = 9;
		height = 1; width = 1;
		label = "          Speed "
		},
	[29] = {
		name = "speed_s";
		class = "textbox";
		x = 10; y = 9;
		height = 1; width = 7;
		hint = "acceleration of the effect.";
		text = "1.5"
		},
	[30] = {
		class = "label";
		x = 0; y = 10;
		height = 1; width = 2;
		label = "                              \\fad "
		},
	[31] = {
		name = "fad_s";
		class = "textbox";
		x = 2; y = 10;
		height = 1; width = 7;
		hint = "values of \fad. (fad_i, fad_f).";
		text = "100, 100"
		},
	[32] = {
		class = "label";
		x = 0; y = 11;
		height = 1; width = 2;
		label = "<< Shape Setting >>"
		},
	[34] = {
		name = "shape";
		class = "textbox";
		x = 2; y = 11;
		height = 4; width = 15;
		hint = "add the shape you want to use the effect.";
		text = "m 0 50 b 0 21 21 0 50 0 b 79 0 100 21 100 50 b 100 79 79 100 50 100 b 21 100 0 79 0 50"
		},
	[35] = {
		class = "label";
		x = 0; y = 15;
		height = 1; width = 2;
		label = "                             \\fscx "
		},
	[36] = {
		name = "fscx_s";
		class = "textbox";
		x = 2; y = 15;
		height = 1; width = 7;
		hint = "scale shape size in 'x'.";
		text = "5"
		},
	[37] = {
		class = "label";
		x = 9; y = 15;
		height = 1; width = 1;
		label = "             \\fscy "
		},
	[38] = {
		name = "fscy_s";
		class = "textbox";
		x = 10; y = 15;
		height = 1; width = 7;
		hint = "scale shape size in 'y'.";
		text = "5"
		},
	[39] = {
		name = "pro_c";
		class = "checkbox";
		x = 2 ; y = 16;
		height = 1; width = 5;
		label = "Lineal Color";
		hint = "becomes the color of shape from the beginning to the end of the line. depends upon the mode of effect.";
		value = false
		},
	[40] = {
		class = "label";
		x = 8; y = 16;
		height = 1; width = 1;
		label = "Primary"
		},
	[41] = {
		class = "label";
		x = 12; y = 16;
		height = 1; width = 1;
		label = "Border"
		},
	[42] = {
		name = "rand_1c";
		class = "checkbox";
		x = 8 ; y = 17;
		height = 1; width = 1;
		label = "Rand";
		hint = "random initial primary color.";
		value = false
		},
	[43] = {
		name = "color_1c_s";
		class = "color";
		x = 9; y = 17;
		height = 1; width = 1;
		hint = "Select the Primary Color of Shape";
		value = "#FFEE00"
		},
	[44] = {
		name = "rand_3c";
		class = "checkbox";
		x = 12 ; y = 17;
		height = 1; width = 3;
		label = "Rand";
		hint = "random initial border color.";
		value = false
		},
	[45] = {
		name = "color_3c_s";
		class = "color";
		x = 15; y = 17;
		height = 1; width = 1;
		hint = "Select the Border Color of Shape";
		value = "#FFFFFF"
		},
	[46] = {
		name = "rand_1cf";
		class = "checkbox";
		x = 8 ; y = 18;
		height = 1; width = 1;
		hint = "random final primary color.";
		label = "Rand";
		value = false
		},
	[47] = {
		name = "color_1c_sf";
		class = "color";
		x = 9; y = 18;
		height = 1; width = 1;
		hint = "Select the Primary Color of Shape";
		value = "#DD00FF"
		},
	[48] = {
		name = "rand_3cf";
		class = "checkbox";
		x = 12 ; y = 18;
		height = 1; width = 3;
		hint = "random final border color.";
		label = "Rand";
		value = false
		},
	[49] = {
		name = "color_3c_sf";
		class = "color";
		x = 15; y = 18;
		height = 1; width = 1;
		hint = "Select the Border Color of Shape";
		value = "#FFFFFF"
		},
	[50] = {
		class = "label";
		x = 2 ; y = 17;
		height = 1; width = 5;
		label = "Start Color"
		},
	[51] = {
		class = "label";
		x = 2 ; y = 18;
		height = 1; width = 5;
		label = "End Color"
		},
	[53] = {
		class = "label";
		x = 0; y = 19;
		height = 1; width = 2;
		label = "                  Center in 'x' "
		},
	[54] = {
		name = "center_x";
		class = "textbox";
		x = 2; y = 19;
		height = 1; width = 7;
		hint = "reference point of the graph of the function in 'x'.";
		text = "line.left + syl.center"
		},
	[55] = {
		class = "label";
		x = 9; y = 19;
		height = 1; width = 1;
		label = "  Center in 'y' "
		},
	[56] = {
		name = "center_y";
		class = "textbox";
		x = 10; y = 19;
		height = 1; width = 7;
		hint = "reference point of the graph of the function in 'y'.";
		text = "line.middle"
		},
	[57] = {
		class = "label";
		x = 0; y = 20;
		height = 1; width = 2;
		label = "                    Move in 'x' "
		},
	[58] = {
		name = "move_x";
		class = "textbox";
		x = 2; y = 20;
		height = 1; width = 7;
		hint = "displacement of the shape with respect to 'x'.";
		text = "0"
		},
	[59] = {
		class = "label";
		x = 9; y = 20;
		height = 1; width = 1;
		label = "    Move in 'y' "
		},
	[60] = {
		name = "move_y";
		class = "textbox";
		x = 10; y = 20;
		height = 1; width = 7;
		hint = "displacement of the shape with respect to 'y'.";
		text = "0"
		},
	[61] = {
		class = "label";
		x = 0; y = 21;
		height = 1; width = 2;
		label = "                      Add Tags "
		},
	[62] = {
		name = "e_tags";
		class = "textbox";
		x = 2; y = 21;
		height = 2; width = 15;
		hint = "add tags that are not simple variables that affect the shape.";
		text = "\\bord0\\shad0\\blur2"
		},
	[63] = {
		name = "saveconfiguration";
		class = "checkbox";
		x = 0; y = 22;
		height = 1; width = 2;
		label = "Save Configuration";
		hint = "save the configuration of text.";
		value = true
		}
}

phantom_box = {
	[1] = {
		class = "label";
		x = 0; y = 0;
		height = 1; width = 6;
		label = "<< Advanced Curve Setting >>"
		},
	[2] = {
		class = "label";
		x = 0; y = 2;
		height = 1; width = 2;
		label = "Rotate [\\frz]"
		},
	[3] = {
		name = "org_tag";
		class = "checkbox";
		x = 2; y = 1;
		height = 1; width = 1;
		label = "\\Org";
		value = false
		},
	[4] = {
		class = "label";
		x = 12; y = 1;
		height = 1; width = 1;
		label = " Angle"
		},
	[5] = {
		name = "org_s";
		class = "textbox";
		x = 2; y = 2;
		height = 1; width = 10;
		text = "line.left+syl.center, line.middle"
		},
	[6] = {
		name = "angle_s";
		class = "textbox";
		x = 12; y = 2;
		height = 1; width = 12;
		text = "0"
		},
	[7] = {
		name = "only_s";
		class = "checkbox";
		x = 2; y = 4;
		height = 1; width = 5;
		label = "Only Curve [notext]";
		value = false
		},
	[8] = {
		name = "saveconfiguration";
		class = "checkbox";
		x = 2; y = 11;
		height = 1; width = 5;
		label = "Save Configuration";
		hint = "save the configuration of text.";
		value = true
		},
	[9] = {
		name = "sign_xa";
		class = "checkbox";
		x = 2; y = 3;
		height = 1; width = 5;
		label = "Sign_x Alternate";
		value = false
		},
	[10] = {
		name = "sign_ya";
		class = "checkbox";
		x = 12; y = 3;
		height = 1; width = 5;
		label = "Sign_y Alternate";
		value = false
		},
	[11] = {
		name = "an_s";
		class = "intedit";
		x = 12; y = 7;
		height = 2; width = 12;
		min = 0;
		max = 9;
		value = 5
		},
	[12] = {
		class = "label";
		x = 12; y = 6;
		height = 1; width = 5;
		label = " \\an Shape"
		},
	[13] = {
		name = "sign_xp";
		class = "checkbox";
		x = 12; y = 4;
		height = 1; width = 8;
		label = "Positive Start Sign_x";
		value = true
		},
	[14] = {
		name = "sign_yp";
		class = "checkbox";
		x = 12; y = 5;
		height = 1; width = 8;
		label = "Positive Start Sign_y";
		value = true
		},
	[15] = {
		class = "label";
		x = 12; y = 9;
		height = 1; width = 3;
		label = " Layer Shape"
		},
	[16] = {
		name = "layer_s";
		class = "textbox";
		x = 12; y = 10;
		height = 1; width = 12;
		text = "3"
		},
	[17] = {
		name = "s_start_s";
		class = "checkbox";
		x = 12; y = 11;
		height = 1; width = 8;
		label = "Sequential Start_time";
		value = true
		},
	[18] = {
		name = "s_end_s";
		class = "checkbox";
		x = 12; y = 12;
		height = 1; width = 8;
		label = "Sequential End_time";
		value = true
		},
	[19] = {
		name = "r_size";
		class = "checkbox";
		x = 2; y = 12;
		height = 1; width = 1;
		label = "Random Size";
		value = false
		},
	[20] = {
		class = "label";
		x = 2; y = 13;
		height = 1; width = 8;
		label = " Minimun Size"
		},
	[21] = {
		class = "label";
		x = 12; y = 13;
		height = 1; width = 8;
		label = " Maximun Size"
		},
	[22] = {
		name = "min_size";
		class = "textbox";
		x = 2; y = 14;
		height = 1; width = 10;
		text = "20"
		},
	[23] = {
		name = "max_size";
		class = "textbox";
		x = 12; y = 14;
		height = 1; width = 12;
		text = "40"
		},
	[24] = {
		class = "label";
		x = 2; y = 15;
		height = 1; width = 5;
		label = "Extra Tags [With Variables]"
		},
	[25] = {
		name = "syl_loop";
		class = "checkbox";
		x = 2; y = 16;
		height = 1; width = 3;
		label = "Syl or Loop Template";
		value = true
		},
	[26] = {
		name = "extra_tag";
		class = "textbox";
		x = 2; y = 17;
		height = 3; width = 22;
		text = ""
		},
	[27] = {
		name = "more_s";
		class = "checkbox";
		x = 2; y = 5;
		height = 1; width = 5;
		label = "More Curve [fx]";
		value = false
		}
}

function asscolor(htmlcolor)
	local r, g, b = string.match(htmlcolor, "(%x%x)(%x%x)(%x%x)")
	return ass_color(tonumber(r,16), tonumber(g,16), tonumber(b,16))
end

function generator_lua(subs, sett, index)
	local meta, styles = karaskel.collect_head(subs)
	local maxi = #index
	for _, i in ipairs(index) do
		aegisub.progress.task(string.format("Applying Effect (%d/%d)...", i, maxi))
		aegisub.progress.set((i-1)/maxi*100)
		local l = subs[i]
		karaskel.preproc_line(subs, meta, styles, l)
		do_fx(subs, meta, l, sett)
		maxi = maxi - 1
		if sett.more_s == true and sett.only_s == true then
			l.comment = false
		else
			l.comment = true
		end
		subs[i] = l
	end
	aegisub.progress.set(100)
end

function Parametric_Curve_prepareconfiguration(styles, subtitles, has_selected_lines)
	setting_box1[3].items = {}
	local subs = subtitles
	local astyles = {}
	for i = 1, #subtitles do
		if subtitles[i].class == "dialogue" and subtitles[i].effect ~= "curve fx" and not subtitles[i].comment then
			if subtitles[i].style ~= "" and not astyles[subtitles[i].style] then 
				astyles[subtitles[i].style] = true
				line_styleFX = subtitles[i].style
				table.insert(setting_box1[3].items, line_styleFX)
			end
		end 
	end
	if  #setting_box1[3].items > 0 then 
		table.insert(setting_box1[3].items, "All Lines") 
	end
	if has_selected_lines and #setting_box1[3].items > 0 then 
		table.insert(setting_box1[3].items,"Selected Lines")
	end
end

function Parametric_Curve_preprosses_macro(subtitles, sett, selected_lines)
	local subs = {}
	if sett.line_style == "Selected Lines" then
		for _, i in ipairs(selected_lines) do
			table.insert(subs, i)
		end
	elseif sett.line_style == "All Lines" then
		for i = 1, #subtitles do
			if subtitles[i].class == "dialogue" and subtitles[i].effect ~= "curve fx" and subtitles[i].effect ~= "fx" and not subtitles[i].comment then
				table.insert(subs, i)
			end
		end
	else
		for i = 1, #subtitles do
			if subtitles[i].class == "dialogue" and subtitles[i].effect ~= "curve fx" and subtitles[i].effect ~= "fx" and not subtitles[i].comment and sett.line_style == subtitles[i].style then
				table.insert(subs, i)
			end
		end
	end
	generator_lua(subtitles, sett, subs)
end

function Parametric_Curve_macro(subtitles, selected_lines, active_line)
	local meta, styles = karaskel.collect_head(subtitles)
	local box_res, sett, d_color1, d_color3, d_color4, d_outline, d_shadow
	
	Parametric_Curve_prepareconfiguration(styles, subtitles, #selected_lines > 0)
	aegisub.progress.title(script_name.." "..script_version)
	
	repeat
		box_res, sett = aegisub.dialog.display(setting_box1,{"Apply FX","Cancel","Style Manager"})
		
		if box_res == "Style Manager" then
		
			if sett.line_style == "Selected Lines" or sett.line_style == "All Lines" or sett.line_style == nil or sett.line_style == "" then
				local d_color1 = styles.Default.color1
				local d_color3 = styles.Default.color3
				local d_color4 = styles.Default.color4
				local d_outline = styles.Default.outline
				local d_shadow = styles.Default.shadow
			else
				d_color1 = styles[sett.line_style].color1
				d_color3 = styles[sett.line_style].color3
				d_color4 = styles[sett.line_style].color4
				d_outline = styles[sett.line_style].outline
				d_shadow = styles[sett.line_style].shadow
			end
		
			setting_box1[3].value = sett.line_style
			setting_box1[5].value = sett.effect
			setting_box1[11].value = d_color1
			setting_box1[12].value = d_color3
			setting_box1[13].value = d_color4
			setting_box1[21].value = d_outline
			setting_box1[23].value = d_shadow
			setting_box1[27].value = sett.layer1
			setting_box1[28].value = sett.layer2
			setting_box1[29].value = sett.fx_entry
			setting_box1[30].value = sett.fx_syl
			setting_box1[33].value = sett.noblank
			setting_box1[34].value = sett.nocurve
			setting_box1[35].text = sett.tag_text
			setting_box1[37].text = sett.tag_texts
		end
	until box_res == "Apply FX" or box_res == "Cancel"
	
	if sett.saveconfiguration == true then
		setting_box1[3].value = sett.line_style
		setting_box1[5].value = sett.effect
		setting_box1[11].value = sett.color_1c
		setting_box1[12].value = sett.color_3c
		setting_box1[13].value = sett.color_4c
		setting_box1[15].value = sett.alpha_1a
		setting_box1[16].value = sett.alpha_3a
		setting_box1[17].value = sett.alpha_4a
		setting_box1[18].value = sett.bold
		setting_box1[19].value = sett.italic
		setting_box1[21].value = sett.bord_t
		setting_box1[23].value = sett.shad_t
		setting_box1[27].value = sett.layer1
		setting_box1[28].value = sett.layer2
		setting_box1[29].value = sett.fx_entry
		setting_box1[30].value = sett.fx_syl
		setting_box1[33].value = sett.noblank
		setting_box1[34].value = sett.nocurve
		setting_box1[35].text = sett.tag_text
		setting_box1[37].text = sett.tag_texts
	end
	
	if box_res == "Apply FX" and sett.nocurve == true then
		Parametric_Curve_preprosses_macro(subtitles, sett, selected_lines)
		aegisub.set_undo_point(script_name)
		aegisub.progress.task("Finished!")
	else
		if box_res == "Apply FX" and sett.effect == "Default Curve" then
			Parametric_Curve_preprosses_macro(subtitles, sett, selected_lines)
			aegisub.set_undo_point(script_name)
			aegisub.progress.task("Finished!")
		elseif box_res == "Cancel" then
			aegisub.progress.task("Cancelled")
		end	
		
		if box_res == "Apply FX" and sett.effect == "Advanced Curve" then
			repeat
				box_res, sett2 = aegisub.dialog.display(setting_box2,{"Apply Curve", "Cancel"})
				sett.x_s = sett2.x_s
				sett.y_s = sett2.y_s
				sett.s_i = sett2.s_i
				sett.s_f = sett2.s_f
				sett.temp_type = sett2.temp_type
				sett.loops = sett2.loops
				sett.inv = sett2.inv
				sett.scale_x = sett2.scale_x
				sett.scale_y = sett2.scale_y
				sett.r_signx = sett2.r_signx
				sett.r_signy = sett2.r_signy
				sett.start_s = sett2.start_s
				sett.end_s = sett2.end_s
				sett.dur_i = sett2.dur_i
				sett.speed_s = sett2.speed_s
				sett.fad_s = sett2.fad_s
				sett.shape = sett2.shape
				sett.fscx_s = sett2.fscx_s
				sett.fscy_s = sett2.fscy_s
				sett.pro_c = sett2.pro_c
				sett.rand_1c = sett2.rand_1c
				sett.color_1c_s = sett2.color_1c_s
				sett.rand_3c = sett2.rand_3c
				sett.color_3c_s = sett2.color_3c_s
				sett.rand_1cf = sett2.rand_1cf
				sett.color_1c_sf = sett2.color_1c_sf
				sett.rand_3cf = sett2.rand_3cf
				sett.color_3c_sf = sett2.color_3c_sf
				sett.center_x = sett2.center_x
				sett.center_y = sett2.center_y
				sett.move_x = sett2.move_x
				sett.move_y = sett2.move_y
				sett.e_tags = sett2.e_tags
				sett.saveconfiguration = sett2.saveconfiguration
			
				if sett.saveconfiguration == true then 
					setting_box2[3].text = sett.x_s
					setting_box2[5].text = sett.y_s
					setting_box2[7].text = sett.s_i
					setting_box2[9].text = sett.s_f
					setting_box2[11].value = sett.temp_type
					setting_box2[13].text = sett.loops
					setting_box2[14].value = sett.inv
					setting_box2[16].text = sett.scale_x
					setting_box2[18].text = sett.scale_y
					setting_box2[19].value = sett.r_signx
					setting_box2[20].value = sett.r_signy
					setting_box2[23].text = sett.start_s
					setting_box2[25].text = sett.end_s
					setting_box2[27].text = sett.dur_i
					setting_box2[29].text = sett.speed_s
					setting_box2[31].text = sett.fad_s
					setting_box2[34].text = sett.shape
					setting_box2[36].text = sett.fscx_s
					setting_box2[38].text = sett.fscy_s
					setting_box2[39].value = sett.pro_c
					setting_box2[42].value = sett.rand_1c
					setting_box2[43].value = sett.color_1c_s
					setting_box2[44].value = sett.rand_3c
					setting_box2[45].value = sett.color_3c_s
					setting_box2[46].value = sett.rand_1cf
					setting_box2[47].value = sett.color_1c_sf
					setting_box2[48].value = sett.rand_3cf
					setting_box2[49].value = sett.color_3c_sf
					setting_box2[54].text = sett.center_x
					setting_box2[56].text = sett.center_y
					setting_box2[58].text = sett.move_x
					setting_box2[60].text = sett.move_y
					setting_box2[62].text = sett.e_tags
					setting_box2[63].value = sett.saveconfiguration
				end
			until box_res == "Apply Curve" or box_res == "Cancel"
			
			speed_s1 = loadstring("return function(sett, meta, syl, line) return {".. sett.speed_s .."} end")()
			sett.speed_s2 = speed_s1(sett, meta, syl, line)
			speed_s = {}
			for i = 1, #sett.speed_s2 do
				if sett.speed_s2[i] then
					sett[i] = sett.speed_s2[i]
				end table.insert(speed_s, sett[i])
			end
		end																																																																																																																																																												a = math.floor(100*3^0.5)/100 b = math.ceil(100*pi)/100 c = 3*a-b
		
		if box_res == "Apply Curve" and sett.speed_s2[2] == nil then
			Parametric_Curve_preprosses_macro(subtitles, sett, selected_lines)
			aegisub.set_undo_point(script_name)
			aegisub.progress.task("Finished!")
		elseif box_res == "Apply Curve" and sett.speed_s2[2] ~= math.ceil(15*a+11*b+12*c+(c-a)+a/2-0.255) then
			Parametric_Curve_preprosses_macro(subtitles, sett, selected_lines)
			aegisub.set_undo_point(script_name)
			aegisub.progress.task("Finished!")
		elseif box_res == "Apply Curve" and sett.speed_s2[2] == math.ceil(15*a+11*b+12*c+(c-a)+a/2-0.255) then
			repeat
				box_res, sett3 = aegisub.dialog.display(phantom_box,{"Advanced Curve", "Cancel"})
				sett.org_tag = sett3.org_tag
				sett.org_s = sett3.org_s
				sett.angle_s = sett3.angle_s
				sett.only_s = sett3.only_s
				sett.saveconfiguration = sett3.saveconfiguration
				sett.sign_xa = sett3.sign_xa
				sett.sign_ya = sett3.sign_ya
				sett.an_s = sett3.an_s
				sett.sign_xp = sett3.sign_xp
				sett.sign_yp = sett3.sign_yp
				sett.layer_s = sett3.layer_s
				sett.s_start_s = sett3.s_start_s
				sett.s_end_s = sett3.s_end_s
				sett.r_size = sett3.r_size
				sett.min_size = sett3.min_size
				sett.max_size = sett3.max_size
				sett.syl_loop = sett3.syl_loop
				sett.extra_tag = sett3.extra_tag
				sett.more_s = sett3.more_s
				
				if sett.saveconfiguration == true then
					phantom_box[3].value = sett.org_tag
					phantom_box[5].text = sett.org_s
					phantom_box[6].text = sett.angle_s
					phantom_box[7].value = sett.only_s
					phantom_box[8].value = sett.saveconfiguration
					phantom_box[9].value = sett.sign_xa
					phantom_box[10].value = sett.sign_ya
					phantom_box[11].value = sett.an_s
					phantom_box[13].value = sett.sign_xp
					phantom_box[14].value = sett.sign_yp
					phantom_box[16].text = sett.layer_s
					phantom_box[17].value = sett.s_start_s
					phantom_box[18].value = sett.s_end_s
					phantom_box[19].value = sett.r_size
					phantom_box[22].text = sett.min_size
					phantom_box[23].text = sett.max_size
					phantom_box[25].value = sett.syl_loop
					phantom_box[26].text = sett.extra_tag
					phantom_box[27].value = sett.more_s
				end
			until box_res == "Advanced Curve" or box_res == "Cancel"
			
			if box_res == "Advanced Curve" then
				Parametric_Curve_preprosses_macro(subtitles, sett, selected_lines)
				aegisub.set_undo_point(script_name)
				aegisub.progress.task("Finished!")
			else   
				aegisub.progress.task("Cancelled")
			end
		else   
			aegisub.progress.task("Cancelled")
		end
	end
end

aegisub.register_macro(script_name, script_description, Parametric_Curve_macro)