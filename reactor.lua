-- V1.0.1
local turbines = {
   "BigReactors-Turbine_15", --#1
   "BigReactors-Turbine_4", --#2
   "BigReactors-Turbine_5", --#3
   "BigReactors-Turbine_6", --#4
   "BigReactors-Turbine_7", --#5
   "BigReactors-Turbine_8", --#6
   "BigReactors-Turbine_9", --#7
   "BigReactors-Turbine_10", --#8
   "BigReactors-Turbine_11", --#9
   "BigReactors-Turbine_12", --#10
   "BigReactors-Turbine_13", --#11
   "BigReactors-Turbine_14", --#12
}

local reactors = {
   "BigReactors-Reactor_3", --#1
   "BigReactors-Reactor_4", --#2
   "BigReactors-Reactor_5", --#3
   "BigReactors-Reactor_6", --#4
   "BigReactors-Reactor_7", --#5
   "BigReactors-Reactor_8", --#6
   "BigReactors-Reactor_10", --#7
   "BigReactors-Reactor_9", --#8
   "BigReactors-Reactor_12", --#9
   "BigReactors-Reactor_11", --#10
   "BigReactors-Reactor_14", --#11
   "BigReactors-Reactor_13", --#12
}


function myTime ()
   return os.day() + os.time()/24
end

local myScr = peripheral.wrap("right")

local cT,Cr
local currentIndex = 2 --Should always be >= 2 and <= 12
local turbineMaxInBuffer = 1000000
local minRodSetting = 83
local maxRodSetting = 100
local timeOfLastAction = myTime()

myScr.setCursorPos(1,1)
myScr.clear()
shell.run("resetAll")
peripheral.find( "BigReactors-Reactor", function(name,object) return name==reactors[1] end ).setAllControlRodLevels(82)

while 1 do
   foundLowTurb = false
   print("Searching Turbines...")
   for i = 1,currentIndex-1 do
      cT = peripheral.find( "BigReactors-Turbine", function(name,object) return name==turbines[i] end )
      cR = peripheral.find( "BigReactors-Reactor", function(name,object) return name==reactors[i] end )
      if cT.getEnergyStored() < 0.99 *  turbineMaxInBuffer then
         foundLowTurb = true
         print("Found low@"..i)
      end
   end

   cR = peripheral.find( 
      "BigReactors-Reactor", 
      function(name,object) return name==reactors[currentIndex] end 
      )

   if foundLowTurb then
      timeOfLastAction = myTime()
      print("Power up")
      
      cR.setAllControlRodLevels( math.max( cR.getControlRodLevel(1) - 1, 82 ) )

      if cR.getControlRodLevel(1) <= minRodSetting then
         print("Next Reactor")
         -- Index up a reactor if we can
         currentIndex = math.min( currentIndex + 1, 12 )
         -- the next loop will handle this 
      end
   elseif myTime() - timeOfLastAction > 1/24 then
      timeOfLastAction = myTime()
      print("Power down")
      cR.setAllControlRodLevels( math.min( cR.getControlRodLevel(1) + 1, 100 ) )

      if cR.getControlRodLevel(1) >= maxRodSetting then
         print("Previous Reactor")
         -- Index down a reactor if we can
         currentIndex = math.max( currentIndex - 1, 2 )
         -- the next loop will handle this 
      end

   end
   print("Turbine:"..currentIndex)
   print(string.format("Power: %f%%",(100-cR.getControlRodLevel(1))*5.555 ) )
      
   sleep(60)
end
return

-- while 1 do
--    --local i = 1 --do I need this?
--    for i=1,#turbines do
--       myScr.scroll(-1)
--       myScr.setCursorPos(1,1)
--       myScr.write("Index:"..i)
--       print(turbines[i])
--       print(reactors[i])
--       curTurbine = peripheral.find( "BigReactors-Turbine", function(name,object) return name==turbines[i] end )
--       curReactor = peripheral.find( "BigReactors-Reactor", function(name,object) return name==reactors[i] end )

--       -- curTurbine.setActive(true)
--       curReactor.setAllControlRodLevels(82)
--       -- curReactor.setActive(false)
--    end
--    sleep(1)
--    break
-- end