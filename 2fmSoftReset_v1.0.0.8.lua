local offset = 0x56450E

function _OnInit()
	if ReadInt(0x2A5A056-offset) > 0 and ReadInt(0x2A59056-offset) == 0 then
		offset = 0x56550E
		print("Detected JP version. If this is incorrect, try reloading at a different time")
	else
		print("Detected GLOBAL version. If this is incorrect, try reloading at a different time")
	end
end

function _OnFrame()
    local input = ReadInt(0x29F89B0-0x56450E)
    if (input == 247042) then 
        WriteByte(0xAB841A-0x56450E, 0x1)
        WriteInt(0x751310-0x56454E, 0x00000001)
    end
end